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
    if exist "..\Updater.bat" del ..\Updater.bat

    ::echo off switch ("echo")
    if /i "%mecho%"=="" (set mcls=cls) else (set mcls=echo -)

    ::Clean Queue
    if "%CleanQueueStart%"=="T" del ..\QueueList.bat
    %mcls%

::Check File Integrity...
    ::youtube-dl
    if "%ytdlv%"=="yt-dlp" goto ChFIytdlPassed
    if not exist "..\exe\youtube-dl.exe" set DLinfo=T& set fdcode=ytdl& echo youtube-dl.exe not found. & call FileDownloader.bat
    :ChFIytdlPassed
    if not exist "..\exe\yt-dlp.exe" set DLinfo=T& set fdcode=ytdlp& echo yt-dlp.exe not found. & call FileDownloader.bat

    ::ffmpeg
    if exist "..\exe\ffmpeg.zip" powershell -command "(Expand-Archive -Force ..\exe\ffmpeg.zip ..\exe\ )" & del "..\exe\ffmpeg.zip"
    if not exist "..\exe\ffmpeg.exe" set DLinfo=T& set fdcode=ffmp& echo ffmpeg.exe not found. & call FileDownloader.bat

    if /i "%DLinfo%"=="T" echo Download finished! & pause

::AutoUpdate
    if /i not "%AUEnb%"=="T" goto :AU_Passed
    start /min .\AutoUpdate.bat
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

    choice /c BYNX /n
    set ytbupcode=%errorlevel%

    if /i "%ytbupcode%"=="2" set ytbAU=pass& call Updater.bat 
    if /i "%ytbupcode%"=="3" goto AU_Passed
    if /i "%ytbupcode%"=="1" goto AU_Passed
    if /i "%ytbupcode%"=="4" del ..\update.info & goto AU_Passed
    goto UpMsg_UpdateDL

    :AU_Passed

::Open Menu
    call MainMenu.bat
    