@echo off

:: NOTE: This must be run as administrator

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0

:: create scheduled task
SCHTASKS /CREATE /SC ONLOGON /TN "VR\Mixed VR Manager" /TR "%MixedVRManagerFolder%bin\mixedvr-manager-startup.bat" /RL HIGHEST

:: /SC ONLOGON - run on user logon
:: /RL HIGHEST - run as administrator