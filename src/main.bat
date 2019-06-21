@echo off
copy settings.ini modules /Y >nul
cd modules
call biorhythm.bat
if exist "display.exe" (call "display.exe") else (if exist "display.au3" call "display.au3")
del /f /q "settings.ini" >nul