Set WshShell = WScript.CreateObject("WScript.Shell")
Dim argument(2)
argument(0) = "C:\Windows\AppPatch\AppLoc.exe"
argument(1) = "" 'application path
argument(2) = "" 'taiwan(/L0404),prc(/L0804),japan(/L0411),korea(/L0412)
Return = WshShell.Run(argument(0) &Chr(32) _
                     &argument(1) &Chr(32) _
                     &argument(2) , 1, true)
