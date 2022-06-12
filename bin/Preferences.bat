@echo off
title Preferences - ytBATCH %version%
%mcls%

::Preferences Menu
    set PrefCode=
    
    echo ytBATCH:
    if "%AUEnb%"=="T" echo   (A) Check for Updates on Startup... (TRUE)
    if /i not "%AUEnb%"=="T" echo   (A) Check for Updates on Startup... (FALSE)

    echo   (Y) Change yt-dl version (CURRENT: %ytdlv%)

    if "%CleanQueueStart%"=="T" echo   (Q) Clean Queue when restarting... (TRUE)
    if /i not "%CleanQueueStart%"=="T" echo   (Q) Clean Queue when restarting... (FALSE)

    if "%HstEnb%"=="T" echo   (H) Keep Download History... (TRUE)
    if /i not "%HstEnb%"=="T" echo   (H) Keep Download History... (FALSE)
    
    echo   (S) Generate ytBATCH shortcuts...

    echo.
    echo Download:
    echo   (F) Set Default Audio and Video Formats...
    echo   (P) Change Output Path...

    if "%DestOpen%"=="T" echo   (O) Open Containing Folder after Download... (TRUE)
    if /i not "%DestOpen%"=="T" echo   (O) Open Containing Folder after Download... (FALSE)

    if "%AutoCookies%"=="T" echo   (K) Use Cookies by default... (TRUE)
    if /i not "%AutoCookies%"=="T" echo   (K) Use Cookies by default... (FALSE)

    if "%EmbThb%"=="T" echo   (T) Download Video Thumbnail for Audio... (TRUE)
    if /i not "%EmbThb%"=="T" echo   (T) Download Video Thumbnail for Audio... (FALSE)

    echo.
    echo Open:
    echo   (C) Open ytBATCH Config...
    echo   (V) Open %ytdlv% Config...
    echo   (J) Open Download History...
    echo   (R) Open Root Directory...
    echo   (X) Open Download Directory...
	echo   (G) Open GitHub Repository...
    echo.
    echo (B) Go Back...
    echo.

    choice /c LPFKOQHTYARXCVJBGS /n
    set PrefCode=%errorlevel%
    
    if /i "%PrefCode%"=="1" set fdcode= & call FileDownloader.bat
    if /i "%PrefCode%"=="2" goto OutputPath
    if /i "%PrefCode%"=="3" goto DefaultFormatSet
    if /i "%PrefCode%"=="4" goto AutoCookieSet
    if /i "%PrefCode%"=="5" goto DestOpenSet
    if /i "%PrefCode%"=="6" goto CleanQueueStartSet
    if /i "%PrefCode%"=="7" goto HistorySet
    if /i "%PrefCode%"=="8" goto EmbThbSet
    if /i "%PrefCode%"=="9" goto YtdlvSet
    if /i "%PrefCode%"=="10" goto AUSet
    if /i "%PrefCode%"=="11" explorer ..\
    if /i "%PrefCode%"=="12" explorer %Destination%
    if /i "%PrefCode%"=="13" start notepad ..\cfg\UserConfig.bat
    if /i "%PrefCode%"=="14" goto YtdlConfigSet
    if /i "%PrefCode%"=="15" start notepad ..\History.txt
    if /i "%PrefCode%"=="16" call MainMenu.bat
	if /i "%PrefCode%"=="17" start "" "https://github.com/eppic/ytBATCH"
	if /i "%PrefCode%"=="18" goto ShortcutGen
    
    call Preferences.bat

