Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run("rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:""" &WshShell.ExpandEnvironmentStrings("%SystemRoot%")&"\Resources\Themes\aero.theme""")
