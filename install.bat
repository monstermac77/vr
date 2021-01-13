@echo off

:: NOTE: This must be run as administrator

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0

:: create scheduled task
SCHTASKS /CREATE /SC ONLOGON /TN "VR\Mixed VR Manager" /TR "cscript.exe %MixedVRManagerFolder%bin\mixedvr-manager-launcher.vbs" /RL HIGHEST

:: /SC ONLOGON - run on user logon
:: /RL HIGHEST - run as administrator