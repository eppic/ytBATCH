goto atpdl


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


:atpdl
::download
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip', '..\ytb_temp.zip')"
pause

::extract
powershell -command "(Expand-Archive -Force ..\ytb_temp.zip ..\ )"
pause

::move
xcopy ..\ytBATCH-main\* ..\ /E /I /H /Y
pause

::delete
rmdir ..\ytBATCH-main /S /Q
pause
del ..\ytb_temp.zip /Q


echo fin
pause
exit

https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip

