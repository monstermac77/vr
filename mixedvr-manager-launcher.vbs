Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c mixedvr-manager.bat"
oShell.Run strArgs, 0, false
