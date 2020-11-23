@echo off
title Start VR programs
echo Stopping lighthouses...
"C:\Users\Joe Puccio\Documents\Misc\vr\lighthouses\source\lighthouse-v2-manager.exe" off FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED
echo Disabling Reverb G2 headset
"C:\Users\Joe Puccio\Documents\Misc\vr\USBDeview.exe" /RunAsAdmin /disable "HoloLens Sensors"
echo Killing WMR application
taskkill /f /im "MixedRealityPortal.exe"
taskkill /IM vrwebhelper.exe /F
taskkill /IM vrserver.exe /F
taskkill /IM vrmonitor.exe /F
taskkill /IM vrdashboard.exe /F
taskkill /IM vrcompositor.exe /F
taskkill /IM steamtours.exe /F
taskkill /IM TurnSignal.exe /F
echo "Done!"
timeout 2
