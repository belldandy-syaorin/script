Set WshShell = WScript.CreateObject("WScript.Shell")
Dim bin , ri , ui
	bin = "C:\portable\bin\aria2c.exe" 'bin path
Dim argument(9)
	argument(0) = "--referer="
	argument(1) = "--no-conf=true"
	argument(2) = "--dir="&WshShell.ExpandEnvironmentStrings("%USERPROFILE%")&"\Downloads" 'download path
	argument(3) = "--remote-time=true"
	argument(4) = "--check-certificate=false"
Call checksetting
If WScript.Arguments.Count = 0 Then
	Call uriinput
	Call riinput
Else
	Call withargument
End If
Dim autospeedselect
autospeedselect = WshShell.Popup( _
	"Yes = --max-download-limit=2048K (Default)" &Chr(10) & _
	"No = Select Feature" &Chr(10) & _
	"(After 5s Will Auto Select Default)" , _
	5 , _
	"Press For Your Choice" , _
	&H4 + &H20)
Select Case autospeedselect
	Case 7
		Call speedselect
	Case Else
		argument(5) = "--max-download-limit=2048K"
End Select
If ri = "" Then
	Return = WshShell.run( _
		"%COMSPEC% /u /k chcp 65001 &" _
		&Chr(32) &Chr(34) &bin &Chr(34) _
		&Chr(32) &Chr(34) &argument(1) &Chr(34) _
		&Chr(32) &Chr(34) &argument(2) &Chr(34) _
		&Chr(32) &Chr(34) &argument(3) &Chr(34) _
		&Chr(32) &Chr(34) &argument(4) &Chr(34) _
		&Chr(32) &Chr(34) &argument(5) &Chr(34) _
		&Chr(32) &Chr(34) &ui &Chr(34) _
		, 1 , True)
Else
	Return = WshShell.run( _
		"%COMSPEC% /u /k chcp 65001 &" _
		&Chr(32) &Chr(34) &bin &Chr(34) _
		&Chr(32) &Chr(34) &argument(1) &Chr(34) _
		&Chr(32) &Chr(34) &argument(2) &Chr(34) _
		&Chr(32) &Chr(34) &argument(3) &Chr(34) _
		&Chr(32) &Chr(34) &argument(4) &Chr(34) _
		&Chr(32) &Chr(34) &argument(5) &Chr(34) _
		&Chr(32) &Chr(34) &ui &Chr(34) _
		&Chr(32) &Chr(34) &argument(0) &ri &Chr(34) _
		, 1 , True)
End If

Sub checksetting
Set fso = CreateObject("Scripting.FileSystemObject")
If Not (fso.FileExists(bin)) Then
	MsgBox "[info] Can't Find aria2c.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
If Not (fso.FolderExists(Replace(argument(2) , "--dir=" , ""))) Then
	MsgBox "[info] Can't Find Download Directory & Exit" , 0 , "Message"
	WScript.Quit
End If
Exit Sub
End Sub

Sub uriinput
ui = InputBox( _
	"(No Input = Exit)" &Chr(10) , _
	"URI Input")
If ui = "" Then
	WScript.Quit
End If
Exit Sub
End Sub

Sub riinput
ri = InputBox( _
	"(No Input = Skip)" &Chr(10) , _
	"REFERER Input")
Exit Sub
End Sub

Sub withargument
	ui = WScript.Arguments.Item(0)
	ri = WScript.Arguments.Item(1)
Exit Sub
End Sub

Sub speedselect
Dim argumentselect
Do
argumentselect = InputBox( _
	"1 = --max-download-limit=0" &Chr(10) & _
	"2 = --max-download-limit=2048K (Default)" &Chr(10) & _
	"3 = --max-download-limit=1024K" &Chr(10) & _
	"4 = --max-download-limit=512K" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 2)
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(5) = "--max-download-limit=0"
	Case 2
		argument(5) = "--max-download-limit=2048K"
	Case 3
		argument(5) = "--max-download-limit=1024K"
	Case 4
		argument(5) = "--max-download-limit=512K"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub
