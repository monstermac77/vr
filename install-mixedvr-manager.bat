@echo off

:: NOTE: This must be run as administrator

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0
:: remove trailing slash from folder path to avoid escape issues with argument
set MixedVRManagerFolder=%MixedVRManagerFolder:~0,-1%

:: create scheduled task
SCHTASKS /CREATE /SC ONLOGON /TN "VR\Mixed VR Manager" /RL HIGHEST /TR "%MixedVRManagerFolder%\bin\mixedvr-manager-startup-wrapper.bat %MixedVRManagerFolder%"

:: /SC ONLOGON - run on user logon
:: /RL HIGHEST - run as administrator

:: TO DO: Make this a check so it confirms the task exists
echo Scheduled Task created - please reboot your PC
pause