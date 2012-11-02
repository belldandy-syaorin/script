Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vimpath = "C:\portable\vim\vim73\gvim.exe"
If Not (fso.FileExists(vimpath)) Then
	MsgBox "[info] Can't Find gvim.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Dim commanddata(3)
	commanddata(0) = "+set shellcmdflag=/u/c"
	commanddata(1) = "+set enc=ucs-2le"
	commanddata(2) = "+lcd %1"
	commanddata(3) = "+0read !dir/on"
commanddatadiff = "/s"
Dim regpath(1)
	regpath(0) = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\Vim(dir)\command\"
	regpath(1) = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\Vim(dir+subdir)\command\"
regdata = Chr(34) &vimpath &Chr(34) &Chr(32) & _
          Chr(34) &commanddata(0) &Chr(34) &Chr(32) & _
          Chr(34) &commanddata(1) &Chr(34) &Chr(32) & _
          Chr(34) &commanddata(2) &Chr(34) &Chr(32) & _
          Chr(34) &commanddata(3) &Chr(34)
regdatadiff = Chr(34) &vimpath &Chr(34) &Chr(32) & _
              Chr(34) &commanddata(0) &Chr(34) &Chr(32) & _
              Chr(34) &commanddata(1) &Chr(34) &Chr(32) & _
              Chr(34) &commanddata(2) &Chr(34) &Chr(32) & _
              Chr(34) &commanddata(3) &commanddatadiff &Chr(34)
WshShell.RegWrite regpath(0) , regdata , "REG_SZ"
WshShell.RegWrite regpath(1) , regdatadiff , "REG_SZ"
Dim checkdata(3)
	checkdata(0) = WshShell.RegRead (regpath(0))
	checkdata(1) = WshShell.RegRead (regpath(1))
	checkdata(2) = regdata
	checkdata(3) = regdatadiff
If checkdata(0) = checkdata(2) And checkdata(1) = checkdata(3) Then
	MsgBox "[ ok ] Install Success" , 0 , "Message"
Else
	MsgBox "[info] Install Error" , 0 , "Message"
End If
