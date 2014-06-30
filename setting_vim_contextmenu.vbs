Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vimpath = "C:\portable\vim\vim74\gvim.exe"
If Not (fso.FileExists(vimpath)) Then
	MsgBox "[info] Can't Find gvim.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Dim commanddata(4)
	commanddata(0) = "--noplugin"
	commanddata(1) = "+set nofoldenable"
	commanddata(2) = "+0read !cd /d %1 & dir/on"
	commanddata(3) = "+0read !cd /d %1 & dir/on/s"
Dim regpath(1)
	regpath(0) = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\VIM(dir)\command\"
	regpath(1) = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\VIM(dir+subdir)\command\"
regdata0 = _
	Chr(34) &vimpath &Chr(34) &Chr(32) & _
	Chr(34) &commanddata(0) &Chr(34) &Chr(32) & _
	Chr(34) &commanddata(1) &Chr(34) &Chr(32) & _
	Chr(34) &commanddata(2) &Chr(34)
regdata1 = _
	Chr(34) &vimpath &Chr(34) &Chr(32) & _
	Chr(34) &commanddata(0) &Chr(34) &Chr(32) & _
	Chr(34) &commanddata(1) &Chr(34) &Chr(32) & _
	Chr(34) &commanddata(3) &Chr(34)
WshShell.RegWrite regpath(0) , regdata0 , "REG_SZ"
WshShell.RegWrite regpath(1) , regdata1 , "REG_SZ"
If WshShell.RegRead (regpath(0)) = regdata0 And WshShell.RegRead (regpath(1)) = regdata1 Then
	MsgBox "[ ok ] Install Success" , 0 , "Message"
Else
	MsgBox "[info] Install Error" , 0 , "Message"
End If
