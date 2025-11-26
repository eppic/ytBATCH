@echo off
title Downloading... - ytBATCH %version%
%mcls%

if not exist ..\exe mkdir ..\exe

if "%fdcode%"=="ytdl" goto fdl_ytdl
if "%fdcode%"=="ytdlp" goto fdl_ytdlp
if "%fdcode%"=="ffmp" goto fdl_ffmp
if "%fdcode%"=="deno" goto fdl_deno
if "%fdcode%"=="b" call Preferences.bat

echo prefix? ytdlp/ytdl/ffmp/deno
echo   (B) Go Back...
echo old fdcode: %fdcode% .
set /p fdcode=
call FileDownloader.bat

:fdl_ytdl
echo Wait for youtube-dl.exe to download... 
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://youtube-dl.org/downloads/latest/youtube-dl.exe', '..\exe\youtube-dl.exe')"
echo.
echo youtube-dl.exe downloaded.

call Launcher.bat

:fdl_ytdlp
echo Wait for yt-dlp.exe to download... 
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/yt-dlp/yt-dlp/releases/download/2021.10.10/yt-dlp.exe', '..\exe\yt-dlp.exe')"
..\exe\yt-dlp -U
echo.
echo yt-dlp.exe downloaded.

call Launcher.bat

:fdl_ffmp
echo Wait for ffmpeg.exe to download...
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/eppic/ytBATCH-externals/main/ffmpeg.zip', '..\exe\ffmpeg.zip')"
echo Extract...
powershell -command "(Expand-Archive -Force ..\exe\ffmpeg.zip ..\exe\ )"
echo Clean Up...
if exist ..\exe\ffmpeg.exe del ..\exe\ffmpeg.zip
echo.
echo ffmpeg.exe downloaded.

call Launcher.bat

:fdl_deno
echo Wait for deno to install...
echo This will take a moment.
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://deno.land/install.ps1 | iex"
    if %errorlevel%==0 (
        echo deno installed. 
    ) else (
        echo Error installing deno. It is needed for certain youtube downloads
        echo You can try installing it yourself by pasting this command into a powershell window:
        echo irm https://deno.land/install.ps1 | iex
        echo.
        pause
        
    )

call Launcher.bat
