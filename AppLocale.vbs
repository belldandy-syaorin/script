Set WshShell = WScript.CreateObject("WScript.Shell")
vbspath = "C:\repository\git\script\AppLocale.vbs" 'vbs path
Dim argument(2)
	argument(0) = "C:\Windows\AppPatch\AppLoc.exe" 'application path
Call checksetting
If WScript.Arguments.Count = 0 Then
	Call manualinputargument
Else
	Call withargument
End If
Call featureselect
Return = WshShell.run(argument(0) _
                     &Chr(32) &argument(1) _
                     &Chr(32) &Chr(34) &argument(2) &Chr(34) , 1 , True)

Sub checksetting
Set fso = CreateObject("Scripting.FileSystemObject")
If Not (fso.FileExists(argument(0))) Then
	MsgBox "[info] Can't Find AppLoc.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Exit Sub
End Sub

Sub manualinputargument
argument(2) = InputBox("Null(Empty) = Exit" &Chr(10) & _
                       "Notice :" &Chr(10) & _
                       "Wrong Path&FileName Will Cause An Error" &Chr(10) & _
                       "0000 = Add Context Menu" , _
                       "Manual Input (Path&FileName)")
If argument(2) = "" Then
	WScript.Quit
End If
If argument(2) = "0000" Then
	regpath = "HKEY_CLASSES_ROOT\*\shell\AppLocale\command\"
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
Exit Sub
End Sub

Sub withargument
	argument(2) = WScript.Arguments.Item(0)
Exit Sub
End Sub

Sub featureselect
Dim argumentselect
Do
argumentselect = InputBox("1 = japan (Default)" &Chr(10) & _
                          "2 = taiwan" &Chr(10) & _
                          "3 = prc" &Chr(10) & _
                          "4 = korea" &Chr(10) & _
                          "Select Feature (Other Number = Exit)" , _
                          "Input A Number For Your Choice" , 1)
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(1) = "/L0411"
	Case 2
		argument(1) = "/L0404"
	Case 3
		argument(1) = "/L0804"
	Case 4
		argument(1) = "/L0412"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub
