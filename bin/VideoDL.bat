@echo off
title Download Video - ytBATCH %version%
%mcls%

::Set File Format
    set mopf=--merge-output-format 
    set VideoDLCode=

    if /i "%FormatSet%"=="T" goto VDLDefFPassed
    if /i "%DefaultVideo%"=="source" goto VideoDLCheckSource
    if /i "%DefaultVideo%"=="none" goto VDLDefFPassed
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

    choice /c BS4MVG /n
    set VideoDLCode=%errorlevel%

    if /i "%VideoDLCode%"=="1" call UrlHandler
    if /i "%VideoDLCode%"=="2" goto VideoDLCheckSource
    if /i "%VideoDLCode%"=="3" set VideoDLFormat=mp4 & goto VideoDLCheck
    if /i "%VideoDLCode%"=="4" set VideoDLFormat=mp4 & goto VideoDLCheck
    if /i "%VideoDLCode%"=="5" set VideoDLFormat=mkv & goto VideoDLCheck
    if /i "%VideoDLCode%"=="6" set VideoDLFormat=ogg & goto VideoDLCheck
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