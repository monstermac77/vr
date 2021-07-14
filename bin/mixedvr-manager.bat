:: don't print out every command as its executed
@echo off

:: allow variables to be changed inside loops
setlocal EnableDelayedExpansion

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: TODO: allow users to specify what kind of headset, right now this script only supports WMR (note: will need to modify the uninstall script too)
:: TODO: minimize WMR immediately 
:: TODO: Tetracyclic should make it so that lighthouse-keeper has its own config file that it automatically populates with the MAC addresses; it automatically runs "discover" on first run, and populates this, so the user doesn't have to do this setup
:: TODO: Tetracyclic, in addition to above, should detect what version of lighthouses they have
:: TODO: submit our files to Microsoft for approval: https://www.microsoft.com/en-us/wdsi/filesubmission
:: TODO: add logging

:: Notes for debugging: 
:: * Prevent the script from starting on startup (or kill it) and then run the .bat file so you can see the output (never click in the window, just do command+tab)
:: * When debugging syntax errors, comment the line at the top of the file
:: * To debug the script crashing, comment the "@echo off" at the top, then run the `.bat` this way so you can see what line it's crashing on: `cmd /k "cd c:\myfolder & mixedvr-manager.bat"`
:: * The most common case for crashing seems to be adding parens inside comments that are inside for/if statements...

:::::::: release process ::::::::
:: `git tag v1.x`
:: `git push --tags`
:: go to github and edit the release details
:::::::::::::::::::::::::::::::


::::::::::
:: main ::
::::::::::

title MixedVR Manager

:: running .bat files with admin rights appears to prevent calls to external scripts (e.g. lighthouse-keeper, USBDeview) using relative paths
:: so this gets the working directory so we can use absolute paths, i.e. "%mixedVRManagerDirectory%[application]", as you can see below
set mixedVRManagerDirectory=%~dp0

:: goto marker (start of loop)
:whileTrueLoop

:: calling config here, which allows hotswapping of configurations
:: note the ..\ as we are in \bin and config is up a folder (in the root)
call "%mixedVRManagerDirectory%..\config.bat"

