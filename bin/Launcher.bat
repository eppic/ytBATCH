@echo off
title ytBATCH %version%
%mcls%

::Load Config
    set /p version=<versionnumber.info

    ::Check for Config, open Installer 
    if not exist ..\cfg\UserConfig.bat call Installer.bat

    ::load config, overwrite with user
    call DefaultConfig.bat
    call ..\cfg\UserConfig.bat

    ::rename custom.conf to youtube-dl.conf, create new one
    if exist "..\cfg\custom.conf" ren "..\cfg\custom.conf" "youtube-dl.conf"
    if not exist ..\cfg\youtube-dl.conf copy nul ..\cfg\youtube-dl.conf
    
    ::remove temporary files
    del ..\Updater.bat

    ::echo off switch ("echo")
    if /i "%mecho%"=="" (set mcls=cls) else (set mcls=echo -)

    ::Clean Queue
    if "%CleanQueueStart%"=="T" del ..\QueueList.bat
    %mcls%

    ::old version yt-dl check
    if not exist ..\exe\youtube-dl.exe goto oldvcheckpassed
    if exist ..\exe\yt-dlp.exe goto oldvcheckpassed
    echo ytBATCH has switched from youtube-dl.exe to yt-dlp.exe
    echo This requires the latest version of yt-dlp.
    pause
    %mcls%
    :oldvcheckpassed
    
::Check File Integrity...
    ::youtube-dl
    if "%ytdlv%"=="yt-dlp" goto ChFIytdlPassed
    if not exist "..\exe\youtube-dl.exe" set fdcode=ytdl& echo youtube-dl.exe not found. & echo Press any key to download the latest version of youtube-dl.exe... & pause>nul & call FileDownloader.bat
    :ChFIytdlPassed
    if not exist "..\exe\yt-dlp.exe" set fdcode=ytdlp& echo yt-dlp.exe not found. & echo Press any key to download the latest version of yt-dlp.exe... & pause>nul & call FileDownloader.bat

    ::ffmpeg
    if exist "..\exe\ffmpeg.zip" powershell -command "(Expand-Archive -Force ..\exe\ffmpeg.zip ..\exe\ )" & del "..\exe\ffmpeg.zip"
    if not exist "..\exe\ffmpeg.exe" set fdcode=ffmp& echo ffmpeg.exe not found. & echo Press any key to download ffmpeg.exe... & pause>nul & call FileDownloader.bat
    
::AutoUpdate
    if /i not "%AUEnb%"=="T" goto :AU_Passed
    if not exist AutoUpdate.lnk powershell.exe "powershell -ExecutionPolicy Bypass -File AutoUpdate.ps1"
    start AutoUpdate.lnk
    if not exist ..\update.info goto AU_Passed
    
    set /p latestversion=<..\update.info

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
    if /i "%ytbupcode%"=="Y" set ytbAU=pass& call Updater.bat 
    if /i "%ytbupcode%"=="N" goto AU_Passed
    if /i "%ytbupcode%"=="B" goto AU_Passed
    goto UpMsg_UpdateDL

    :AU_Passed

::Open Menu
    call MainMenu.bat
    