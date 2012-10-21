Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim sourcepath , targetpath
	sourcepath = "C:\dev\hg\gundo.vim"
	targetpath = "C:\portable\vim\vimfiles"
If (fso.FolderExists(targetpath)) Then
	if (fso.FolderExists(sourcepath&"\autoload")) And _
           (fso.FolderExists(sourcepath&"\doc")) And _
           (fso.FolderExists(sourcepath&"\plugin")) Then
		Return = fso.CopyFolder(sourcepath&"\autoload" , targetpath&"\autoload" , True)
		Return = fso.CopyFolder(sourcepath&"\doc" , targetpath&"\doc" , True)
		Return = fso.CopyFolder(sourcepath&"\plugin" , targetpath&"\plugin" , True)
	Else
		MsgBox "[info] Source Folder Error" , 0 , "Message"
		WScript.Quit
	End If
	MsgBox "[ ok ] Install & Update" , 0 , "Message"
Else
	MsgBox "[info] Target Folder Error" , 0 , "Message"
	WScript.Quit
End If
