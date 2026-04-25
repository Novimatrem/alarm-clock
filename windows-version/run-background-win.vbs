Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run Chr(34) & ".\run-win-LTSC-enterprise.bat" & Chr(34), 0
Set WinScriptHost = Nothing
