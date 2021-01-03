::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: specify the MAC addresses of your lighthouses here, separated by a space
:: If you have an Android device, you can downnload the "Lighthouse Power Management" app to find the MAC addresses: https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm
:: Alternatively, you can:
:: 1. Open up "Command Prompt"
:: 2. Navigate to this directory, e.g. `cd C:\Users\Joe Puccio\Dropbox\big-bro-peep\vr\bin\`
:: 3. Run `lighthouse-v2-manager.exe discover`
set lighthouseMACAddressList=FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED

:: maxWaitTimeForRoomSetup is how long (in seconds) you ever would expect it to take for the 
:: SteamVR Room Setup to open after a launch of SteamVR. This is essentially a timeout value.
:: Note: if you want to run SteamVR Room Setup, just launch VR, let this script kill it 
:: and then manually start it from the SteamVR status window. This script will only ever kill it 
:: once per VR session. If you're getting a loop where your basestations turn on and then off
:: when you start VR, that could be because this value is too low.
set maxWaitTimeForRoomSetup=60

:: lighthouseAttempts is how many times this script should try to send "on" and "off" commands to the lighthouses
:: if you are constantly having an issue where one lighthouse turns off or on and the other doesn't you should raise this value
:: if you want to start / stop your VR sessions faster, you can try lowering this to 1, but we've found 
:: two is the minimum for the lighthouses to turn on/off
set lighthouseConnectionAttempts=2

:: pollingRate is how often (in seconds) this script will check to see if SteamVR has started running
:: so it can perform its actions; more frequent polling will use more CPU, but the actions will trigger
:: sooner after you start/quit SteamVR
set pollingRate=1

:: steamPath is the path to your Steam install location, this is typically located in
:: C:\Program Files (x86)\Steam
set steamPath=C:\Program Files (x86)\Steam

:: steamVrPath is the path to your SteamVR install location, this may be called "SteamVR" or "OpenVR"
:: and will either appear under your main Steam directory, or your alternate install location
set steamVrPath=C:\Program Files (x86)\Steam\steamapps\common\SteamVR
