@echo off

:: NOTE: This uninstaller must be run as administrator
:: TODO: run an admin check at the top to alert the user if they're not running as admin

:: kill mixedvr-manager if currently running
taskkill /f /t /fi "Windowtitle eq Administrator:  MixedVR Manager"
taskkill /f /t /fi "Windowtitle eq MixedVR Manager"

:: delete scheduled task
schtasks /Delete /TN "VR\Mixed VR Manager" /F

:: TODO undo any processes here that people would expect to be undone, like re-enable the G2 HMD

echo MixedVR-Manager has been removed

pause

