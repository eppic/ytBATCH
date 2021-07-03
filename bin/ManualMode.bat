@echo off
title Manual Mode - ytBATCH %version%
%mcls%

::Manual Mode
    cd ..\
    
    echo Manual Mode - Path is Root
    echo.
    echo (B) Go Back...
    echo.

    :mmreturn
    set manualcode=
    set /p manualcode=youtube-dl 

    if /i "%manualcode%"=="B" cd .\bin&call Launcher.bat 
   
    .\exe\youtube-dl.exe %manualcode%

    goto mmreturn
    