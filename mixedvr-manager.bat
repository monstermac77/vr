@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This script was created for users of MixedVR (see the /r/MixedVR subreddit) by monstermac77
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:::::: config area ::::::

:: pollingRate is how often (in seconds) this script will check to see if SteamVR has started running
:: so it can perform its actions; more frequent polling will use more CPU, but the actions will trigger
:: sooner after you start/quit SteamVR
set pollingRate=2 

:: specify the MAC addresses of your lighthouses here. 
:: If you have an Android device, you can downnload the "Lighthouse Power Management" app to find the MAC addresses: https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm
:: Alternatively, you can:
:: 1. Open up "Command Prompt"
:: 2. Navigate to this directory, e.g. `cd C:\Users\Joe Puccio\Dropbox\big-bro-peep\vr\`
:: 3. Run `lighthouse-v2-manager.exe discover`
set lighthouseMACAddressList = FE:D0:49:F5:78:D6 E2:81:7F:AC:2B:ED

::::::::::::::::::::::::


::: Start of Script :::
title MixedVR Manager

:whileTrueLoop 

echo Waiting....

:: pause
timeout %pollingRate%

goto whileTrueLoop