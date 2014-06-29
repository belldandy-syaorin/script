Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim argument(1)
	argument(0) = "C:\portable\vim\vim74\gvim.exe" 'gvim path
	argument(1) = "+call Vim_Size(0)" ' gvim argument
If Not (fso.FileExists(argument(0))) Then
	MsgBox "[info] Can't Find gvim.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Return = WshShell.Run(Chr(34) &argument(0) &Chr(34) &Chr(32) _
                     &Chr(34) &argument(1) &Chr(34) , 1, true)
