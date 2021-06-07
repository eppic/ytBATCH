@echo off
title ytBATCH %version%
if /I "%mtx%"=="" cls

::Set Config
    set Version=2.1

    call DefaultConfig.bat
    call UserConfig.bat
    
    if /I "%mtx%"=="" cls

::Check Settings
    ::if "%AutoCookies%"=="T" set CookieSet=--cookies "cookies.txt"
    if not exist ..\UserConfig.bat call Installer.bat

::Check File Integrity...
    if exist "..\exe\youtube-dl.exe" goto intcheck_ytdl
    echo youtube-dl.exe not found. 
    echo Press any key to download the latest version of youtube-dl.exe...
    pause>nul
    set fdcode=ytdl
    call FileDownloader.bat
    :intcheck_ytdl

::Open Menu
    call MainMenu.bat