:: check to see if steamvr is running (thank you https://stackoverflow.com/a/1329790/2611730)
tasklist /FI "IMAGENAME eq vrserver.exe" 2>NUL | find /I /N "vrserver.exe">NUL
if "%ERRORLEVEL%"=="0" (set steamvrStatus=running) else (set steamvrStatus=quit)

:: handle the first loop case; we'll only detect changes to the running status since the script started, not on first run
if "%steamvrLastKnownStatus%" == "" (
	set steamvrLastKnownStatus=%steamvrStatus%
	echo Initializing: at time of MixedVR-Manager start, SteamVR was: %steamvrStatus%
	echo MixedVR-Manager is now waiting for events...
	goto whileTrueLoop
)

:: handle the case where there is no change
if "%steamvrStatus%" == "%steamvrLastKnownStatus%" (
	timeout 1 >NUL
	goto whileTrueLoop
)

:: if we got to this point, then that means that SteamVR's status has just changed
:: so we call our stateChanged function, which effectively passes the the new state
:: in as "steamvrStatus"
echo MixedVR-Manager detected that SteamVR is now: %steamvrStatus%
goto stateChanged






:::::::::::::::
:: functions ::
:::::::::::::::



:: function that's called when the user has just launched/quit SteamVR
:: "parameterized" by whatever value is set in steamvrStatus
:stateChanged

if "%steamvrStatus%" == "quit" (
	:: this means they just shut down SteamVR, which means we'll also want to clean up 
	:: any other applications that won't be shut down automatically, like WMR
	:: note: we decide to do this here because 
	:: a. it makes the shutdown process feel more reponsive and 
	:: b. it means we are shutting down mixed reality portal before disabling the headset which is good
	::    because then they'll never see all the various errors that often make people think we bricked their headset
	::    for example, error 7-14, error 2-22, etc.
	taskkill /f /im "MixedRealityPortal.exe"
)

:: toggle the HMD state
if "%steamvrStatus%" == "running" (set desiredHMDUSBAction=enable) else (set desiredHMDUSBAction=disable)
:: allow this feature to be skipped if the user desires
if "%allowHMDManagement%" == "true" (
	:: toggle state of the USB that the headset is plugged into
	echo MixedVR-Manager is changing state of USB device, the HMD, to /!desiredHMDUSBAction!...
	"%mixedVRManagerDirectory%USBDeview.exe" /RunAsAdmin /!desiredHMDUSBAction! "HoloLens Sensors"
) else (
	echo MixedVR-Manager is skipping changing state of the HMD to %desiredHMDUSBAction%, per user's configuration
)

:: toggle lighthouse state
if "%steamvrStatus%" == "running" (set desiredLighthouseState=on) else (set desiredLighthouseState=off)
:: allow this feature to be skipped if the user desires
if "%allowLighthouseManagement%" == "true" (
	echo MixedVR-Manager is turning lighthouses v%lighthouseVersion% %desiredLighthouseState%...
	if "%lighthouseVersion%" == "2.0" (
		FOR %%A IN (%lighthouseMACAddressList%) DO (
			start /B %mixedVRManagerDirectory%lighthouse-keeper.exe %desiredLighthouseState% 2 %VAR1%%%A
		)
	)
	if "%lighthouseVersion%" == "1.0" (
		FOR %%A IN (%lighthouseMACAddressList%) DO (
			start /B %mixedVRManagerDirectory%lighthouse-keeper.exe %desiredLighthouseState% 1 %VAR1%%%A
		)
	)
	:WaitForLighthouseKeeper
	tasklist /FI "IMAGENAME eq lighthouse-keeper.exe" 2>NUL | find /I /N "lighthouse-keeper.exe">NUL
	if "%ERRORLEVEL%"=="0" (
		goto WaitForLighthouseKeeper
	) else (
		goto DoneForLighthouseKeeper
	)
) else (
	echo MixedVR-Manager is skipping changing state of the lighthouses to %desiredLighthouseState%, per user's configuration
	if "%steamvrStatus%" == "running" (
		:: we have to wait some time though for SteamVR to launch
		:: otherwise we try killing it before it has started, which ends up with us having never
		:: restarted it. The symptom for this is SteamVR is unable to detect the HMD even though it's enabled.
		:: TODO: could improve this by doing the same waiting method we do for room setup, since it might take longer than
		:: x seconds for SteamVR to start up on some people's machines. If we do this method, we should take it out of this
		:: if statement and just apply it to all users, not just those not using lighthouses
		echo Waiting %maxLaunchTimeForSteamVR% seconds for SteamVR to launch...
		timeout %maxLaunchTimeForSteamVR% >NUL
	)
)
:DoneForLighthouseKeeper

:: restore SteamVR home state (if the user has added SAVE files)
if exist "%mixedVRManagerDirectory%..\userdata\SAVE\save_game_steamvr_home.sav" (
	echo MixedVR-Manager is overwriting the existing SteamVR Home layout with the user specified SteamVR Home...
	:: TODO bug: now that we're absolute pathing, this just straight up isn't working when there's a space in the name
	:: need to figure it out, originally this was just: for %%f in userdata\SAVE\* do 
	for %%f in (%mixedVRManagerDirectory%..\userdata\SAVE\*) do (
		xcopy /y %%f "%steamVRPath%\tools\steamvr_environments\game\steamtours\SAVE"
	)
)

:: restore SteamVR chaperone bounds state (if the user has added chaperone_info.vrchap)
if exist "%mixedVRManagerDirectory%..\userdata\chaperone_info.vrchap" (
	echo MixedVR-Manager is overwriting the existing SteamVR chaperone bounds with the user specified chaperone bounds...
	xcopy /y "%mixedVRManagerDirectory%..\userdata\chaperone_info.vrchap" "%steamPath%\config"
)

:: if we're switching to the running state, then we also need to restart SteamVR now that 
:: the headset has been enabled, this is because sadly SteamVR requires the headset to be connected when SteamVR is opened
:: note, we need to kill room setup if it's running because otherwise it may still be open when we 
:: start relying on it being quit when blocking on the next loop
if "%steamvrStatus%" == "running" (
	echo MixedVR-Manager is restarting SteamVR so SteamVR can detect the now powered on lighthouses and HMD.
	taskkill /f /im "steamvr_room_setup.exe" 2>NUL
	taskkill /f /im "vrmonitor.exe"
	taskkill /f /im "vrserver.exe"
	taskkill /f /im "OpenVR-SpaceCalibrator.exe" 2>NUL
	start steam://launch/250820/VR
	
	:: wait until SteamVR Room Setup starts, then kill it. if it doesn't start after 
	:: 90 seconds, assume it's never going to start, and just continue with the script's execution. 
	:: this is only applicable to MixedVR users who are forcing the SteamVR chaperone bounds
	:: note: this "delayed expansion" business really got me; apparently variables are 
	:: evaluated before execution time unless you do this and then use ! instead of %. Craziness.
	echo Waiting for SteamVR to start back up and to close Room Setup, will wait up to 90 seconds...
	for /L %%i in (1,1,90) do (
		tasklist /FI "IMAGENAME eq steamvr_room_setup.exe" 2>NUL | find /I /N "steamvr_room_setup.exe">NUL
		if "!ERRORLEVEL!"=="0" (set roomSetupStatus=running) else (set roomSetupStatus=quit)
		if "!roomSetupStatus!" == "running" (
			taskkill /f /im "steamvr_room_setup.exe" 
			goto roomSetupQuitComplete
		) else (
			timeout 1 >NUL
		)

		:: although not likely during real use sessions, it's possible that SteamVR is quit or crashes 
		:: before SteamVR Room setup is launched, or for non-MixedVR users, room setup will never launch
		:: therefore we allow an early exit from this 90 second loop if we detect that SteamVR has actually
		:: been quit already, allowing us to do the setup procedure now, rather than after 90 seconds, which is 
		:: a huge difference. Note that we have to wait for SteamVR to actually launch first
		:: TODO we could do this better, by checking to see if it has opened and then closed, but instead 
		:: we're just going to wait x seconds no matter what. This could end up being an issue soon, if a lot of 
		:: people have machines that can't launch SteamVR in that sensible default. In that cause, we should detect 
		:: when it opens and then closes
		if %%i geq %maxLaunchTimeForSteamVR% (
			tasklist /FI "IMAGENAME eq vrserver.exe" 2>NUL | find /I /N "vrserver.exe">NUL
			if "!ERRORLEVEL!"=="0" (set steamvrWaitingStatus=running) else (set steamvrWaitingStatus=quit)
			if "!steamvrWaitingStatus!" == "quit" (
				echo SteamVR was exited or crashed almost immediately after start of play session. User is likely testing script, has slow computer, or serious issue is occuring.
				goto roomSetupQuitComplete
			)
		)

	)
)

:: apparently you can't put markers inside if statements otherwise this would be a "break"
:: inside the if statement above for better readability....thanks batch
:roomSetupQuitComplete

:: mark the new last known state
set steamvrLastKnownStatus=%steamvrStatus%
echo MixedVR-Manager has finished procedure for SteamVR's state changing to: %steamvrStatus%
echo MixedVR-Manager is now waiting for events...

:: we've done our job, let's return to the main loop now
goto whileTrueLoop






