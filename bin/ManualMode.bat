@echo off
title Manual Mode - ytBATCH %version%
if /I "%mtx%"=="" cls

::Manual Mode
    set mmexe=youtube-dl
    set manualcode=
    if /I "%mtx%"=="" cls
    
    echo Manual Mode - Path is root of ytBATCH
    echo - - - - -
    echo (B) Go Back...
    echo (M) Manual Mode++
    echo - - - - -

    :mreturn
    set /p manualcode=%mmexe% 

    if /I "%manualcode%"=="M" set mmexe= & goto mreturn
    if /I "%manualcode%"=="B" call Launcher.bat
   
    ..\exe\%mmexe% %manualcode%
    echo - - - - -
    goto mreturn
    