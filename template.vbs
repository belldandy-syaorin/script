Set WshShell = WScript.CreateObject("WScript.Shell")
Dim argument(2)
argument(0) = "C:\Windows\AppPatch\AppLoc.exe"
argument(1) = "" 'application path
argument(2) = "" 'taiwan(/L0404),prc(/L0804),japan(/L0411),korea(/L0412)
Return = WshShell.Run(Chr(34) &argument(0) &Chr(34) &Chr(32) _
                     &Chr(34) &argument(1) &Chr(34) &Chr(32) _
                     &Chr(34) &argument(2) &Chr(34) , 1, true)
