Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim sourcepath , targetpath
	sourcepath = "C:\dev\hg\vim"
	targetpath = "C:\portable\vim\vim73"
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
	MsgBox "[info] Can't Find Target Path & Exit" , 0 , "Message"
	WScript.Quit
End If
