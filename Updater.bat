@echo off
title Checking for Updates - ytBATCH %version%
cls

::Check for Updates
echo Please Wait...
youtube-dl -U
pause
call MainMenu.bat
