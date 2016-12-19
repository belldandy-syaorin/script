Set WshShell = WScript.CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\" & strComputer)
Dim response , subresponse
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
	Call choice
Elseif response = 7 Then
	Return = WshShell.run("sc config AntiVirSchedulerService start= disabled" , 1 , True)
End If
Loop

Sub choice
subresponse = MsgBox( _
	"Start Avira Scheduler Service Now" &Chr(10) & _
	"Warning : Service Can't Stop" _
	, 4 , "Message")
If subresponse = 6 Then
	Return = WshShell.run("sc start AntiVirSchedulerService" , 1 , True)
Elseif subresponse = 7 Then
	Exit Sub
End If
Exit Sub
End Sub
