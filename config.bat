::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: NOTE: when you change something in this file and save, the changes take effect immediately. No reboot required!

:: specify whether you want MixedVR Manager to turn on/off your lighthouses (a.k.a basestations)
:: if you don't have lighthouses, you NEED to set this to false
set allowLighthouseManagement=true

:: if you don't want your HMD to be enabled/disabled, set this to false
set allowHMDManagement=true

:: specify the MAC addresses of your lighthouses (a.k.a basestations) here, separated by a space
:: To find the MAC addresses you can:
:: 1. Open up "Command Prompt"
:: 2. Navigate to the bin directory in this folder, e.g. `cd C:\Users\Joe\Dropbox\big-bro-peep\vr\bin\`
:: 3. Run `lighthouse-keeper.exe 2 discover` (change the 2 to a 1 if you have 1.0 lighthouses)
:: NOTE: you may have to run the discover command several times before you get both MAC addresses
set lighthouseMACAddressList=FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED

:: specify what version of lighthouses you're using, 2.0 or 1.0
set lighthouseVersion=2.0

:: maxLaunchTimeForSteamVR is how long (in seconds) you ever would expect it to take for SteamVR to launch. 
:: if you have a slow machine and MixedVR Manager isn't working, increase this value. Likewise, if you have a fast machine
:: and you want to reduce your VR launch/exit time, you can try lowering this value (with caution).
set maxLaunchTimeForSteamVR=20

:: steamPath is the directory where you have Steam installed; it's only used for the restoring SteamVR home state and for restoring the chaperone bounds
:: state, both of which are optional features which are disabled by default, so don't be concerned if this path is wrong if you're not using those features
set steamPath=C:\Program Files (x86)\Steam

:: steamVRPath is the path to your SteamVR install location, this may be called "SteamVR" or "OpenVR"
:: and will either appear under your main Steam directory, or your alternate install location
:: again, just like with the steamPath, don't be concerned if this differs on your system unless you're using the two optional features
set steamVRPath=%steamPath%\steamapps\common\SteamVR