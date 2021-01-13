@echo off

:: NOTE: This must be run as administrator

:: delete scheduled task
schtasks /Delete /TN "VR\Mixed VR Manager" /F

echo Startup task removed - reboot your PC

pause