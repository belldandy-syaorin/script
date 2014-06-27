Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vbspath = "C:\repository\git\script\Gpg4win.vbs" 'vbs path
Dim argument(2)
	argument(0) = "C:\PROGRA~2\GNU\GnuPG\gpg2.exe" 'application path(DIR/X)
Call checksetting
If WScript.Arguments.Count = 0 Then
	Call manualinputargument
Else
	Call withargument
End If
Call featureselect
Return = WshShell.run( _
	"%COMSPEC% /u /k chcp 65001 &" _
	&Chr(32) &argument(0) _
	&Chr(32) &argument(1) _
	&Chr(32) &Chr(34) &argument(2) &Chr(34) , 1 , True)

Sub checksetting
If Not (fso.FileExists(argument(0))) Then
	MsgBox "[info] Can't Find gpg2.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Exit Sub
End Sub

Sub manualinputargument
argument(2) = InputBox( _
	"Null(Empty) = Exit" &Chr(10) & _
	"Notice :" &Chr(10) & _
	"0000 = Add Context Menu" , _
	"Manual Input (Path&FileName)")
If argument(2) = "" Then
	WScript.Quit
End If
If argument(2) = "0000" Then
	regpath = "HKEY_CLASSES_ROOT\*\shell\Gpg4win\command\"
	regdata = "wscript.exe"&Chr(32)&vbspath&Chr(32)&Chr(34)&"%1"&Chr(34)
	WshShell.RegWrite regpath , regdata , "REG_SZ"
	If WshShell.RegRead (regpath) = regdata Then
		MsgBox "[ ok ] Install Success" , 0 , "Message"
		WScript.Quit
	Else
		MsgBox "[info] Install Error" , 0 , "Message"
		WScript.Quit
	End If
End If
If Not (fso.FileExists(argument(2))) Then
	MsgBox "[info] Can't Find File & Exit" , 0 , "Message"
	WScript.Quit
End If
Exit Sub
End Sub

Sub withargument
	argument(2) = WScript.Arguments.Item(0)
Exit Sub
End Sub

Sub featureselect
Dim argumentselect
Do
argumentselect = InputBox( _
	"1 = import" &Chr(10) & _
	"2 = verify (Default)" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 2)
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(1) = "--import"
	Case 2
		argument(1) = "--verify"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub
