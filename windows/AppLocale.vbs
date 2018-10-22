Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vbspath = "C:\repository\git\script\windows\AppLocale.vbs" 'vbs path
Dim bin , fi
	bin = "C:\Windows\AppPatch\AppLoc.exe" 'bin path
Dim argument(9)
Call checksetting
If WScript.Arguments.Count = 0 Then
	Call fileinput
Else
	Call withargument
End If
Call featureselect
Return = WshShell.Run( _
	Chr(34) &bin &Chr(34) &Chr(32) _
	&Chr(34) &fi &Chr(34) &Chr(32) _
	&Chr(34) &argument(0) &Chr(34) _
	, 1, true)

Sub checksetting
If Not (fso.FileExists(bin)) Then
	MsgBox "[info] Can't Find AppLoc.exe & Exit" , 0 , "Message"
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
	regpath = "HKEY_CLASSES_ROOT\*\shell\AppLocale\command\"
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
	"1 = taiwan (Default)" &Chr(10) & _
	"2 = prc" &Chr(10) & _
	"3 = japan" &Chr(10) & _
	"4 = korea" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 1)
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(0) = "/L0404"
	Case 2
		argument(0) = "/L0804"
	Case 3
		argument(0) = "/L0411"
	Case 4
		argument(0) = "/L0412"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub
