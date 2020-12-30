@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:::::: config area ::::::

:: specify the MAC addresses of your lighthouses here. 
:: If you have an Android device, you can downnload the "Lighthouse Power Management" app to find the MAC addresses: https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm
:: Alternatively, you can:
:: 1. Open up "Command Prompt"
:: 2. Navigate to this directory, e.g. `cd C:\Users\Joe Puccio\Dropbox\big-bro-peep\vr\`
:: 3. Run `lighthouse-v2-manager.exe discover`
set lighthouseMACAddressList=FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED

:: maxWaitTimeForRoomSetup is how long (in seconds) you ever would expect it to take for the 
:: SteamVR Room Setup to open after a launch of SteamVR. This is essentially a timeout value.
:: Note: if you want to run SteamVR Room Setup, just launch VR, let this script kill it 
:: and then manually start it from the SteamVR status window. This script will only ever kill it 
:: once per VR session. If you're getting a loop where your basestations turn on and then off
:: when you start VR, that could be because this value is too low.
set maxWaitTimeForRoomSetup=60

:: pollingRate is how often (in seconds) this script will check to see if SteamVR has started running
:: so it can perform its actions; more frequent polling will use more CPU, but the actions will trigger
:: sooner after you start/quit SteamVR
set pollingRate=1 

:: TODO: allow users to specify what kind of headset, right now this script only supports WMR
:: TODO: users may want to disable certain features, not everyone might want the port disabled/enabled

::::::::::::::::::::::::


::: Start of Script :::
title MixedVR Manager

:: goto marker (start of loop)
:whileTrueLoop 

:: check to see if steamvr is running (thank you https://stackoverflow.com/a/1329790/2611730)
tasklist /FI "IMAGENAME eq vrserver.exe" 2>NUL | find /I /N "vrserver.exe">NUL
if "%ERRORLEVEL%"=="0" (set steamvrStatus=running) else (set steamvrStatus=quit)

:: handle the first loop case; we'll only detect changes to the running status since the script started, not on first run
if "%steamvrLastKnownStatus%" == "" (
	set steamvrLastKnownStatus=%steamvrStatus%
	echo Setting inits, at time of script start, SteamVR was %steamvrStatus%
	goto whileTrueLoop
)

:: handle the case where there is no change
if "%steamvrStatus%" == "%steamvrLastKnownStatus%" (
	timeout %pollingRate%
	goto whileTrueLoop
)

:: if we got to this point, then that means that SteamVR's status has just changed
:: so we call our stateChanged function, which effectively passes the the new state
:: in as "steamvrStatus"
echo Change detected in SteamVR running status. SteamVR is now %steamvrStatus%
goto stateChanged



:::::::::::::::
:: functions ::
:::::::::::::::


:: function that's called when the user has just launched/quit SteamVR
:: "parameterized" by whatever value is set in steamvrStatus
:stateChanged

:: toggle lighthouse state
if "%steamvrStatus%" == "running" (set desiredLighthouseState=on) else (set desiredLighthouseState=off)
echo Turning lighthouses %desiredLighthouseState%...
lighthouse-v2-manager.exe %desiredLighthouseState% %lighthouseMACAddressList%

:: toggle state of the USB that the headset is plugged into
if "%steamvrStatus%" == "running" (set desiredHMDUSBAction=enable) else (set desiredHMDUSBAction=disable)
echo Changing state of USB device (the HMD) to /%desiredHMDUSBAction%...
USBDeview.exe /RunAsAdmin /%desiredHMDUSBAction% "HoloLens Sensors"

:: if we're switching to the running state, then we also need to restart SteamVR now that 
:: the headset has been enabled, this is because sadly SteamVR requires the headset to be connected when SteamVR is opened
:: note, we need to kill room setup if it's running because otherwise it may still be open when we 
:: start relying on it being quit when blocking on the next loop
if "%steamvrStatus%" == "running" (
	echo Killing SteamVR and restarting it so it can detect the now powered on lighthouses and HMD.
	taskkill /f /im "steamvr_room_setup.exe"
	taskkill /f /im "vrmonitor.exe"
	taskkill /f /im "vrserver.exe"
	start steam://launch/250820/VR
)

:: wait until SteamVR Room Setup starts, then kill it. if it doesn't start after 
:: maxWaitTimeForRoomSetup seconds, assume it's never going to start, and just 
:: continue with the script's execution. 
:: note: this "delayed expansion" business really got me; apparently variables are 
:: evaluated before execution time unless you do this and then use ! instead of %. Craziness.
: roomSetupLoop
echo Waiting for SteamVR to start back up and to close Room Setup...
setlocal EnableDelayedExpansion
for /L %%i in (1,1,%maxWaitTimeForRoomSetup%) do (
	tasklist /FI "IMAGENAME eq steamvr_room_setup.exe" 2>NUL | find /I /N "steamvr_room_setup.exe">NUL
	if "!ERRORLEVEL!"=="0" (set roomSetupStatus=running) else (set roomSetupStatus=quit)
	echo "!roomSetupStatus!"
	if "!roomSetupStatus!" == "running" (
		taskkill /f /im "steamvr_room_setup.exe" 
		goto break
	) else (
		timeout 1
	)
)
:break

:: mark the new last known state
set steamvrLastKnownStatus=%steamvrStatus%
echo %steamvrLastKnownStatus%

goto whileTrueLoop










