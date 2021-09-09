@echo off
title Download Video - ytBATCH %version%
%mcls%

::Set File Format
    set mopf=--merge-output-format 
    set VideoDLCode=

    if /i "%DefaultVideo%"=="source" goto VideoDLCheckSource
    
    if /i "%DefaultVideo%"=="none" goto VDLDefFPassed
    if "%FormatSet%"=="T" goto VDLDefFPassed
    set VideoDLFormat=%DefaultVideo%& goto VideoDLCheck

    :VDLDefFPassed
    echo Select Video Format:
    echo.
    echo   (S) Source
    echo   (M) .MP4
    echo   (V) .MKV
    echo.
    echo (B) Go Back...
    echo.

    set /p VideoDLCode=COMMAND:
    
    if /i "%VideoDLCode%"=="S" goto VideoDLCheckSource
    if /i "%VideoDLCode%"=="4" set VideoDLFormat=mp4 & goto VideoDLCheck
    if /i "%VideoDLCode%"=="M" set VideoDLFormat=mp4 & goto VideoDLCheck
    if /i "%VideoDLCode%"=="V" set VideoDLFormat=mkv & goto VideoDLCheck
    if /i "%VideoDLCode%"=="G" set VideoDLFormat=ogg & goto VideoDLCheck
    if /i "%VideoDLCode%"=="B" call UrlHandler
    call VideoDL.bat
    
    :VideoDLCheckSource
    set mopf=
    set VideoDLFormat=

    :VideoDLCheck
    
::Add Url to History 
    if /i "%HstEnb%"=="T" echo %Url%>> ..\History.txt

::Add to Queue
    if /i "%QueueSet%"=="T" echo ..\exe\%ytdlv% %mopf%%VideoDLFormat% %%DlOpt%% %Url% >> ..\QueueList.bat & call MainMenu.bat

::Download Video
    %mcls%
    echo Video

    ..\exe\%ytdlv% %mopf%%VideoDLFormat% %DlOpt% %Url%
    if /i "%DestOpen%"=="T" explorer %Destination%

    echo.
    pause
    call MainMenu.bat