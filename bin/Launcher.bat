@echo off
title ytBATCH %version%
%mcls%

::Load Config
    set Version=2.6.3

    ::Check for Config, open Installer 
    if not exist ..\cfg\UserConfig.bat call Installer.bat

    ::load config, overwrite with user
    call DefaultConfig.bat
    call ..\cfg\UserConfig.bat

    ::rename custom.conf to youtube-dl.conf, create new one
    if exist "..\cfg\custom.conf" ren "..\cfg\custom.conf" "youtube-dl.conf"
    if not exist ..\cfg\youtube-dl.conf copy nul ..\cfg\youtube-dl.conf
            
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
    if not exist "..\exe\yt-dlp.exe" set fdcode=ytdlp& echo yt-dlp.exe not found. & echo Press any key to download the latest version of yt-dlp.exe... & pause>nul & call FileDownloader.bat
    if not exist "..\exe\ffmpeg.exe" set fdcode=ffmp& echo ffmpeg.exe not found. & echo Press any key to download the latest version of ffmpeg.exe... & pause>nul & call FileDownloader.bat
    if not exist "..\exe\AtomicParsley.exe" set fdcode=atps& echo AtomicParsley.exe not found. & echo Press any key to download the latest version of AtomicParsley.exe... & pause>nul & call FileDownloader.bat

::Open Menu
    call MainMenu.bat
    