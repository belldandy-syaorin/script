Set WshShell = WScript.CreateObject("WScript.Shell")
Dim argument(9)
	argument(0) = "C:\portable\aria2-1.16.3-win-64bit-build1\aria2c.exe" 'application path
	argument(2) = "--check-certificate=false"
	argument(3) = "--dir="&WshShell.ExpandEnvironmentStrings("%USERPROFILE%")&"\Downloads" 'download path
	argument(4) = "--remote-time=true"
Call checksetting
If WScript.Arguments.Count = 0 Then
	Call manualinputargument
Else
	Call withargument
End If
Dim autospeedselect
autospeedselect = WshShell.Popup("Yes = Auto Speed(512K)" &Chr(10) & _
                                 "No = Manual Speed" &Chr(10) & _
                                 "(After 5s Will Auto Select Yes)" , _
                                 5 , _
                                 "Press For Your Choice" , _
                                 &H4 + &H20)
Select Case autospeedselect
	Case 7
		Call speedselect
	Case Else
		argument(5) = "--max-download-limit=512K"
End select
Return = WshShell.run("%COMSPEC% /u /k" &Chr(32) &argument(0) _
                                        &Chr(32) &argument(2) _
                                        &Chr(32) &argument(3) _
                                        &Chr(32) &argument(4) _
                                        &Chr(32) &argument(5) _
                                        &Chr(32) &Chr(34) &argument(1) &Chr(34) , 1 , True)

Sub checksetting
Set fso = CreateObject("Scripting.FileSystemObject")
If Not (fso.FileExists(argument(0))) Then
	MsgBox "[info] Can't Find aria2c.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
If Not (fso.FolderExists(Replace(argument(3) , "--dir=" , ""))) Then
	MsgBox "[info] Can't Find Download Directory & Exit" , 0 , "Message"
	WScript.Quit
End If
Exit Sub
End Sub

Sub manualinputargument
argument(1) = InputBox("Null(Empty) = Exit" &Chr(10) & _
                       "Notice :" &Chr(10) & _
                       "Wrong Link Will Cause An Error" , _
                       "Manual Input (Link)")
If argument(1) = "" Then
	WScript.Quit
End If
Exit Sub
End Sub

Sub withargument
	argument(1) = WScript.Arguments.Item(0)
Exit Sub
End Sub

Sub speedselect
Dim argumentselect
Do
argumentselect = InputBox("1 = Unrestricted" &Chr(10) & _
                          "2 = 512K (Default , Press Enter)" &Chr(10) & _
                          "3 = 256K" &Chr(10) & _
                          "4 = 128K" &Chr(10) & _
                          "Select Feature (Other Number = Exit)" , _
                          "Input A Number For Your Choice" , 2)
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(5) = "--max-download-limit=0"
	Case 2
		argument(5) = "--max-download-limit=512K"
	Case 3
		argument(5) = "--max-download-limit=256K"
	Case 4
		argument(5) = "--max-download-limit=128K"
	Case else
		WScript.Quit
End select
Exit Sub
End Sub