::Change Output Path
    :OutputPath
    set DestinationCode=
    %mcls%
    echo Type in your desired output path (For Example: "C:\Your\Own\Path")
    echo Current: "%Destination%"
    echo.
    echo   (D) Default (Downloads\ytBATCH\.) 
    echo   (R) Root (ytBATCH\dl\.)
    echo.
    echo (B) Go Back...
    echo.    
    
    set /p DestinationCode=CODE/PATH:

    if /i "%DestinationCode%"=="" goto OutputPath
    if /i "%DestinationCode%"=="B" call Preferences.bat & goto ConfigSet
    if /i "%DestinationCode%"=="D" set Destination=%userprofile%\Downloads\ytBATCH& goto ConfigSet
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

    :ShortcutGen
    if exist ..\cfg\installation.info (goto ShortcutGen1) else (goto ShortcutGen2)
       :ShortcutGen1
       powershell.exe "powershell -ExecutionPolicy Bypass -File makeshortcut.ps1"
       call Preferences.bat
       :ShortcutGen2
       %mcls%
       echo ytBATCH needs to be installed in order to generate shortcuts
       pause
       call Preferences.bat

    :EmbThbSet
    if /i "%EmbThb%"=="T" (set EmbThb=F) else (set EmbThb=T)
    goto ConfigSet
    
    :CleanQueueStartSet
    if /i "%CleanQueueStart%"=="T" (set CleanQueueStart=F) else (set CleanQueueStart=T)
    goto ConfigSet

    :YtdlvSet
    if exist ..\exe\youtube-dl.exe goto YtdlvSetPass
    %mcls%
    set ytdlvsetcode=
    echo youtube-dl.exe is currently not downloaded.
    echo Download youtube-dl.exe now?
    echo.
    echo  (Y) Yes...
    echo  (N) No...
    echo.

    choice /c YN /n
    set ytdlvsetcode=%errorlevel%

    if /i "%ytdlvsetcode%"=="1" set fdcode=ytdl& call FileDownloader.bat
    if /i "%ytdlvsetcode%"=="2" call Preferences.bat
    goto YtdlvSet

       :YtdlvSetPass
       if /i "%ytdlv%"=="youtube-dl" (set ytdlv=yt-dlp) else (set ytdlv=youtube-dl)
       goto ConfigSet

    :AUSet
    if /i "%AUEnb%"=="T" (set AUEnb=F) else (set AUEnb=T)
    goto ConfigSet

::Default Formats
    :DefaultFormatSet
    %mcls%
    set dfscode=
    echo Set Default Format for Audio or Video?
    echo.
    echo   (A) Audio (CURRENT: %DefaultAudio%)
    echo   (V) Video (CURRENT: %DefaultVideo%)
    echo.
    echo (B) Go Back...
    echo.

    choice /c BAV /n
    set dfscode=%errorlevel%

    if /i "%dfscode%"=="1" call Preferences.bat
    if /i "%dfscode%"=="2" goto dfsAudio
    if /i "%dfscode%"=="3" goto dfsVideo
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

    choice /c BNSW34F /n
    set dfsAcode=%errorlevel%

    if /i "%dfsAcode%"=="1" goto DefaultFormatSet
    if /i "%dfsAcode%"=="2" set DefaultAudio=none& goto ConfigSet
    if /i "%dfsAcode%"=="3" set DefaultAudio=best& goto ConfigSet
    if /i "%dfsAcode%"=="4" set DefaultAudio=wav& goto ConfigSet
    if /i "%dfsAcode%"=="5" set DefaultAudio=mp3& goto ConfigSet
    if /i "%dfsAcode%"=="6" set DefaultAudio=m4a& goto ConfigSet
    if /i "%dfsAcode%"=="7" set DefaultAudio=flac& goto ConfigSet
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

    choice /c BNS4VG /n
    set dfsVcode=%errorlevel%

    if /i "%dfsVcode%"=="1" goto DefaultFormatSet
    if /i "%dfsVcode%"=="2" set DefaultVideo=none& goto ConfigSet
    if /i "%dfsVcode%"=="3" set DefaultVideo=source& goto ConfigSet
    if /i "%dfsVcode%"=="4" set DefaultVideo=mp4& goto ConfigSet
    if /i "%dfsVcode%"=="5" set DefaultVideo=mkv& goto ConfigSet
    if /i "%dfsVcode%"=="6" set DefaultVideo=ogg& goto ConfigSet
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
    echo set ytdlv=%ytdlv%>> ..\cfg\UserConfig.bat
    echo set EmbThb=%EmbThb%>> ..\cfg\UserConfig.bat
    echo set AUEnb=%AUEnb%>> ..\cfg\UserConfig.bat

    call ..\cfg\UserConfig.bat
    call Preferences.bat

::youtube-dl config
    :YtdlConfigSet
    if exist "..\cfg\youtube-dl.conf" start notepad "..\cfg\youtube-dl.conf" 
    if not exist "..\cfg\youtube-dl.conf" copy nul "..\cfg\youtube-dl.conf" & start notepad "..\cfg\youtube-dl.conf"
    call Preferences.bat
    
