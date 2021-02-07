@echo off

:: NOTE: If you want to launch MixedVR-Manager manually in a terminal window, please run "mixedvr-manager.bat" as admin

:: NOTE: This installer must be run as administrator
:: TODO: run an admin check at the top to alert the user if they're not running as admin

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0

:: remove trailing slash from folder path to avoid escape issues with argument
set MixedVRManagerFolder=%MixedVRManagerFolder:~0,-1%

:: create scheduled task
:: /SC ONLOGON - run on user logon
:: /RL HIGHEST - run as administrator
SCHTASKS /CREATE /SC ONLOGON /TN "VR\Mixed VR Manager" /RL HIGHEST /TR "%MixedVRManagerFolder%\bin\mixedvr-manager-startup-wrapper.bat %MixedVRManagerFolder%"

:: run the scheduled task (this just makes it so they don't have to reboot)
SCHTASKS /RUN /TN "VR\Mixed VR Manager"

echo MixedVR-Manager installed.
echo Now please turn on an Index Controller (or start SteamVR directly) and put on your headset.
echo No other action is required on your part, it's as simple as launching SteamVR and start playing.
echo When you're done, just close SteamVR from within your headset. Everything will shut down automatically.
pause