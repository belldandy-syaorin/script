Set WshShell = WScript.CreateObject("WScript.Shell")
Dim regpath(15)
	regpath(0) = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\"
	regpath(1) = "RegisteredOwner"
	regpath(2) = "RegisteredOrganization"
	regpath(3) = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\DisableAutoplay"
	regpath(4) = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA"
	regpath(5) = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\"
	regpath(6) = "Hidden"
	regpath(7) = "HideFileExt"
	regpath(8) = "ShowSuperHidden"
	regpath(9) = "SharingWizardOn"
	regpath(10) = "IconsOnly"
Dim osselect
Do
osselect = InputBox( _
	"1 = Setting Windows 7" &Chr(10) & _
	"2 = Setting Windows Server 2008 R2" &Chr(10) & _
	"3 = Check Setting" &Chr(10) & _
	"4 = Misc Setting" &Chr(10) & _
	"5 = cpl" &Chr(10) & _
	"6 = msc" &Chr(10) & _
	"9 = Readme (Default)" &Chr(10) & _
	"Before Use , Please Read Readme" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 9)
Loop While IsNumeric(osselect) = Flase
Select Case osselect
	Case 1
		Return = WshShell.run("sc config wscsvc start= disabled" , 1 , True)
		Call sharesetting
	Case 2
		Return = WshShell.run("sc config Themes start= auto" , 1 , True)
		Return = WshShell.run("sc config AudioSrv start= auto" , 1 , True)
		Call sharesetting
	Case 3
		Call checksetting
	Case 4
		Call miscsetting
	Case 5
		Call cpl
	Case 6
		Call msc
	Case 9
		Call readme
	Case else
		WScript.Quit
End Select

Sub sharesetting
	Return = WshShell.run("sc config WinDefend start= disabled" , 1 , True)
	Return = WshShell.run("sc config MpsSvc start= disabled" , 1 , True)
	WshShell.RegWrite regpath(0) & regpath(1) , "Belldandy" , "REG_SZ"
	WshShell.RegWrite regpath(0) & regpath(2) , "Syaorin" , "REG_SZ"
	WshShell.RegWrite regpath(3) , 1 , "REG_DWORD"
	WshShell.RegWrite regpath(4) , 0 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(6) , 1 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(7) , 0 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(8) , 1 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(9) , 0 , "REG_DWORD"
	MsgBox "Setting Success" , 0 , "Message"
Exit Sub
End Sub

Sub checksetting
Dim co(15)
	co(0) = WshShell.RegRead(regpath(0) & regpath(1))
	co(1) = WshShell.RegRead(regpath(0) & regpath(2))
	co(2) = WshShell.RegRead(regpath(5) & regpath(6))
	co(3) = WshShell.RegRead(regpath(5) & regpath(7))
	co(4) = WshShell.RegRead(regpath(5) & regpath(8))
	co(7) = WshShell.RegRead(regpath(5) & regpath(9))
If co(2) = 1 And co(3) = 0 And co(4) = 1 And co(7) = 0 Then
	co(8) = "Default Setting"
Else
	co(8) = "Disable Default Setting"
End If
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer)
Set colSettings = objWMIService.ExecQuery _
	("Select * from Win32_ComputerSystem")
For Each objComputer in colSettings
	co(9) = objComputer.Name
	co(10) = objComputer.Workgroup
Next
co(11) = WshShell.RegRead(regpath(3))
If co(11) = 1 Then
	co(12) = "Disabled"
Else
	co(12) = "Enabled"
End If
co(13) = WshShell.RegRead(regpath(4))
If co(13) = 0 Then
	co(14) = "Disabled"
Else
	co(14) = "Enabled"
End If
Set WinDefend = objWMIService.Get("Win32_Service.Name='WinDefend'")
Set MpsSvc = objWMIService.Get("Win32_Service.Name='MpsSvc'")
Dim checkosselect
Do
checkosselect = InputBox( _
	"1 = Check Windows 7" &Chr(10) & _
	"2 = Check Windows Server 2008 R2" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 0)
Loop While IsNumeric(checkosselect) = Flase
Select Case checkosselect
	Case 1
		Set wscsvc = objWMIService.Get("Win32_Service.Name='wscsvc'")
		MsgBox _
			"ComputerName = " &co(9) &Chr(10) & _
			"ComputerWorkgroup = " &co(10) &Chr(10) & _
			"RegisteredOwner = " &co(0) &Chr(10) & _
			"RegisteredOrganization = " &co(1) &Chr(10) & _
			"Folder Options Setting = " &co(8) &Chr(10) & _
			"Autoplay = " &co(12) &Chr(10) & _
			"UAC = " &co(14) &Chr(10) & _
			"Security Center : " &wscsvc.State &" , " &wscsvc.StartMode &Chr(10) & _
			"Windows Defender : " &WinDefend.State &" , " &WinDefend.StartMode &Chr(10) & _
			"Windows Firewall : " &MpsSvc.State &" , " &MpsSvc.StartMode _
			, 0 , "Message"
	Case 2
		Set Themes = objWMIService.Get("Win32_Service.Name='Themes'")
		Set AudioSrv = objWMIService.Get("Win32_Service.Name='AudioSrv'")
		MsgBox _
			"ComputerName = " &co(9) &Chr(10) & _
			"ComputerWorkgroup = " &co(10) &Chr(10) & _
			"RegisteredOwner = " &co(0) &Chr(10) & _
			"RegisteredOrganization = " &co(1) &Chr(10) & _
			"Folder Options Setting = " &co(8) &Chr(10) & _
			"Autoplay = " &co(12) &Chr(10) & _
			"UAC = " &co(14) &Chr(10) & _
			"Windows Defender : " &WinDefend.State &" , " &WinDefend.StartMode &Chr(10) & _
			"Windows Firewall : " &MpsSvc.State &" , " &MpsSvc.StartMode &Chr(10) & _
			"Themes : " &Themes.State &" , " &Themes.StartMode &Chr(10) & _
			"Windows Audio : " &AudioSrv.State &" , " &AudioSrv.StartMode _
			, 0 , "Message"
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub

