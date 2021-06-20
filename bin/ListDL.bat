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
    set /P FormatListCode=Code:
    if /i "%FormatListCode%"=="B" goto M_Link
    ..\exe\youtube-dl -f %FormatListCode% -o "%Destination%%FileNaming%" %CookieSet% --add-metadata --config-location ..\custom.conf %Url%
    if "%DestOpen%"=="T" explorer %Destination% 
    echo.
    echo Saved "%Url%" under "%Destination%".
    echo.
    pause
    call MainMenu
