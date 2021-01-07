::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: specify the MAC addresses of your lighthouses (a.k.a basestations) here, separated by a space
:: If you have an Android device, you can downnload the "Lighthouse Power Management" app to find the MAC addresses: https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm
:: Alternatively, you can:
:: 1. Open up "Command Prompt"
:: 2. Navigate to this directory, e.g. `cd C:\Users\Joe Puccio\Dropbox\big-bro-peep\vr\bin\`
:: 3. Run `lighthouse-keeper.exe 2 discover` (if you have 1.0 basestations, change the 2 to a 1)
:: Note: you may have to run the discover command 4 or 5 times before you get both MAC addresses
set lighthouseMACAddressList=FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED

:: specify what version of lighthouses (a.k.a basestations) you're using, 2.0 or 1.0
set lighthouseVersion=2.0

:: maxWaitTimeForRoomSetup is how long (in seconds) you ever would expect it to take for the 
:: SteamVR Room Setup to open after a launch of SteamVR. This is essentially a timeout value.
:: Note: if you want to run SteamVR Room Setup, just launch VR, let this script kill it 
:: and then manually start it from the SteamVR status window. This script will only ever kill it 
:: once per VR session. If you're getting a loop where your basestations turn on and then off
:: when you start VR, that could be because this value is too low.
set maxWaitTimeForRoomSetup=60

:: pollingRate is how often (in seconds) this script will check to see if SteamVR has started running
:: so it can perform its actions; more frequent polling will use more CPU, but the actions will trigger
:: sooner after you start/quit SteamVR
set pollingRate=1

:: steamPath is the directory where you have Steam installed; it's only used for the restoring SteamVR home state and for restoring the chaperone bounds
:: state, both of which are optional features which are disabled by default, so don't be concerned if this path is wrong if you're not using those features
set steamPath=C:\Program Files (x86)\Steam

:: steamVRPath is the path to your SteamVR install location, this may be called "SteamVR" or "OpenVR"
:: and will either appear under your main Steam directory, or your alternate install location
:: again, just like with the steamPath, don't be concerned if this differs on your system unless you're using the two optional features
set steamVRPath=%steamPath%\steamapps\common\SteamVR

:: if USB Deview has been whitelisted in UAC by creating a shortcut, replace change the path below
:: to be the the path to the shortcut (including the .lnk extension)
set usbDeviewPath=bin\USBDeview.exe