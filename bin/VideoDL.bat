@echo off
title Download Video - ytBATCH %version%
%mcls%

::Set File Format
    set mopf=--merge-output-format 
    set VideoDLCode=

    if /i "%DefaultVideo%"=="source" goto VideoDLCheckSource
    if /i not "%DefaultVideo%"=="none" set VideoDLFormat=%DefaultVideo% & goto VideoDLCheck

    echo   (S) Source
    echo   (4) .MP4
    echo   (V) .MKV
    echo.
    echo (B) Go Back...
    echo.

    set /p VideoDLCode=COMMAND:
    
    if /i "%VideoDLCode%"=="S" goto VideoDLCheckSource
    if /i "%VideoDLCode%"=="4" set VideoDLFormat=mp4 & goto VideoDLCheck
    if /i "%VideoDLCode%"=="V" set VideoDLFormat=mkv & goto VideoDLCheck
    if /i "%VideoDLCode%"=="G" set VideoDLFormat=ogg & goto VideoDLCheck
    if /i "%VideoDLCode%"=="B" call UrlHandler
    call VideoDL.bat
    
    :VideoDLCheckSource
    set mopf=
    set VideoDLFormat=

    :VideoDLCheck
    
::Add Url to History 
    if "%HstEnb%"=="T" echo %Url%>> ..\History.txt

::Add to Queue
    if "%QueueSet%"=="T" echo ..\exe\youtube-dl %mopf%%VideoDLFormat% %%DlOpt%% %Url% >> ..\QueueList.bat & call MainMenu.bat

::Download Video
    %mcls%
    echo Video

    ..\exe\youtube-dl %mopf%%VideoDLFormat% %DlOpt% %Url%
    if "%DestOpen%"=="T" explorer %Destination%

    echo.
    pause
    call MainMenu.bat