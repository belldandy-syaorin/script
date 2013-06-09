Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vimpath = "C:\portable\vim\vim73\gvim.exe"
If Not (fso.FileExists(vimpath)) Then
	MsgBox "[info] Can't Find gvim.exe & Exit" , 0 , "Message"
	WScript.Quit
End If
Dim commanddata(4)
	commanddata(0) = "--noplugin"
	commanddata(1) = "+set nofoldenable"
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
If WshShell.RegRead (regpath(0)) = regdata And _
   WshShell.RegRead (regpath(1)) = regdatadiff Then
	MsgBox "[ ok ] Install Success" , 0 , "Message"
Else
	MsgBox "[info] Install Error" , 0 , "Message"
End If
