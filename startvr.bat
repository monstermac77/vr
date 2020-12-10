@echo off
title Start all VR programs
:: remember to edit the paths below. Also be sure to change the MAC addresses at the end of this line (run `lighthouse-v2-manager.exe discover`)
echo Starting lighthouses...
"%userprofile%\Dropbox\big-bro-peep\vr\lighthouse-v2-manager.exe" on FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED
echo Enabling Reverb G2 headset...
"%userprofile%\Dropbox\big-bro-peep\vr\USBDeview.exe" /RunAsAdmin /enable "HoloLens Sensors"
echo "Giving the device a bit to boot up"
timeout 10
echo Starting SteamVR
start steam://launch/250820/VR
:: we kill steam VR room setup to patch a known bug that causes it to launch on steamvr startup (relevant for Open VR Space Calibrator users)
echo Waiting until Steam VR Room Setup launches...
timeout 30
echo Killing Steam VR Room Setup
taskkill /f /im "steamvr_room_setup.exe"
:: thank you https://stackoverflow.com/a/45853089/2611730
set "file=started.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >headlessSound.vbs
cscript.exe //nologo headlessSound.vbs
echo "Done! Enjoy VR"
timeout 2
