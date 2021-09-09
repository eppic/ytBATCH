@echo off
title Download Audio - ytBATCH %version%
%mcls%

::Set File Format
    set AudioDLCode=
    
    if /i "%DefaultAudio%"=="none" goto ADLDefFPassed
    if "%FormatSet%"=="T" goto ADLDefFPassed
    set AudioDLFormat=%DefaultAudio%& goto AudioDLCheck

    :ADLDefFPassed
    echo Select Audio Format:
    echo.
    echo   (S) Source (Best/No Formatting)
    echo   (W) .WAV
    echo   (M) .MP3
    echo   (4) .M4A
    echo   (F) .FLAC
    echo.
    echo (B) Go Back...
    echo.

    set /p AudioDLCode=COMMAND:
    
    if /i "%AudioDLCode%"=="S" set AudioDLFormat=best& goto AudioDLCheck
    if /i "%AudioDLCode%"=="W" set AudioDLFormat=wav& goto AudioDLCheck
    if /i "%AudioDLCode%"=="3" set AudioDLFormat=mp3& goto AudioDLCheck
    if /i "%AudioDLCode%"=="M" set AudioDLFormat=mp3& goto AudioDLCheck
    if /i "%AudioDLCode%"=="4" set AudioDLFormat=m4a& goto AudioDLCheck
    if /i "%AudioDLCode%"=="F" set AudioDLFormat=flac& goto AudioDLCheck
    if /i "%AudioDLCode%"=="B" call UrlHandler
    call AudioDL.bat
    :AudioDLCheck

::Add Url to History 
    if /i "%HstEnb%"=="T" echo %Url%>> ..\History.txt

::Embed Thumbnail Check
    if /i "%EmbThb%"=="T" set EmbThbPref=--embed-thumbnail


::Add to Queue
    if /i "%QueueSet%"=="T" echo ..\exe\%ytdlv% -x --audio-format %AudioDLFormat% %%DlOpt%% %EmbThbPref% %Url% >> ..\QueueList.bat & call MainMenu.bat

::Download Audio
    %mcls%
    echo Audio

    ..\exe\%ytdlv% -x --audio-format %AudioDLFormat% %DlOpt% %EmbThbPref% %Url% 
    if /i "%DestOpen%"=="T" explorer %Destination% 

    echo.
    pause
    call MainMenu.bat