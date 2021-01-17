@echo off

:: NOTE: This must be run as administrator

:: kill manager if currently running
set pid=""
for /f "tokens=2 delims=," %%P in ('tasklist /v /fo csv ^| findstr /i "MixedVR Manager"') do set pid=%%~P
if NOT %pid% == "" (
  taskkill /f /pid %pid%
)

:: delete scheduled task
schtasks /Delete /TN "VR\Mixed VR Manager" /F

echo Startup task removed - reboot your PC

pause

