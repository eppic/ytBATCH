@echo off
title Preferences - ytBATCH %version%
%mcls%

::Preferences Menu
    set PrefCode=
    
    echo General:
    echo   (P) Change Output Path...
    echo   (F) Set Default Audio and Video Formats...
    if "%AutoCookies%"=="T" echo   (K) Use Cookies by default... (TRUE)
    if /i not "%AutoCookies%"=="T" echo   (K) Use Cookies by default... (FALSE)
    if "%DestOpen%"=="T" echo   (O) Open Containing Folder after Download... (TRUE)
    if /i not "%DestOpen%"=="T" echo   (O) Open Containing Folder after Download... (FALSE)
    echo   (D) Download youtube-dl...
    echo   (R) Reset ytBATCH...
    echo.
    echo Open:
    echo   (L) Open Changelog...
    echo   (C) Open Config File...
    echo   (Y) Open Root Folder...
    echo   (X) Open Download Folder...
	echo   (G) Open GitHub Page...
    echo.
    echo (B) Go Back...
    echo.

    set /p PrefCode=COMMAND:

    if /i "%PrefCode%"=="L" notepad Changelog.txt
    if /i "%PrefCode%"=="P" goto OutputPath
    if /i "%PrefCode%"=="F" goto DefaultFormatSet
    if /i "%PrefCode%"=="K" goto AutoCookiesSet
    if /i "%PrefCode%"=="O" goto DestOpenSet
    if /i "%PrefCode%"=="D" call FileDownloader.bat
    if /i "%PrefCode%"=="R" call Reset.bat
    if /i "%PrefCode%"=="Y" explorer ..\
    if /i "%PrefCode%"=="X" explorer %Destination%
    if /i "%PrefCode%"=="C" notepad ..\UserConfig.bat
    if /i "%PrefCode%"=="B" call MainMenu.bat
      
	if /i "%PrefCode%"=="G" start "" "https://github.com/eppic/ytBATCH"

    call Preferences.bat

::Change Output Path
    :OutputPath
    %mcls%
    echo Type in your desired output path (For Example: "C:\Your\Own\Path")
    echo.
    echo   (D) Default (Downloads\ytBATCH\.) 
    echo   (R) Root (ytBATCH\dl\.)
    echo.
    echo (B) Go Back...
    echo.    
    
    set /p Destination=PATH:

    if /I "%Destination%"=="B" call Preferences.bat
    if /I "%Destination%"=="D" set Destination=%userprofile%\Downloads\ytBATCH
    if /I "%Destination%"=="R" set Destination=..\dl\
    goto ConfigSet

::True/False Preferences
    :AutoCookiesSet
    if /I "%AutoCookies%"=="T" (set AutoCookies=F) else (set AutoCookies=T)
    goto ConfigSet

    :DestOpenSet
    if /I "%DestOpen%"=="T" (set DestOpen=F) else (set DestOpen=T)
    goto ConfigSet

::Default Formats
    :DefaultFormatSet
    %mcls%
    set dfscode=
    echo Set Default Format for Audio or Video?
    echo.
    echo   (A) Audio (Current=%DefaultAudio%)
    echo   (V) Video (Current=%DefaultVideo%)
    echo.
    echo (B) Go Back...
    echo.
    set /p dfscode=COMMAND:
    if /i "%dfscode%"=="a" goto dfsAudio
    if /i "%dfscode%"=="v" goto dfsVideo
    if /i "%dfscode%"=="b" call Preferences.bat
    goto DefaultFormatSet

    :dfsAudio
    %mcls%
    set dfsAcode=
    echo Set Default Format for Audio:
    echo.
    echo   (N) None
    echo   (S) Source
    echo   (W) .WAV
    echo   (3) .MP3
    echo   (4) .M4A
    echo   (F) .FLAC
    echo.
    echo (B) Go Back...
    echo.
    set /p dfsAcode=COMMAND:
    if /i "%dfsAcode%"=="n" set DefaultAudio=none & goto ConfigSet
    if /i "%dfsAcode%"=="s" set DefaultAudio=best & goto ConfigSet
    if /i "%dfsAcode%"=="w" set DefaultAudio=wav & goto ConfigSet
    if /i "%dfsAcode%"=="3" set DefaultAudio=mp3 & goto ConfigSet
    if /i "%dfsAcode%"=="4" set DefaultAudio=m4a & goto ConfigSet
    if /i "%dfsAcode%"=="f" set DefaultAudio=flac & goto ConfigSet
    if /i "%dfsAcode%"=="b" goto DefaultFormatSet
    goto dfsAudio

    :dfsVideo
    %mcls%
    set dfsVcode=
    echo Set Default Format for Video:
    echo.
    echo   (N) None
    echo   (S) Source
    echo   (4) .MP4
    echo   (V) .MKV
    echo   (G) .OGG
    echo.
    echo (B) Go Back...
    echo.
    set /p dfsVcode=COMMAND:
    if /i "%dfsVcode%"=="n" set DefaultVideo=none & goto ConfigSet
    if /i "%dfsVcode%"=="s" set DefaultVideo=source & goto ConfigSet
    if /i "%dfsVcode%"=="4" set DefaultVideo=mp4 & goto ConfigSet
    if /i "%dfsVcode%"=="v" set DefaultVideo=mkv & goto ConfigSet
    if /i "%dfsVcode%"=="g" set DefaultVideo=ogg & goto ConfigSet
    if /i "%dfsVcode%"=="b" goto DefaultFormatSet
    goto dfsVideo

::Apply Config to UserConfig.bat
    :ConfigSet
    if not exist ..\UserConfig.bat copy nul ..\UserConfig.bat

    echo set Destination=%Destination%> ..\UserConfig.bat
    echo set DestOpen=%DestOpen%>> ..\UserConfig.bat
    echo set AutoCookies=%AutoCookies%>> ..\UserConfig.bat
    echo set DefaultAudio=%DefaultAudio%>> ..\UserConfig.bat
    echo set DefaultVideo=%DefaultVideo%>> ..\UserConfig.bat

    call ..\UserConfig.bat
    call Preferences.bat
