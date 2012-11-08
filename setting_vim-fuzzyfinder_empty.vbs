Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim eespath
eespath = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")& _
          "\.vim-fuf-data"
If (fso.FolderExists(eespath)) Then
	fso.DeleteFolder(eespath)
	MsgBox "[ ok ] Find .vim-fuf-data & Remove" , 0 , "Message"
Else
	MsgBox "[info] Can't Find .vim-fuf-data & Exit" , 0 , "Message"
End If
