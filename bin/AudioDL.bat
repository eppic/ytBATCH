@echo off
title Download Audio - ytBATCH %version%
cls

::Set File Format
    set AudioDLCode=
    echo Audio
    echo - - - - -
    echo (S) Source (Best/No Formatting)
    echo (W) .WAV
    echo (3) .MP3
    echo (4) .M4A
    echo (F) .FLAC
    echo - - - - -
    echo (B) Go Back...
    echo - - - - -

    set /p AudioDLCode=COMMAND:
    
    if /I "%AudioDLCode%"=="S" set AudioDLFormat=best & goto AudioDLCheck
    if /I "%AudioDLCode%"=="W" set AudioDLFormat=wav & goto AudioDLCheck
    if /I "%AudioDLCode%"=="3" set AudioDLFormat=mp3 & goto AudioDLCheck
    if /I "%AudioDLCode%"=="4" set AudioDLFormat=m4a & goto AudioDLCheck
    if /I "%AudioDLCode%"=="F" set AudioDLFormat=flac & goto AudioDLCheck
    if /I "%AudioDLCode%"=="B" call UrlHandler
    call AudioDL.bat
    :AudioDLCheck

::Download Audio
    cls
    echo Audio
    youtube-dl -x --audio-format %AudioDLFormat% -o "%Destination%%FileNaming%" %CookieSet% --add-metadata --embed-thumbnail %Url%
    if "%DestOpen%"=="T" explorer %Destination% 
    echo - - - - -
    echo Saved "%Url%" under "%Destination%".
    echo - - - - -
    pause
    call MainMenu

    ::youtube-dl -f bestaudio -x --audio-format mp3 --add-metadata --embed-thumbnail -o "%Destination%%FileNaming%" %Url% %CookieSet%