Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim argument(1)
	argument(0) = "C:\Python27\python.exe" 'python path
	argument(1) = "C:\repository\hg\tortoisehg\thg" 'thg path
If Not (fso.FileExists(argument(0))) Then
	MsgBox "[info] Can't Find python & Exit" , 0 , "Message"
	WScript.Quit
End If
If Not (fso.FileExists(argument(1))) Then
	MsgBox "[info] Can't Find thg & Exit" , 0 , "Message"
	WScript.Quit
End If
Return = WshShell.Run(Chr(34) &argument(0) &Chr(34) &Chr(32) _
                     &Chr(34) &argument(1) &Chr(34) , 1, true)
