@echo off
title Start VR programs
echo Stopping lighthouses...
:: remember to edit the paths below, unless you also happen to be named "Joe Puccio". Also be sure to change the MAC addresses at the end of this line (run `lighthouse-v2-manager.exe discover`)
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
