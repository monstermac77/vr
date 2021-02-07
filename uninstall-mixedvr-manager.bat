@echo off

:: NOTE: This must be run as administrator

:: kill mixedvr-manager if currently running
taskkill /f /t /fi "Windowtitle eq Administrator:  MixedVR Manager"
taskkill /f /t /fi "Windowtitle eq MixedVR Manager"

:: delete scheduled task
schtasks /Delete /TN "VR\Mixed VR Manager" /F

:: TODO undo any processes here that people would expect to be undone, like re-enable the G2 HMD

echo MixedVR-Manager has been removed

pause