Sub miscsetting
Dim response
response = MsgBox( _
	"IconsOnly" &Chr(10) & _
	"Enable(Yes) or Disable(No)" &Chr(10) & _
	"Exit(Cancel)" _
	, 3 , "Message")
If response = 6 Then
	WshShell.RegWrite regpath(5) & regpath(10) , 1 , "REG_DWORD"
Elseif response = 7 Then
	WshShell.RegWrite regpath(5) & regpath(10) , 0 , "REG_DWORD"
Else
	WScript.Quit
End If
Exit Sub
End Sub

Sub cpl
Dim cplselect
Do
cplselect = InputBox( _
	"1 = AutoPlay" &Chr(10) & _
	"2 = FolderOptions" &Chr(10) & _
	"3 = IndexingOptions" &Chr(10) & _
	"4 = InternetOptions" &Chr(10) & _
	"5 = NetworkAndSharingCenter" &Chr(10) & _
	"6 = NotificationAreaIcons" &Chr(10) & _
	"7 = PowerOptions" &Chr(10) & _
	"8 = SystemPropertiesAdvanced" &Chr(10) & _
	"9 = TaskbarAndStartMenu" &Chr(10) & _
	"10 = UserAccounts" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 0)
Loop While IsNumeric(cplselect) = Flase
Select Case cplselect
	Case 1
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.AutoPlay" , 1 , True)
	Case 2
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.FolderOptions" , 1 , True)
	Case 3
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.IndexingOptions" , 1 , True)
	Case 4
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.InternetOptions" , 1 , True)
	Case 5
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.NetworkAndSharingCenter" , 1 , True)
	Case 6
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.NotificationAreaIcons" , 1 , True)
	Case 7
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.PowerOptions" , 1 , True)
	Case 8
		Return = WshShell.run("%windir%\system32\SystemPropertiesAdvanced.exe" , 1 , True)
	Case 9
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.TaskbarAndStartMenu" , 1 , True)
	Case 10
		Return = WshShell.run("%systemroot%\system32\control.exe /name Microsoft.UserAccounts" , 1 , True)
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub

Sub msc
Dim mscselect
Do
mscselect = InputBox( _
	"1 = compmgmt.msc" &Chr(10) & _
	"2 = diskmgmt.msc" &Chr(10) & _
	"3 = devmgmt.msc" &Chr(10) & _
	"4 = eventvwr.msc" &Chr(10) & _
	"5 = secpol.msc" &Chr(10) & _
	"6 = services.msc" &Chr(10) & _
	"7 = taskschd.msc" &Chr(10) & _
	"8 = appwiz.cpl" &Chr(10) & _
	"9 = control userpasswords2" &Chr(10) & _
	"Select Feature (Other Number = Exit)" , _
	"Input A Number For Your Choice" , 0)
Loop While IsNumeric(mscselect) = Flase
Select Case mscselect
	Case 1
		Return = WshShell.run("compmgmt.msc" , 1 , True)
	Case 2
		Return = WshShell.run("diskmgmt.msc" , 1 , True)
	Case 3
		Return = WshShell.run("%COMSPEC% /c set devmgr_show_nonpresent_devices=1 & devmgmt.msc" , 1 , True)
	Case 4
		Return = WshShell.run("eventvwr.msc" , 1 , True)
	Case 5
		Return = WshShell.run("secpol.msc" , 1 , True)
	Case 6
		Return = WshShell.run("services.msc" , 1 , True)
	Case 7
		Return = WshShell.run("taskschd.msc" , 1 , True)
	Case 8
		Return = WshShell.run("%COMSPEC% /c appwiz.cpl" , 1 , True)
	Case 9
		Return = WshShell.run("control userpasswords2" , 1 , True)
	Case else
		WScript.Quit
End Select
Exit Sub
End Sub

Sub readme
MsgBox _
	"Notice :" &Chr(10) & _
	"1. Run With Administrator" &Chr(10) & _
	"2. Need Desktop Experience(WS2008R2)" &Chr(10) & _
	"" &Chr(10) & _
	"Setting Feature:" &Chr(10) & _
	"RegisteredOwner -> Belldandy" &Chr(10) & _
	"RegisteredOrganization -> Syaorin" &Chr(10) & _
	"Folder Option -> Default Setting" &Chr(10) & _
	"AutoPlay -> Disabled" &Chr(10) & _
	"User Account Control -> Disabled" &Chr(10) & _
	"Security Center -> Disabled (Windows 7 Only)" &Chr(10) & _
	"Windows Defender -> Disabled" &Chr(10) & _
	"Windows Firewall -> Disabled" &Chr(10) & _
	"Themes -> Auto (Windows Server 2008 R2 Only)" &Chr(10) & _
	"Windows Audio -> Auto (Windows Server 2008 R2 Only)" &Chr(10) & _
	"" &Chr(10) & _
	"Folder Option(Default Setting):" &Chr(10) & _
	"Control Panel -> Folder Options -> View -> Advanced settings ->" &Chr(10) & _
	"Hidden files and folders -> Show hidden files, folders, and drives" &Chr(10) & _
	"Hide extensions for known file types -> Unchecked" &Chr(10) & _
	"Hide protected operating system files (Recommended) -> Unchecked" &Chr(10) & _
	"Use Sharing Wizard (Recommended) -> Unchecked (Windows 7 Only)" _
	, 0 , "Setting & Check Tool"
Exit Sub
End Sub
