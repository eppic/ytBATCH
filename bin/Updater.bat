@echo off
title Checking for Updates - ytBATCH %version%
%mcls%

::Check for yt-dl Updates
echo Please Wait...
..\exe\youtube-dl -U
pause
call MainMenu.bat
