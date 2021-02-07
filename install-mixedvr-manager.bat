@echo off

:: NOTE: If you want to launch MixedVR-Manager manually, please run "mixedvr-manager.bat" as admin

:: NOTE: This must be run as administrator
:: TODO: run an admin check at the top to alert the user if they're not running as admin

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0

:: remove trailing slash from folder path to avoid escape issues with argument
set MixedVRManagerFolder=%MixedVRManagerFolder:~0,-1%

:: create scheduled task
SCHTASKS /CREATE /SC ONLOGON /TN "VR\Mixed VR Manager" /RL HIGHEST /TR "%MixedVRManagerFolder%\bin\mixedvr-manager-startup-wrapper.bat %MixedVRManagerFolder%"

:: TODO: make it so that it runs this task now so that the install actually starts things too

:: /SC ONLOGON - run on user logon
:: /RL HIGHEST - run as administrator

:: TODO: Make this a check so it confirms the task exists
echo Scheduled Task created - please reboot your PC
pause