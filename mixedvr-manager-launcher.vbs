'Thank you: https://superuser.com/a/140077/699131

Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c mixedvr-manager.bat"
oShell.Run strArgs, 0, false