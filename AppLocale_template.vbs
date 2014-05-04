Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim argument(2)
	argument(0) = "C:\Windows\AppPatch\AppLoc.exe"
	argument(1) = "" 'application path
	argument(2) = "" 'taiwan(/L0404),prc(/L0804),japan(/L0411),korea(/L0412)
If Not (fso.FileExists(argument(0))) Then
	MsgBox "[info] Can't Find AppLoc.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
If Not (fso.FileExists(argument(1))) Then
	MsgBox "[info] Can't Find *.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Return = WshShell.Run(Chr(34) &argument(0) &Chr(34) &Chr(32) _
                     &Chr(34) &argument(1) &Chr(34) &Chr(32) _
                     &Chr(34) &argument(2) &Chr(34) , 1, true)
