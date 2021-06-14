@echo off
title Check for Updates - ytBATCH %version%
%mcls%

::Update Menu
    set UpdateCode=

    echo (A) Update All...
    echo (T) Update ytBATCH...
    echo (D) Update youtube-dl...
    echo.
    echo (B) Go Back...
    echo.

    set /p UpdateCode=COMMAND:
    
    if /I "%UpdateCode%"=="A" set UpAll=T & goto ytdl-dl
    if /I "%UpdateCode%"=="T" goto ytbatch-main-dl
    if /I "%UpdateCode%"=="D" goto ytdl-dl
    if /I "%UpdateCode%"=="B" call MainMenu.bat
    
    call Updater.bat

::youtube-dl Updater
    :ytdl-dl
    echo.
    echo Please Wait...
    ..\exe\youtube-dl -U
    echo.

    if not "%UpAll%"=="" goto ytbatch-main-dl

    pause
    call MainMenu.bat

::ytBATCH Updater
    :ytbatch-main-dl
    set UpAll=
    echo.

    ::download
    echo Downloading latest Main Branch...
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip', '..\ytb_temp.zip')"

    ::extract
    echo Extracting zip...
    powershell -command "(Expand-Archive -Force ..\ytb_temp.zip ..\ )"

    ::move
    echo Moving...
    xcopy ..\ytBATCH-main\* ..\ /E /I /H /Y

    ::delete
    echo Deleting temporary files...
    rmdir ..\ytBATCH-main /S /Q
    del ..\ytb_temp.zip /Q
    echo.
    echo Updated ytBATCH to latest Main Branch (Problems may occur!)
    pause
    call New.bat