@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: TODO: allow users to specify what kind of headset, right now this script only supports WMR
:: TODO: users may want to disable certain features, not everyone might want the port disabled/enabled
:: TODO: figure out how to tuck this bat file in a "source" folder so that users only see the vbs and config file
:: TODO: minimize WMR immediately 
:: TODO: make a note in the readme that sometimes steam decides to create multiple chaperone universes, it's best to delete all but one and save that one
:: Note: when debugging syntax errors, comment the line at the top of the file

:::::::: release process ::::::::
:: `git tag v1.x`
:: `git push --tags`
:: compress "vr" folder as zip
:: upload it to github as a release for the corresponding tag, edit the details on Github
:::::::::::::::::::::::::::::::

::::::::::::
:: config ::
::::::::::::
call config.bat


::::::::::
:: main ::
::::::::::

title MixedVR Manager

:: goto marker (start of loop)
:whileTrueLoop 

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
	timeout %pollingRate% >NUL
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

:: toggle state of the USB that the headset is plugged into
if "%steamvrStatus%" == "running" (set desiredHMDUSBAction=enable) else (set desiredHMDUSBAction=disable)
echo MixedVR-Manager is changing state of USB device (the HMD) to /%desiredHMDUSBAction%...
bin\USBDeview.exe /RunAsAdmin /%desiredHMDUSBAction% "HoloLens Sensors"

:: toggle lighthouse state
if "%steamvrStatus%" == "running" (set desiredLighthouseState=on) else (set desiredLighthouseState=off)
for /L %%i in (1,1,%lighthouseConnectionAttempts%) do (
	echo MixedVR-Manager is turning lighthouses %desiredLighthouseState%...
	bin\lighthouse-v2-manager.exe %desiredLighthouseState% %lighthouseMACAddressList%
)

:: restore SteamVR home state (if the user has added SAVE files)
:: (note: user must have Steam installed on C drive, which is almost always going to be the case); could add this to the config.bat though
if exist userdata\SAVE\save_game_steamvr_home.sav (
	echo MixedVR-Manager is overwriting the existing SteamVR Home layout with the user specified SteamVR Home...
	for %%f in (userdata\SAVE\*) do (
		xcopy /y %%f "%steamVrPath%\tools\steamvr_environments\game\steamtours\SAVE"
	)
)

:: restore SteamVR chaperone bounds state (if the user has added chaperone_info.vrchap)
if exist userdata\chaperone_info.vrchap (
	echo MixedVR-Manager is overwriting the existing SteamVR chaperone bounds with the user specified chaperone bounds...
	xcopy /y userdata\chaperone_info.vrchap "%steamPath%\config"
)

:: if we're switching to the running state, then we also need to restart SteamVR now that 
:: the headset has been enabled, this is because sadly SteamVR requires the headset to be connected when SteamVR is opened
:: note, we need to kill room setup if it's running because otherwise it may still be open when we 
:: start relying on it being quit when blocking on the next loop
if "%steamvrStatus%" == "running" (
	echo MixedVR-Manager is restarting SteamVR so it SteamVR can detect the now powered on lighthouses and HMD.
	taskkill /f /im "steamvr_room_setup.exe" 2>NUL
	taskkill /f /im "vrmonitor.exe"
	taskkill /f /im "vrserver.exe"
	taskkill /f /im "OpenVR-SpaceCalibrator.exe" 2>NUL
	start steam://launch/250820/VR
	
	:: wait until SteamVR Room Setup starts, then kill it. if it doesn't start after 
	:: maxWaitTimeForRoomSetup seconds, assume it's never going to start, and just 
	:: continue with the script's execution. 
	:: note: this "delayed expansion" business really got me; apparently variables are 
	:: evaluated before execution time unless you do this and then use ! instead of %. Craziness.
	echo Waiting for SteamVR to start back up and to close Room Setup...
	setlocal EnableDelayedExpansion
	for /L %%i in (1,1,%maxWaitTimeForRoomSetup%) do (
		tasklist /FI "IMAGENAME eq steamvr_room_setup.exe" 2>NUL | find /I /N "steamvr_room_setup.exe">NUL
		if "!ERRORLEVEL!"=="0" (set roomSetupStatus=running) else (set roomSetupStatus=quit)
		if "!roomSetupStatus!" == "running" (
			taskkill /f /im "steamvr_room_setup.exe" 
			goto roomSetupQuitComplete
		) else (
			timeout 1 >NUL
		)
	)
) else (
	:: this means they just shut down SteamVR, which means we'll also want to clean up 
	:: any other applications that won't be shut down automatically, like WMR
	taskkill /f /im "MixedRealityPortal.exe"
)

:: apparently you can't put markers inside if statements otherwise this would be a "break"
:: inside the if statement above for better readability....thanks batch
:roomSetupQuitComplete

:: mark the new last known state
set steamvrLastKnownStatus=%steamvrStatus%
echo MixedVR-Manager has finished procedure for SteamVR's state changing to: %steamvrStatus%

:: we've done our job, let's return to the main loop now
goto whileTrueLoop






