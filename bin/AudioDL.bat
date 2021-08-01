@echo off
title Download Audio - ytBATCH %version%
%mcls%

::Set File Format
    set AudioDLCode=

    if /i not "%DefaultAudio%"=="none" set AudioDLFormat=%DefaultAudio% & goto AudioDLCheck 

    echo   (S) Source (Best/No Formatting)
    echo   (W) .WAV
    echo   (3) .MP3
    echo   (4) .M4A
    echo   (F) .FLAC
    echo.
    echo (B) Go Back...
    echo.

    set /p AudioDLCode=COMMAND:
    
    if /i "%AudioDLCode%"=="S" set AudioDLFormat=best & goto AudioDLCheck
    if /i "%AudioDLCode%"=="W" set AudioDLFormat=wav & goto AudioDLCheck
    if /i "%AudioDLCode%"=="3" set AudioDLFormat=mp3 & goto AudioDLCheck
    if /i "%AudioDLCode%"=="4" set AudioDLFormat=m4a & goto AudioDLCheck
    if /i "%AudioDLCode%"=="F" set AudioDLFormat=flac & goto AudioDLCheck
    if /i "%AudioDLCode%"=="B" call UrlHandler
    call AudioDL.bat
    :AudioDLCheck

::Add Url to History 
    if "%HstEnb%"=="T" echo %Url%>> ..\History.txt

::Add to Queue
    if "%QueueSet%"=="T" echo ..\exe\youtube-dl -x --audio-format %AudioDLFormat% %%DlOpt%% --embed-thumbnail %Url% >> ..\QueueList.bat & call MainMenu.bat

::Download Audio
    %mcls%
    echo Audio

    ..\exe\youtube-dl -x --audio-format %AudioDLFormat% %DlOpt% --embed-thumbnail %Url% 
    if "%DestOpen%"=="T" explorer %Destination% 

    echo.
    pause
    call MainMenu.bat