@echo off
title Start VR programs
:: remember to edit the paths below, unless you also happen to be named "Joe Puccio". Also be sure to change the MAC addresses at the end of this line (run `lighthouse-v2-manager.exe discover`)
echo Starting lighthouses...
"C:\Users\Joe Puccio\Documents\Misc\vr\lighthouses\source\lighthouse-v2-manager.exe" on FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED
echo Enabling Reverb G2 headset...
"C:\Users\Joe Puccio\Documents\Misc\vr\USBDeview.exe" /RunAsAdmin /enable "HoloLens Sensors"
echo "Giving the device a bit to boot up"
timeout 10
echo Starting SteamVR
start steam://launch/250820/VR
:: we kill steam VR room setup to patch a known bug that causes it to launch on steamvr startup
echo Waiting until Steam VR Room Setup launches...
timeout 25
echo Killing Steam VR Room Setup
taskkill /f /im "steamvr_room_setup.exe"
echo "Done! Enjoy VR"
timeout 5
