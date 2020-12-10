@echo off
title Start VR programs
:: remember to edit the paths below. Also be sure to change the MAC addresses at the end of this line (run `lighthouse-v2-manager.exe discover`)
echo Stopping lighthouses...
"%userprofile%\Dropbox\big-bro-peep\vr\lighthouse-v2-manager.exe" off FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED
echo Disabling Reverb G2 headset
"%userprofile%\Documents\Misc\vr\USBDeview.exe" /RunAsAdmin /disable "HoloLens Sensors"
echo Killing WMR application
taskkill /f /im "MixedRealityPortal.exe"
echo Killing Steam VR application
taskkill /IM vrwebhelper.exe /F
taskkill /IM vrserver.exe /F
taskkill /IM vrmonitor.exe /F
taskkill /IM vrdashboard.exe /F
taskkill /IM vrcompositor.exe /F
taskkill /IM steamtours.exe /F
taskkill /IM TurnSignal.exe /F
echo "Done!"
timeout 2
