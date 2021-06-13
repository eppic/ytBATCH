@echo off
title Checking for Updates - ytBATCH %version%
%mcls%


::Update Menu
    set UpdateCode=
    echo d= ytdl; t= ytbatch-main; b= back
    set /p UpdateCode=COMMAND:
    if /I "%UpdateCode%"=="T" goto ytbatch-main-dl
    if /I "%UpdateCode%"=="D" goto ytdl-dl
    if /I "%UpdateCode%"=="B" call MainMenu.bat
    
    call Updater.bat

::youtube-dl Updater
    :ytdl-dl
    echo Please Wait...
    ..\exe\youtube-dl -U
    pause
    call MainMenu.bat

::ytBATCH Updater
    :ytbatch-main-dl
    ::download
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip', '..\ytb_temp.zip')"
    pause
    
    ::extract
    powershell -command "(Expand-Archive -Force ..\ytb_temp.zip ..\ )"
    pause
    
    ::move
    xcopy ..\ytBATCH-main\* ..\ /E /I /H /Y
    pause
    
    ::delete
    rmdir ..\ytBATCH-main /S /Q
    pause
    del ..\ytb_temp.zip /Q
    pause
    
    call MainMenu.bat