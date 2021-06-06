@echo off
title Reset - ytBATCH %version%
if /I "%mtx%"=="" cls

::Reset Menu
echo WARNING!
echo If you proceed ytBATCH will get deleted and re-downloaded.
echo - - - - -
echo [reset123] Proceed...
echo [B] Go Back...
echo - - - - -

set /p ResetCode=COMMAND:

if /i "%ResetCode%"=="reset123" goto ResetCheck
if /i "%ResetCode%"=="B" call Preferences.bat

call Reset.bat

:ResetCheck
echo Press any key to confirm the deletion of the above listed files.
pause>nul
del youtube-dl.exe
del ffmpeg.exe
del AtomicParsley.exe
if exist ffprobe.exe del ffprobe.exe
if exist UserConfig.bat del UserConfig.bat
echo - - - - -
echo Deleted everything.
pause
if /I "%mtx%"=="" cls
call Launcher.bat
