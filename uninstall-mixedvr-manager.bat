@echo off

:: NOTE: This installer must be run as administrator (ty: https://stackoverflow.com/a/11995662/2611730)
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed. Proceeding with uninstall...
) else (
    echo Failure: Current permissions inadequate. Please right click on file and select "Run as Administrator"
    timeout 10
    exit
)

:: find location of Mixed VR Manager
set MixedVRManagerFolder=%~dp0

:: kill mixedvr-manager if currently running
taskkill /f /t /fi "Windowtitle eq Administrator:  MixedVR Manager"
taskkill /f /t /fi "Windowtitle eq MixedVR Manager"

:: delete scheduled task
schtasks /Delete /TN "VR\Mixed VR Manager" /F

:: undo any processes here that people would expect to be undone, like re-enable the HMD
echo MixedVR-Manager is changing state of USB device, the HMD, to /enable just in case it was off...
"%MixedVRManagerFolder%bin\USBDeview.exe" /RunAsAdmin /enable "HoloLens Sensors"

echo MixedVR-Manager has been removed

timeout 20

