@echo off
title Close all VR programs
:: remember to edit the paths below. Also be sure to change the MAC addresses at the end of this line (run `lighthouse-v2-manager.exe discover`)
echo Stopping lighthouses...
"lighthouse-v2-manager.exe" off FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED
echo Disabling Reverb G2 headset
"USBDeview.exe" /RunAsAdmin /disable "HoloLens Sensors"
echo Killing WMR application
taskkill /f /im "MixedRealityPortal.exe"
echo Killing Steam VR applications
taskkill /IM vrwebhelper.exe /F
taskkill /IM vrserver.exe /F
taskkill /IM vrmonitor.exe /F
taskkill /IM vrdashboard.exe /F
taskkill /IM vrcompositor.exe /F
taskkill /IM steamtours.exe /F
taskkill /IM TurnSignal.exe /F
echo "Done!"
set "file=stopped.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >headlessSound.vbs
cscript.exe //nologo headlessSound.vbs