@echo off
title Check for Updates - ytBATCH %version%
%mcls%

::Skip to ytb Update?
    if /i "%ytbUpPass%"=="pass" goto ytbUpPassed
    if /i "%ytbAU%"=="pass" goto ytbatch-release-dl

::Update Menu
    set UpdateCode=
    echo Update Center
    echo.
    echo   (T) Update ytBATCH
    echo   (D) Update %ytdlv%...
    echo.
    echo   (Y) View latest ytBATCH release...
    echo.
    echo (B) Go Back...
    echo.
    
    choice /c BYMDT /n
    set UpdateCode=%errorlevel%
    
    if /i "%UpdateCode%"=="2" start "" "https://github.com/eppic/ytBATCH/releases/latest"
    if /i "%UpdateCode%"=="3" goto ytbatch-main-dl
    if /i "%UpdateCode%"=="4" goto ytdl-dl
    if /i "%UpdateCode%"=="5" goto ytbatch-release-dl
    if /i "%UpdateCode%"=="1" call MainMenu.bat
    
    call Updater.bat

::youtube-dl Updater
    :ytdl-dl
    echo.
    echo Please Wait...
    ..\exe\%ytdlv% -U
    echo.
    
    pause
    call Updater.bat

::ytBATCH Updater (Main)
    :ytbatch-main-dl
    set ytbupcode=
    %mcls%
    echo WARNING! 
    echo. 
    echo Updating to this version of ytBATCH is NOT RECOMMENDED.
    echo.
    echo Update anyway?
    echo.
    echo  (Y) Yes...
    echo  (N) No...
    echo.

    choice /c YN /n
    set ytbupcode=%errorlevel%

    if /i "%ytbupcode%"=="1" goto ytbuppassedmain
    if /i "%ytbupcode%"=="2" call Updater.bat
    goto ytbatch-main-dl
    :ytbuppassedmain

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

::ytBATCH Updater (Release)
    :ytbatch-release-dl
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/eppic/ytBATCH/main/bin/versionnumber.info', '..\updatecheck_temp.info')"
    
    ::set latest version to var
    set /p latestversion=<..\updatecheck_temp.info
    del ..\updatecheck_temp.info
    
    ::check if error
    if /i "%latestversion%"=="" echo ERROR & pause & call Updater.bat

    ::AutoUpdater Skip
    if "%ytbAU%"=="pass" goto ytbuppassedrelease
    ::check if same
    if /i "%version%"=="%latestversion%" (goto UpMsg_UpToDate) else (goto UpMsg_UpdateDL)
        
    :UpMsg_UpToDate
    echo ytBATCH is up to date. (%latestversion%)
    pause
    call Updater.bat

    :UpMsg_UpdateDL
    set ytbupcode=
    %mcls%
    echo There is a new version of ytBATCH. (%latestversion%) 
    echo.
    echo Do you want to update now?

    echo.
    echo  (Y) Yes...
    echo  (N) No...
    echo.

    choice /c BYN /n
    set ytbupcode=%errorlevel%

    if /i "%ytbupcode%"=="2" goto ytbuppassedrelease
    if /i "%ytbupcode%"=="3" call Updater.bat
    if /i "%ytbupcode%"=="1" call Updater.bat
    goto UpMsg_UpdateDL
    :ytbuppassedrelease
    
    %mcls%
    echo Downloading...
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/eppic/ytBATCH/releases/download/%latestversion%/ytBATCH_%latestversion%.zip', '..\ytb_temp.zip')"

    echo Extracting...
    powershell -command "(Expand-Archive -Force ..\ytb_temp.zip ..\temp\ )"

    set ytbUpPass=pass
    xcopy Updater.bat ..\ /E /i /H /Y
    call ..\Updater.bat
    
    :ytbUpPassed

    echo Moving...
    xcopy ..\temp\* ..\ /E /i /H /Y

    echo Cleaning temporary files...
    del ..\ytb_temp.zip /Q
    rmdir ..\temp /S /Q
    if exist ..\update.info del ..\update.info
    echo.
    echo Updated ytBATCH to the latest version!
    set ytbUpPass=
    pause
    call Launcher.bat