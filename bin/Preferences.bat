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

    if "%CleanQueueStart%"=="T" echo   (Q) Clean Queue when restarting... (TRUE)
    if /i not "%CleanQueueStart%"=="T" echo   (Q) Clean Queue when restarting... (FALSE)

    if "%HstEnb%"=="T" echo   (H) Keep Download History... (TRUE)
    if /i not "%HstEnb%"=="T" echo   (H) Keep Download History... (FALSE)

    echo.
    echo Open:
    echo   (C) Open ytBATCH Config...
    echo   (V) Open youtube-dl Config...
    echo   (Y) Open Root Directory...
    echo   (X) Open Download Directory...
	echo   (G) Open GitHub Repository...
    echo.
    echo (B) Go Back...
    echo.

    set /p PrefCode=COMMAND:

    if /i "%PrefCode%"=="L" notepad Changelog.txt
    if /i "%PrefCode%"=="P" goto OutputPath
    if /i "%PrefCode%"=="F" goto DefaultFormatSet
    if /i "%PrefCode%"=="K" goto AutoCookieSetp
    if /i "%PrefCode%"=="O" goto DestOpenSet
    if /i "%PrefCode%"=="Q" goto CleanQueueStartSet
    if /i "%PrefCode%"=="H" goto HistorySet
    if /i "%PrefCode%"=="Download" call FileDownloader.bat
    if /i "%PrefCode%"=="Y" explorer ..\
    if /i "%PrefCode%"=="X" explorer %Destination%
    if /i "%PrefCode%"=="C" notepad ..\cfg\UserConfig.bat
    if /i "%PrefCode%"=="V" goto YtdlConfigSet
    if /i "%PrefCode%"=="B" call MainMenu.bat
      
	if /i "%PrefCode%"=="G" start "" "https://github.com/eppic/ytBATCH"

    call Preferences.bat

::Change Output Path
    :OutputPath
    set DestinationCode=
    %mcls%
    echo Type in your desired output path (For Example: "C:\Your\Own\Path")
    echo.
    echo   (D) Default (Downloads\ytBATCH\.) 
    echo   (R) Root (ytBATCH\dl\.)
    echo.
    echo (B) Go Back...
    echo.    
    
    set /p DestinationCode=PATH:

    if /i "%DestinationCode%"=="B" call Preferences.bat & goto ConfigSet
    if /i "%DestinationCode%"=="D" set Destination=%userprofile%\Downloads\ytBATCH & goto ConfigSet
    if /i "%DestinationCode%"=="R" set Destination=..\dl\ & goto ConfigSet
    set Destination=%DestinationCode%
    goto ConfigSet

::True/False Preferences
    :AutoCookieSet
    if /i "%AutoCookies%"=="T" (set AutoCookies=F) else (set AutoCookies=T)
    goto ConfigSet

    :DestOpenSet
    if /i "%DestOpen%"=="T" (set DestOpen=F) else (set DestOpen=T)
    goto ConfigSet

    :HistorySet
    if /i "%HstEnb%"=="T" (set HstEnb=F) else (set HstEnb=T)
    goto ConfigSet

    :CleanQueueStartSet
    if /i "%CleanQueueStart%"=="T" (set CleanQueueStart=F) else (set CleanQueueStart=T)
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
    if /i "%dfsAcode%"=="n" set DefaultAudio=none& goto ConfigSet
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
    if /i "%dfsVcode%"=="n" set DefaultVideo=none& goto ConfigSet
    if /i "%dfsVcode%"=="s" set DefaultVideo=source & goto ConfigSet
    if /i "%dfsVcode%"=="4" set DefaultVideo=mp4 & goto ConfigSet
    if /i "%dfsVcode%"=="v" set DefaultVideo=mkv & goto ConfigSet
    if /i "%dfsVcode%"=="g" set DefaultVideo=ogg & goto ConfigSet
    if /i "%dfsVcode%"=="b" goto DefaultFormatSet
    goto dfsVideo

::Apply Config to UserConfig.bat
    :ConfigSet
    if not exist ..\cfg\UserConfig.bat copy nul ..\cfg\UserConfig.bat

    echo set Destination=%Destination%> ..\cfg\UserConfig.bat
    echo set DestOpen=%DestOpen%>> ..\cfg\UserConfig.bat
    echo set AutoCookies=%AutoCookies%>> ..\cfg\UserConfig.bat
    echo set DefaultAudio=%DefaultAudio%>> ..\cfg\UserConfig.bat
    echo set DefaultVideo=%DefaultVideo%>> ..\cfg\UserConfig.bat
    echo set HstEnb=%HstEnb%>> ..\cfg\UserConfig.bat
    echo set CleanQueueStart=%CleanQueueStart%>> ..\cfg\UserConfig.bat

    call ..\cfg\UserConfig.bat
    call Preferences.bat

::youtube-dl config
    :YtdlConfigSet
    if exist "..\cfg\custom.conf" notepad "..\cfg\custom.conf" 
    if not exist "..\cfg\custom.conf" copy nul "..\cfg\custom.conf" & notepad "..\cfg\custom.conf"
    call Preferences.bat
    