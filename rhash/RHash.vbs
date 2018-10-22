Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vbspath = "C:\repository\git\script\rhash\RHash.vbs" 'vbs path
Dim bin , fi , fl
	bin = "C:\portable\bin\rhash.exe" 'bin path
Dim argument(9)
	argument(2) = "--percents"
Call checksetting
If WScript.Arguments.Count = 0 Then
	Call fileinput
	Call featureselect
	Return = WshShell.run( _
		"%COMSPEC% /u /k chcp 65001 & cd /d" _
		&Chr(32) &fl &Chr(32) &Chr(38) _
		&Chr(32) &Chr(34) &bin &Chr(34) _
		&Chr(32) &Chr(34) &argument(1) &Chr(34) _
		&Chr(32) &Chr(34) &argument(2) &Chr(34) _
		&Chr(32) &Chr(34) &fi &Chr(34) _
		, 1 , True)
Else
	Call withargument
	Call featureselect
	Return = WshShell.run( _
		"%COMSPEC% /u /k chcp 65001 &" _
		&Chr(32) &Chr(34) &bin &Chr(34) _
		&Chr(32) &Chr(34) &argument(1) &Chr(34) _
		&Chr(32) &Chr(34) &argument(2) &Chr(34) _
		&Chr(32) &Chr(34) &fi &Chr(34) _
		, 1 , True)
End If

Sub checksetting
If Not (fso.FileExists(bin)) Then
	MsgBox "[info] Can't Find rhash.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Exit Sub
End Sub

Sub fileinput
fi = InputBox( _
	"(No Input = Exit)" &Chr(10) & _
	"0000 = Add Context Menu" , _
	"File Input (Absolute Path)")
If fi = "" Then
	WScript.Quit
End If
If fi = "0000" Then
	regpath = "HKEY_CLASSES_ROOT\*\shell\RHash\command\"
	regdata = "wscript.exe"&Chr(32)&vbspath&Chr(32)&Chr(34)&"%1"&Chr(34)
	WshShell.RegWrite regpath , regdata , "REG_SZ"
	If WshShell.RegRead (regpath) = regdata Then
		MsgBox "[ ok ] Install Success" , 0 , "Message"
		WScript.Quit
	Else
		MsgBox "[info] Install Fail" , 0 , "Message"
		WScript.Quit
	End If
End If
If Not (fso.FileExists(fi)) Then
	MsgBox "[info] Can't Find File & Exit" , 0 , "Message"
	WScript.Quit
End If
fl = fso.GetParentFolderName(fi)
Exit Sub
End Sub

Sub withargument
	fi = WScript.Arguments.Item(0)
Exit Sub
End Sub

Sub featureselect
Dim argumentselect
Do
argumentselect = InputBox( _
	"1 = MD5" &Chr(10) & _
	"2 = SHA1" &Chr(10) & _
	"3 = ED2K" &Chr(10) & _
	"4 = CHECK (Default)" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 4)
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(1) = "--md5"
	Case 2
		argument(1) = "--sha1"
	Case 3
		argument(1) = "--ed2k"
	Case 4
		argument(1) = "--check"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub
