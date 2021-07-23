@echo off
title Choose Format - ytBATCH %version%
%mcls%

::Download Audio
    set FormatListCode=
    echo Checking available formats...
    echo.
    ..\exe\youtube-dl -F %Url%
    echo.
    echo (B) Go Back...
    echo.
    
    :ReturnFLC
    set /P FormatListCode=Code:
    if /i "%FormatListCode%"=="B" call UrlHandler
    if /i "%FormatListCode%"=="" goto ReturnFLC

    ::Add Url to History 
       if "%HstEnb%"=="T" echo %Url%>> ..\History.txt

    ..\exe\youtube-dl -f %FormatListCode%+bestaudio %DlOpt% %Url%
    if "%DestOpen%"=="T" explorer %Destination% 

    echo.
    pause
    call MainMenu
