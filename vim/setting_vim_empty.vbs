Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim eespath
eespath = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")& _
          "\_viminfo"
If (fso.FileExists(eespath)) Then
	fso.DeleteFile(eespath)
	MsgBox "[ ok ] Find _viminfo & Remove" , 0 , "Message"
Else
	MsgBox "[info] Can't Find _viminfo & Exit" , 0 , "Message"
End If
