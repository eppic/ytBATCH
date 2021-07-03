@echo off
title ytBATCH %version%
%mcls%

::Set Config
    set Version=2.5

    call DefaultConfig.bat
    call ..\cfg\UserConfig.bat
    
    if /i "%mecho%"=="" (set mcls=cls) else (set mcls=echo -)

::Check Config
    if not exist ..\cfg\UserConfig.bat call Installer.bat

::Check File Integrity...
    if not exist "..\exe\youtube-dl.exe" set fdcode=ytdl& echo youtube-dl.exe not found. & echo Press any key to download the latest version of youtube-dl.exe... & pause>nul & call FileDownloader.bat
    set ytdl=
    if not exist "..\exe\ffmpeg.exe" set fdcode=ffmp& echo ffmpeg.exe not found. & echo Press any key to download the latest version of ffmpeg.exe... & pause>nul & call FileDownloader.bat
    set ffmp=
    if not exist "..\exe\AtomicParsley.exe" set fdcode=atps& echo AtomicParsley.exe not found. & echo Press any key to download the latest version of AtomicParsley.exe... & pause>nul & call FileDownloader.bat
    set atps=

::Open Menu
    call MainMenu.bat
