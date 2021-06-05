@echo off
title Help - ytBATCH %version%
if /I "%mtx%"=="" cls

::Open youtube-dl Help Page
    youtube-dl --help
    pause
    call MainMenu.bat