@echo off
title Manual Mode - ytBATCH %version%
%mcls%

::Manual Mode
    set manualcode=
    %mcls%
    
    echo Manual Mode - Path is .\bin
    echo.
    echo (B) Go Back...
    echo.

    :mmreturn
    set /p manualcode=youtube-dl 

    if /i "%manualcode%"=="B" call Launcher.bat
   
    ..\exe\youtube-dl.exe %manualcode%

    goto mmreturn
    