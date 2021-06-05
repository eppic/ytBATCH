@echo off
title ytBATCH %version%
cls

::Set Config
    set Version=2.0

    call DefaultConfig.bat
    call UserConfig.bat
    cls

::Check Settings
    if "%AutoCookies%"=="T" set CookieSet=--cookies "cookies.txt"

::File Check
    if exist "youtube-dl.exe" goto filecheck_ytdl
    echo youtube-dl.exe not found. 
    echo Press any key to download the latest version of youtube-dl.exe...
    pause>nul
    set fdcode=ytdl
    call FileDownloader.bat
    :filecheck_ytdl

    if exist "ffmpeg.exe" goto filecheck_ffmpeg
    echo ffmpeg.exe not found. 
    echo Press any key to download ffmpeg.exe ...
    pause>nul
    set fdcode=ffmp
    call FileDownloader.bat
    :filecheck_ffmpeg

    ::Skipping AtomicParsley
    goto filecheck_atomic

    if exist "AtomicParsley.exe" goto filecheck_atomic
    echo AtomicParsley.exe not found. 
    echo Press any key to download AtomicParsley.exe ...
    pause>nul
    set fdcode=atpa
    call FileDownloader.bat
    :filecheck_atomic

    set fdcode=
::Open Menu
    call MainMenu.bat
