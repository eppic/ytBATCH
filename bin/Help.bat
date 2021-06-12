@echo off
title Help - ytBATCH %version%
%mcls%

::Open youtube-dl Help Page
    ..\exe\youtube-dl --help
    pause
    call MainMenu.bat