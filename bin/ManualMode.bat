@echo off
title Manual Mode - ytBATCH %version%
if /I "%mtx%"=="" cls

::Manual Mode
    set mmexe=youtube-dl
    set manualcode=
    :mmplus
    if /I "%mtx%"=="" cls
    echo Manual Mode - Enter Code by yourself - If not allocated the output is in the root folder of ytBATCH. 
    echo - - - - -
    echo (B) Go Back...
    if /I "%mmexe%"=="youtube-dl" echo (M) Manual Mode++
    echo - - - - -
    set /p manualcode=%mmexe% 
    if /I "%manualcode%"=="M" set mmexe= & goto mmplus
    if /I "%manualcode%"=="B" call Launcher.bat
    if /I "%mtx%"=="" cls
    echo %mmexe% %manualcode% 
    %mmexe% %manualcode%
    pause
    call Launcher.bat
    