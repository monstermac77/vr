'Thank you: https://superuser.com/a/140077/699131
'This is how you can determine what process this is in task manager: https://superuser.com/a/362167/699131

Dim FilePath

'Check if active filepath is provided as argument, otherwise default to current working directory
If WScript.Arguments.Count > 0 Then
  FilePath = WScript.Arguments(0) & ""
Else
  FilePath = ""
End if

'Call runtime bat via absolute path - again admin rights appears to cause issues with relative paths
'with VBS it seems to run from C:\Windows\System32\
'additional escaped quotes to allow for filepaths with spaces
Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c """ & FilePath & "\bin\mixedvr-manager.bat"""
oShell.Run strArgs, 0, false
