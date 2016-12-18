Set WshShell = WScript.CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\" & strComputer)
Dim response , selectresponse
Do
Set AVSS = objWMIService.Get("Win32_Service.Name='AntiVirSchedulerService'")
response = MsgBox( _
	"Avira Scheduler : " &AVSS.State &" , " &AVSS.StartMode &Chr(10) & _
	"Enable(Yes) or Disable(No)" &Chr(10) & _
	"Exit(Cancel)" _
	, 3 , "Message")
If response = 2 Then
	WScript.Quit
Elseif response = 6 Then
	Return = WshShell.run("sc config AntiVirSchedulerService start= auto" , 1 , True)
	Call startselect
Elseif response = 7 Then
	Return = WshShell.run("sc config AntiVirSchedulerService start= disabled" , 1 , True)
End If
Loop

Sub startselect
selectresponse = MsgBox( _
	"Start Avira Scheduler Service Now" &Chr(10) & _
	"Warning : Service Can't Stop" _
	, 4 , "Message")
If selectresponse = 6 Then
	Return = WshShell.run("sc start AntiVirSchedulerService" , 1 , True)
Elseif selectresponse = 7 Then
	Exit Sub
End If
Exit Sub
End Sub
