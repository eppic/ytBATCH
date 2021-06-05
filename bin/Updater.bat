@echo off
title Checking for Updates - ytBATCH %version%
if /I "%mtx%"=="" cls

::Check for Updates
echo Please Wait...
youtube-dl -U
pause
call MainMenu.bat
