@echo off
title Download Files - ytBATCH %version%
if /I "%mtx%"=="" cls

::Launch Checker
    if /i "%fdcode%"=="ytdl" goto ytdl_dl
    if /i "%fdcode%"=="ffmp" goto ffmp_dl
    if /i "%fdcode%"=="atpa" goto atpa_dl

::File Downloader Menu
    echo Download Files!
    echo (Y) Download youtube-dl.exe
    echo (F) Download ffmpeg.exe
    echo (A) Download AtomicParsley.exe
    echo (P) Download ffprobe.exe
    echo - - - - -
    echo (B) Go Back...

    set /p DLFilesCode=COMMAND:

    if /i "%DLFilesCode%"=="Y" goto ytdl_dl
    if /i "%DLFilesCode%"=="F" goto ffmp_dl
    if /i "%DLFilesCode%"=="A" goto atpa_dl
    if /i "%DLFilesCode%"=="P" goto ffpr_dl
    if /i "%DLFilesCode%"=="" call FileDownloader.bat

    if /i "%DLFilesCode%"=="B" call Preferences.bat

    call FileDownloader.bat

::File Downloader
    :ytdl_dl
    if /I "%mtx%"=="" cls
    echo Wait for youtube-dl.exe to download... 
    echo This will take a moment.
    powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://youtube-dl.org/downloads/latest/youtube-dl.exe\", \"youtube-dl.exe\")"
    echo - - - - -
    echo youtube-dl.exe downloaded.
    pause
    call Launcher.bat

    :ffmp_dl
    echo Wait for ffmpeg.exe to download... 
    echo This will take a moment.
    powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://docs.google.com/uc?export=download&id=1H6Ft1f7fVwyEcbwinFIygLNyuj9a6j22", \"ffmpeg.exe\")"
    echo - - - - -
    echo ffmpeg.exe downloaded.
    pause
    call Launcher.bat

    :atpa_dl
    echo Wait for AtomicParsley.exe to download... 
    echo This will take a moment.
    powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://bit.ly/3t3Grcd\", \"AtomicParsley.exe\")"
    echo - - - - -
    echo AtomicParsley.exe downloaded.
    pause
    call Launcher.bat

    :ffpr_dl
    echo Wait for ffprobe.exe to download... 
    echo This will take a moment.
    powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"https://bit.ly/3mTiwtI\", \"ffprobe.exe\")"
    echo - - - - -
    echo ffprobe.exe downloaded.
    pause
    call Launcher.bat
