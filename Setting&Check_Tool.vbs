Set WshShell = WScript.CreateObject("WScript.Shell")
MsgBox "Notice:" &Chr(10) & _
       "" &Chr(10) & _
       "1. Run With Administrator" &Chr(10) & _
       "2. Need Desktop Experience(WS2008R2)" &Chr(10) & _
       "3. Before Use , Please Read Readme" , 0 , "Setting & Check Tool"
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
	regpath(9) = "SeparateProcess"
	regpath(10) = "ShowCompColor"
	regpath(11) = "SharingWizardOn"
	regpath(12) = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\IconsOnly"
Dim osselect
Do
osselect = InputBox("1 = Setting Windows 7" &Chr(10) & _
                    "2 = Setting Windows Server 2008 R2" &Chr(10) & _
                    "3 = Check Setting" &Chr(10) & _
                    "4 = Misc Setting" &Chr(10) & _
                    "9 = Readme" &Chr(10) & _
                    "Select Feature (Other Number = Exit)" , _
                    "Input A Number For Your Choice" , 9)
Loop While IsNumeric(osselect) = Flase
Select Case osselect
	Case 1
		' Return = WshShell.run("%COMSPEC% /k sc config wscsvc start= disabled" , 1 , True)
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
	Case 9
		Call readme
	Case else
		WScript.Quit
End select

Sub sharesetting
	Return = WshShell.run("sc config WinDefend start= disabled" , 1 , True)
	Return = WshShell.run("sc config MpsSvc start= disabled" , 1 , True)
	WshShell.RegWrite regpath(0) & regpath(1) , "Belldandy" , "REG_SZ"
	WshShell.RegWrite regpath(0) & regpath(2) , "Syaorin" , "REG_SZ"
	WshShell.RegWrite regpath(3) , 1 , "REG_DWORD"
	WshShell.RegWrite regpath(4) , 0 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(6), 1 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(7), 0 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(8), 1 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(9), 1 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(10), 0 , "REG_DWORD"
	WshShell.RegWrite regpath(5) & regpath(11), 0 , "REG_DWORD"
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
	co(5) = WshShell.RegRead(regpath(5) & regpath(9))
	co(6) = WshShell.RegRead(regpath(5) & regpath(10))
	co(7) = WshShell.RegRead(regpath(5) & regpath(11))
If co(2) = 1 And co(3) = 0 And co(4) = 1 And co(5) = 1 And co(6) = 0 And co(7) = 0 Then
	co(8) = "Default Setting"
Else
	co(8) = "Unknow Setting"
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
checkosselect = InputBox("1 = Check Windows 7" &Chr(10) & _
                         "2 = Check Windows Server 2008 R2" &Chr(10) & _
                         "Select Feature (Other Number = Exit)" , _
                         "Input A Number For Your Choice" , 0)
Loop While IsNumeric(checkosselect) = Flase
Select Case checkosselect
	Case 1
		Set wscsvc = objWMIService.Get("Win32_Service.Name='wscsvc'")
		MsgBox "ComputerName = " &co(9) &Chr(10) & _
		       "ComputerWorkgroup = " &co(10) &Chr(10) & _
		       "RegisteredOwner = " &co(0) &Chr(10) & _
		       "RegisteredOrganization = " &co(1) &Chr(10) & _
		       "Folder Options Setting = " &co(8) &Chr(10) & _
		       "Autoplay = " &co(12) &Chr(10) & _
		       "UAC = " &co(14) &Chr(10) & _
		       "Security Center : " &wscsvc.State &" , " &wscsvc.StartMode &Chr(10) & _
		       "Windows Defender : " &WinDefend.State &" , " &WinDefend.StartMode &Chr(10) & _
		       "Windows Firewall : " &MpsSvc.State &" , " &MpsSvc.StartMode  , 0 , "Message"
	Case 2
		Set Themes = objWMIService.Get("Win32_Service.Name='Themes'")
		Set AudioSrv = objWMIService.Get("Win32_Service.Name='AudioSrv'")
		MsgBox "ComputerName = " &co(9) &Chr(10) & _
		       "ComputerWorkgroup = " &co(10) &Chr(10) & _
		       "RegisteredOwner = " &co(0) &Chr(10) & _
		       "RegisteredOrganization = " &co(1) &Chr(10) & _
		       "Folder Options Setting = " &co(8) &Chr(10) & _
		       "Autoplay = " &co(12) &Chr(10) & _
		       "UAC = " &co(14) &Chr(10) & _
		       "Windows Defender : " &WinDefend.State &" , " &WinDefend.StartMode &Chr(10) & _
		       "Windows Firewall : " &MpsSvc.State &" , " &MpsSvc.StartMode &Chr(10) & _
		       "Themes : " &Themes.State &" , " &Themes.StartMode &Chr(10) & _
		       "Windows Audio : " &AudioSrv.State &" , " &AudioSrv.StartMode , 0 , "Message"
	Case else
		WScript.Quit
End select
Exit Sub
End Sub

Sub miscsetting
Dim response
response = MsgBox("IconsOnly Enable(Yes) or Disable(No)" , 4, "Message")
If response = 6 Then
	WshShell.RegWrite regpath(12) , 1 , "REG_DWORD"
Else
	WshShell.RegWrite regpath(12) , 0 , "REG_DWORD"
End If
Exit Sub
End Sub

Sub readme
MsgBox "Setting Feature:" &Chr(10) & _
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
       "Hide extensions for known file types -> Not selected" &Chr(10) & _
       "Hide protected operating system files (Recommended) -> Not selected" &Chr(10) & _
       "Launch folder windows in a separate process -> Selected" &Chr(10) & _
       "Show encrypted or compressed NTFS files in color -> Not selected" &Chr(10) & _
       "Use Sharing Wizard (Recommended) -> Not selected" , 0 , "Message"
Exit Sub
End Sub
