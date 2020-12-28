@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:::::: config area ::::::

:: pollingRate is how often (in seconds) this script will check to see if SteamVR has started running
:: so it can perform its actions; more frequent polling will use more CPU, but the actions will trigger
:: sooner after you start/quit SteamVR
set pollingRate=2 

:: specify the MAC addresses of your lighthouses here. 
:: If you have an Android device, you can downnload the "Lighthouse Power Management" app to find the MAC addresses: https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm
:: Alternatively, you can:
:: 1. Open up "Command Prompt"
:: 2. Navigate to this directory, e.g. `cd C:\Users\Joe Puccio\Dropbox\big-bro-peep\vr\`
:: 3. Run `lighthouse-v2-manager.exe discover`
set lighthouseMACAddressList=FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED

::::::::::::::::::::::::


::: Start of Script :::
title MixedVR Manager

:: goto marker (start of loop)
:whileTrueLoop 

:: check to see if steamvr is running (thank you https://stackoverflow.com/a/1329790/2611730)
tasklist /FI "IMAGENAME eq vrmonitor.exe" 2>NUL | find /I /N "vrmonitor.exe">NUL
if "%ERRORLEVEL%"=="0" (set steamvrStatus=running) else (set steamvrStatus=quit)

:: handle the first loop case; we'll only detect changes to the running status since the script started, not on first run
if "%steamvrLastKnownStatus%" == "" (
	set steamvrLastKnownStatus=%steamvrStatus%
	echo Setting inits, at time of script start, SteamVR was %steamvrStatus%
	goto whileTrueLoop
)

:: handle the case where there is no change
if "%steamvrStatus%" == "%steamvrLastKnownStatus%" (
	echo No change in detected in Steam VR running status.
	timeout %pollingRate%
	goto whileTrueLoop
)

:: if we got to this point, then that means that SteamVR's status has just changed
:: so we call our stateChanged function, which effectively passes the the new state
:: in as "steamvrStatus"
echo Change detected in Steam VR running status.
goto stateChanged



:::::::::::::::
:: functions ::
:::::::::::::::


:: function that's called when the user has just launched/quit SteamVR
:: "parameterized" by whatever value is set in steamvrStatus
:stateChanged

: toggle lighthouse state
if "%steamvrStatus%" == "running" (set desiredLighthouseState=on) else (set desiredLighthouseState=off)
echo Turning lighthouses %desiredLighthouseState%...
lighthouse-v2-manager.exe %desiredLighthouseState% %lighthouseMACAddressList%



:: mark the new last known state
set steamvrLastKnownStatus=%steamvrStatus%
echo %steamvrLastKnownStatus%

goto whileTrueLoop










