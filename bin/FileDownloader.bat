@echo off
title Downloading youtube-dl.exe - ytBATCH %version%
%mcls%

if not exist ..\exe mkdir ..\exe

if "%fdcode%"=="ytdl" goto fdl_ytdl
if "%fdcode%"=="ytdlp" goto fdl_ytdlp
if "%fdcode%"=="ffmp" goto fdl_ffmp
if "%fdcode%"=="atps" goto fdl_atps
echo prefix? ytdl(p)/ffmp/atps?
echo %fdcode% .
set /p fdcode=
call FileDownloader.bat

:fdl_ytdl
echo Wait for youtube-dl.exe to download... 
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://youtube-dl.org/downloads/latest/youtube-dl.exe', '..\exe\youtube-dl.exe')"
echo.
echo youtube-dl.exe downloaded.
pause

call Launcher.bat

:fdl_ytdlp
echo Wait for yt-dlp.exe to download... 
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/yt-dlp/yt-dlp/releases/download/2021.08.10/yt-dlp.exe', '..\exe\yt-dlp.exe')"
..\exe\yt-dlp -U
echo.
echo yt-dlp.exe downloaded.
pause

call Launcher.bat

:fdl_ffmp
echo Wait for ffmpeg.exe to download...
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/eppic/ytBATCH/main/exe/ffmpeg.exe', '..\exe\ffmpeg.exe')"
echo.
echo ffmpeg.exe downloaded.
pause

call Launcher.bat

:fdl_atps
echo Wait for AtomicParsley .exe to download...
echo This will take a moment.
::powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/eppic/ytBATCH/main/exe/AtomicParsley.exe', '..\exe\AtomicParsley.exe')"
echo ERROR: No AtomicParsley Support anymore, download manually
echo.
echo AtomicParsley.exe downloaded.
pause

call Launcher.bat