Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim eespath
eespath = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")& _
          "\.neocomplcache"
If (fso.FolderExists(eespath)) Then
	fso.DeleteFolder(eespath)
	MsgBox "[ ok ] Find .neocomplcache & Remove" , 0 , "Message"
Else
	MsgBox "[info] Can't Find .neocomplcache & Exit" , 0 , "Message"
End If
