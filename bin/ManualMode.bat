@echo off
title Manual Mode - ytBATCH %version%
%mcls%

::Manual Mode
    set manualcode=
    %mcls%
    
    echo Manual Mode - Path is root of ytBATCH
    echo - - - - -
    echo (B) Go Back...
    echo (M) Manual Mode++
    echo - - - - -

    :mmreturn
    set /p manualcode=youtube-dl 

    if /I "%manualcode%"=="M" goto mmplus
    if /I "%manualcode%"=="B" call Launcher.bat
   
    ..\exe\youtube-dl.exe %manualcode%

    goto mmreturn
    
    :mmplus

    %mcls%
    echo Manual Mode ++ - no prefix
    echo - - - - -
    echo (B) Go Back...
    echo - - - - -

    :mmpreturn
    cd ..\exe\
    set /p manualpluscode=
    
    if /I "%manualpluscode%"=="B" cd ..\bin\ & call Launcher.bat 

    %manualpluscode%

    goto mmpreturn
    