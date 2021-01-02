'Thank you: https://superuser.com/a/140077/699131
'This is how you can determine what process this is in task manager: https://superuser.com/a/362167/699131

Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c mixedvr-manager.bat"
oShell.Run strArgs, 0, false