@echo off
title Check for Updates - ytBATCH %version%
%mcls%

::Update Menu

    set UpdateCode=
    echo Update Center
    echo.
    echo   (Y) Open latest ytBATCH release...
    echo   (D) Update %ytdlv%...
    echo.
    echo   (T) Update to latest Main Branch (experimental)
    echo.
    echo (B) Go Back...
    echo.
    
    set /p UpdateCode=COMMAND:
    
    if /i "%UpdateCode%"=="Y" start "" "https://github.com/eppic/ytBATCH/releases/latest"
    if /i "%UpdateCode%"=="T" goto ytbatch-main-dl
    if /i "%UpdateCode%"=="D" goto ytdl-dl
    if /i "%UpdateCode%"=="B" call MainMenu.bat
    
    call Updater.bat

::youtube-dl Updater
    :ytdl-dl
    echo.
    echo Please Wait...
    ..\exe\%ytdlv% -U
    echo.
    
    pause
    call MainMenu.bat

::ytBATCH Updater
    :ytbatch-main-dl
    set ytbupcode=
    %mcls%
    echo WARNING! 
    echo. 
    echo Updating to this version of ytBATCH is NOT RECOMMENDED.
    echo If you want do update, please download the latest version manually.
    echo.
    echo Update anyway?
    echo.
    echo  (Y) Yes...
    echo  (N) No...
    echo.

    set /p ytbupcode=COMMAND:
    if /i "%ytbupcode%"=="Y" goto ytbuppassed
    if /i "%ytbupcode%"=="N" call Updater.bat
    goto ytbatch-main-dl
    :ytbuppassed

    ::download
    echo Downloading latest Main Branch...
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip', '..\ytb_temp.zip')"

    ::extract
    echo Extracting zip...
    powershell -command "(Expand-Archive -Force ..\ytb_temp.zip ..\ )"

    ::move
    echo Moving...
    xcopy ..\ytBATCH-main\* ..\ /E /i /H /Y

    ::delete
    echo Deleting temporary files...
    rmdir ..\ytBATCH-main /S /Q
    del ..\ytb_temp.zip /Q
    echo.
    echo Updated ytBATCH to latest Main Branch (Problems may occur!)
    pause
    call Launcher.bat