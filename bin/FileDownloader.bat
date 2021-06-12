@echo off
title Downloading youtube-dl.exe - ytBATCH %version%
%mcls%

echo Wait for youtube-dl.exe to download... 
echo This will take a moment.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://youtube-dl.org/downloads/latest/youtube-dl.exe', '..\exe\youtube-dl.exe')"
echo - - - - -
echo youtube-dl.exe downloaded.
pause

call Launcher.bat
