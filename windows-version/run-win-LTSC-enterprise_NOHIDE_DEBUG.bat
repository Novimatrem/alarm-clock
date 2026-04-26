@echo off
@title Launcher (Win LTSC) vRolling
cls

echo.
echo Pay attention!
echo.
echo If the line under this message says "Access is denied.", go to the script's folder,
echo and re-run this script as admin by right-clicking run-win-LTSC-enterprise.bat and pressing Run as administrator! 
echo For reference, the script's folder is: (Folder: "%~dp0" )
echo VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
echo.
mklink "C:\Program Files\Git\alarm-clock.sh" "C:\Users\%username%\alarm-clock.sh"
echo.
echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If it gets created, or says that it already exists, you're good, now simply
cls
echo Downloading dependencies...
echo please wait
echo.
echo.
cd /D "%~dp0"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/microsoft/terminal/releases/download/v1.18.1462.0/Microsoft.WindowsTerminalPreview_1.18.1462.0_x64.zip', 'package.zip')"
powershell -Command "Invoke-WebRequest https://github.com/microsoft/terminal/releases/download/v1.18.1462.0/Microsoft.WindowsTerminalPreview_1.18.1462.0_x64.zip -OutFile package.zip"
powershell -command "Expand-Archive -Force '%~dp0package.zip' '%~dp0'"
cd /D "%~dp0"
cd terminal-1.18.1462.0
echo.
echo Starting...
echo You can close THIS Terminal window now, as
echo the script should be open inside another new one.
.\wt.exe wt.exe "C:\Program Files\Git\git-bash.exe" -c "bash ../alarm-clock.sh"
cd /D "%~dp0"

REM EOF
:eof
cls
echo Game launched, you should see it in another window!
echo.
echo Hey, by the way, this thing thinks the current path is
echo %~dp0
echo.
echo To close this Terminal window,
exit
