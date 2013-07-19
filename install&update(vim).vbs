Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim sourcepath , targetpath
	targetpath = "C:\portable\vim\vim74"
Call versionselect
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

Sub versionselect
Dim sourcepathselect
Do
sourcepathselect = InputBox("1 = ming32" &Chr(10) & _
                            "2 = ming64" &Chr(10) & _
                            "3 = mvc32" &Chr(10) & _
                            "4 = mvc64" &Chr(10) & _
                            "Select Feature (Other Number = Exit)" , _
                            "Input A Number For Your Choice" , 4)
Loop While IsNumeric(sourcepathselect) = Flase
Select Case sourcepathselect
	Case 1
		sourcepath = "C:\dev\ming32\vim"
	Case 2
		sourcepath = "C:\dev\ming64\vim"
	Case 3
		sourcepath = "C:\dev\mvc32\vim"
	Case 4
		sourcepath = "C:\dev\mvc64\vim"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub
