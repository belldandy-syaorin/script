Set WshShell = WScript.CreateObject("WScript.Shell")
Dim argument(2)
	argument(0) = "C:\portable\RHash-1.2.9-win64\rhash.exe" 'application path
If WScript.Arguments.Count = 0 Then
	Call manualinputargument
Else
	Call withargument
End If
Call featureselect
Return = WshShell.run("%COMSPEC% /u /k" &Chr(32) &argument(0) _
                                        &Chr(32) &argument(1) _
                                        &Chr(32) &Chr(34) &argument(2) &Chr(34) , 1 , True)

Sub manualinputargument
argument(2) = InputBox("Null(Empty) = Exit" &Chr(10) & _
                       "Notice :" &Chr(10) & _
                       "Wrong Path&FileName Will Cause An Error" , _
                       "Manual Input (Link)")
If argument(2) = "" Then
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
argumentselect = InputBox("1 = MD5" &Chr(10) & _
                          "2 = SHA1" &Chr(10) & _
                          "3 = ED2K" &Chr(10) & _
                          "4 = CHECK" &Chr(10) & _
                          "Select Feature (Other Number = Exit)" , _
                          "Input A Number For Your Choice")
Loop While IsNumeric(argumentselect) = Flase
Select Case argumentselect
	Case 1
		argument(1) = "-M"
	Case 2
		argument(1) = "-H"
	Case 3
		argument(1) = "-E"
	Case 4
		argument(1) = "-c"
	Case else
		WScript.Quit
End select
Exit Sub
End Sub
