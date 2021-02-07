@echo off

:: NOTE: This must be run as administrator

:: kill mixedvr-manager if currently running
taskkill /f /t /fi "Windowtitle eq Administrator:  MixedVR Manager"
taskkill /f /t /fi "Windowtitle eq MixedVR Manager"

:: delete scheduled task
schtasks /Delete /TN "VR\Mixed VR Manager" /F

echo MixedVR-Manager has been removed

pause

