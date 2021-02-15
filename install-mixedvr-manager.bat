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
echo MixedVR Manager has been installed and is now running.
echo Please turn on an Index/Vive Controller (or start SteamVR directly), count to 30, and then put on your headset.
echo After launching SteamVR you don't have to touch the mouse/keyboard/controller; MixedVR Manager handles all setup.
echo (Note: you will see SteamVR exit and then restart several seconds later. This is normal. It's not crashing).
echo When you're done, open the SteamVR dashboard and select 'Exit VR'. MixedVR Manager will shut down everything automatically.
echo *******************************************************************
echo *****PLEASE READ***********PLEASE READ**********PLEASE READ********
echo *******************************************************************
timeout 60 >NUL
