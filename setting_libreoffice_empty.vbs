Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim eespath
eespath = WshShell.ExpandEnvironmentStrings("%APPDATA%")& _
          "\LibreOffice\3\user\registrymodifications.xcu"
If (fso.FileExists(eespath)) Then
	fso.DeleteFile(eespath)
	MsgBox "[ ok ] Find registrymodifications.xcu & Remove" , 0 , "Message"
Else
	MsgBox "[info] Can't Find registrymodifications.xcu & Exit" , 0 , "Message"
End If
