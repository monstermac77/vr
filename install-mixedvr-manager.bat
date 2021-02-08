@echo off

:: NOTE: If you want to launch MixedVR-Manager manually in a terminal window, please run "mixedvr-manager.bat" as admin

:: NOTE: This installer must be run as administrator (ty: https://stackoverflow.com/a/11995662/2611730)
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed. Proceeding with install...
) else (
    echo Failure: Current permissions inadequate. Please right click on file and select "Run as Administrator"
    timeout 10 >NUL
    exit
)

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0

:: remove trailing slash from folder path to avoid escape issues with argument
set MixedVRManagerFolder=%MixedVRManagerFolder:~0,-1%

:: create scheduled task
:: /SC ONLOGON - run on user logon
:: /RL HIGHEST - run as administrator
SCHTASKS /CREATE /SC ONLOGON /TN "VR\Mixed VR Manager" /RL HIGHEST /TR "'%MixedVRManagerFolder%\bin\mixedvr-manager-startup-wrapper.bat' %MixedVRManagerFolder%"

:: run the scheduled task (this just makes it so they don't have to reboot)
SCHTASKS /RUN /TN "VR\Mixed VR Manager"

echo *******************************************************************
echo *****PLEASE READ***********PLEASE READ**********PLEASE READ********
echo *******************************************************************
echo MixedVR-Manager installed.
echo Now please turn on an Index Controller (or start SteamVR directly) and put on your headset.
echo No other action is required on your part, it's as simple as launching SteamVR and start playing.
echo You will see SteamVR exit and then restart several seconds later. This is normal. It's not crashing.
echo When you're done, just close SteamVR from within your headset. Everything will shut down automatically.
echo *******************************************************************
echo *****PLEASE READ***********PLEASE READ**********PLEASE READ********
echo *******************************************************************
timeout 60 >NUL