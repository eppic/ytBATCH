@echo off
title Check for Updates - ytBATCH %version%
%mcls%

::Skip to ytb Update?
    if /i "%ytbUpPass%"=="pass" goto ytbUpPassed

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
    
    set /p UpdateCode=COMMAND:
    
    if /i "%UpdateCode%"=="Y" start "" "https://github.com/eppic/ytBATCH/releases/latest"
    if /i "%UpdateCode%"=="MAIN" goto ytbatch-main-dl
    if /i "%UpdateCode%"=="D" goto ytdl-dl
    if /i "%UpdateCode%"=="T" goto ytbatch-release-dl
    if /i "%UpdateCode%"=="B" call MainMenu.bat
    
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
    echo If you want do update, please download the latest version manually.
    echo.
    echo Update anyway?
    echo.
    echo  (Y) Yes...
    echo  (N) No...
    echo.

    set /p ytbupcode=COMMAND:
    if /i "%ytbupcode%"=="Y" goto ytbuppassedmain
    if /i "%ytbupcode%"=="N" call Updater.bat
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

    set /p ytbupcode=COMMAND:
    if /i "%ytbupcode%"=="Y" goto ytbuppassedrelease
    if /i "%ytbupcode%"=="N" call Updater.bat
    goto UpMsg_UpdateDL
    :ytbuppassedrelease
    
    %mcls%
    echo Downloading...
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/eppic/ytBATCH/releases/download/2.7/ytBATCH_%latestversion%.zip', '..\ytb_temp.zip')"

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
    echo.
    echo Updated ytBATCH to the latest version!
    set ytbUpPass=
    pause
    call Launcher.bat