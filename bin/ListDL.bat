@echo off
title Choose Format - ytBATCH %version%
if /I "%mtx%"=="" cls

::Download Audio
    set FormatListCode=
    echo Checking available formats...
    echo - - - - -
    youtube-dl -F %Url%
    echo - - - - -
    echo (B) Go Back...
    echo - - - - -
    set /P FormatListCode=Code:
    if /I "%FormatListCode%"=="B" goto M_Link
    youtube-dl -f %FormatListCode% -o "%Destination%%FileNaming%" %CookieSet% --add-metadata %Url%
    if "%DestOpen%"=="T" explorer %Destination% 
    echo - - - - -
    echo Saved "%Url%" under "%Destination%".
    echo - - - - -
    pause
    call MainMenu
