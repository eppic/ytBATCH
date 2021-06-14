@echo off
title Download Video - ytBATCH %version%
%mcls%

::Set File Format
    set mopf=--merge-output-format 
    set VideoDLCode=

    if /i "%DefaultVideo%"=="source" goto VideoDLCheckSource
    if /i not "%DefaultVideo%"=="none" set VideoDLFormat=%DefaultVideo% & goto VideoDLCheck

    echo Video
    echo - - - - -
    echo (S) Source
    echo (4) .MP4
    echo (V) .MKV
    echo - - - - -
    echo (B) Go Back...
    echo - - - - -

    set /p VideoDLCode=COMMAND:
    
    if /I "%VideoDLCode%"=="S" goto VideoDLCheckSource
    if /I "%VideoDLCode%"=="4" set VideoDLFormat=mp4 & goto VideoDLCheck
    if /I "%VideoDLCode%"=="V" set VideoDLFormat=mkv & goto VideoDLCheck
    if /I "%VideoDLCode%"=="G" set VideoDLFormat=ogg & goto VideoDLCheck
    if /I "%VideoDLCode%"=="B" call UrlHandler
    call VideoDL.bat
    
    :VideoDLCheckSource
    set mopf=
    set VideoDLFormat=

    :VideoDLCheck

::Download Video
    %mcls%
    echo Video
    ..\exe\youtube-dl %mopf%%VideoDLFormat% -o "%Destination%%FileNaming%" %CookieSet% --add-metadata %Url%
    if "%DestOpen%"=="T" explorer %Destination%

    echo - - - - -
    echo Saved "%Url%" under "%Destination%".
    echo - - - - -
    pause
    call MainMenu
    
    ::-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4
