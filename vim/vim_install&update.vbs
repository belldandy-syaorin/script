Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim sourcepath , targetpath
	sourcepath = "C:\repository\git\vim"
	targetpath = "C:\portable\vim\vim80"
If Not WScript.Arguments.Count = 0 Then
	sourcepath = WScript.Arguments.Item(0)
	targetpath = WScript.Arguments.Item(1)
End If
Dim response
response = MsgBox( _
	"VIM Source Path : " &sourcepath &Chr(10) & _
	"VIM Target Path : " &targetpath &Chr(10) & _
	"Install(Yes) or Exit(No)" _
	, 4 , "Message")
Select Case response
	Case 6
		Call install
	Case 7
		WScript.Quit
End Select

Sub install
	If (fso.FolderExists(targetpath)) Then
		if (fso.FolderExists(sourcepath&"\runtime")) Then
			Return = fso.CopyFolder(sourcepath&"\runtime" , targetpath&"\runtime" , True)
		Else
			MsgBox "[info] Can't Find Source Directory & Exit" , 0 , "Message"
			WScript.Quit
		End If
		If (fso.FileExists(sourcepath&"\src\gvim.exe")) And _
		   (fso.FileExists(sourcepath&"\src\GvimExt\gvimext.dll")) And _
		   (fso.FileExists(sourcepath&"\src\vimrun.exe")) And _
		   (fso.FileExists(sourcepath&"\src\xxd\xxd.exe")) Then
			Return = fso.CopyFile(sourcepath&"\src\gvim.exe" , targetpath&"\" , True)
			Return = fso.CopyFile(sourcepath&"\src\GvimExt\gvimext.dll" , targetpath&"\" , True)
			Return = fso.CopyFile(sourcepath&"\src\vimrun.exe" , targetpath&"\" , True)
			Return = fso.CopyFile(sourcepath&"\src\xxd\xxd.exe" , targetpath&"\" , True)
		Else
			MsgBox "[info] Can't Find Source File & Exit" , 0 , "Message"
			WScript.Quit
		End If
		MsgBox "[ ok ] Install & Update Success" , 0 , "Message"
	Else
		MsgBox "[info] Can't Find Target Directory & Exit" , 0 , "Message"
		WScript.Quit
	End If
Exit Sub
End Sub
