@echo off
title Enter Action - ytBATCH %version%
%mcls%

::Cookie/Playlist/Format Settings
    if "%AutoCookies%"=="T" (set CookieSet=--cookies "..\cfg\cookies.txt") else (set CookieSet=)
    set PlaylistSet=--no-playlist
    set SubSet=--no-write-subs
    set FormatSet=F
    set COpt=
    if exist ..\QueueList.bat (set QueueSet=T) else (set QueueSet=F)
    :UrlHPassed
    %mcls%

::Url Handler
    set DlOpt=
    set UrlCode=
    echo Link:"%Url%"
    echo.

    if not "%COpt%"==""  echo   CUSTOM OPTIONS: %COpt% & echo.

    if /i not "%DefaultAudio%"=="none" echo   (A) Audio (%DefaultAudio%) 
    if /i "%DefaultAudio%"=="none" echo   (A) Audio
    if /i not "%DefaultVideo%"=="none" echo   (V) Video (%DefaultVideo%) 
    if /i "%DefaultVideo%"=="none" echo   (V) Video
    echo   (L) List All...
    echo.
    if "%FormatSet%"=="T" echo   (F) Change Format... (TRUE) 
    if not "%FormatSet%"=="T" echo   (F) Change Format... (FALSE)
    echo.
    if "%QueueSet%"=="T" echo   (Q) Add to Queue... (TRUE)
    if not "%QueueSet%"=="T" echo   (Q) Add to Queue... (FALSE)
    echo.
    if "%PlaylistSet%"=="--yes-playlist" echo   (P) Playlist (TRUE)
    if "%PlaylistSet%"=="--no-playlist" echo   (P) Playlist (FALSE)
    if "%SubSet%"=="--write-subs" echo   (S) Subtitles (TRUE) (Only downloads 1 Language / Default:"en")
    if "%SubSet%"=="--no-write-subs" echo   (S) Subtitles (FALSE)
    if "%CookieSet%"=="--cookies "..\cfg\cookies.txt"" echo   (C) Cookies (TRUE)
    if not "%CookieSet%"=="--cookies "..\cfg\cookies.txt"" echo   (C) Cookies (FALSE)
    echo   (O) Add Custom Options... 
    echo.
    echo (B) Go Back...
    echo.

    choice /c BAVLFCPQSO /n
    set UrlCode=%errorlevel%
    
    ::Set Download Options
       set DlOpt=-o "%Destination%%FileNaming%" -i --add-metadata --config-location ..\cfg\youtube-dl.conf 

    if /i "%UrlCode%"=="1" call MainMenu.bat
    if /i "%UrlCode%"=="2" call AudioDL.bat
    if /i "%UrlCode%"=="3" call VideoDL.bat
    if /i "%UrlCode%"=="4" call ListDL.bat
    if /i "%UrlCode%"=="5" goto FormatSetHandler
    if /i "%UrlCode%"=="6" goto CookieSetHandler
    if /i "%UrlCode%"=="7" goto PlSetHandler
    if /i "%UrlCode%"=="8" goto QueueSetHandler
    if /i "%UrlCode%"=="9" goto SubSetHandler
    if /i "%UrlCode%"=="10" goto CustomOptHandler

    goto UrlHPassed

::Format Handler
    :FormatSetHandler
    if /i "%FormatSet%"=="T" set FormatSet=F&goto UrlHPassed
    set FormatSet=T
    goto UrlHPassed

::Playlist Handler
    :PlSetHandler
    if /i "%PlaylistSet%"=="--yes-playlist" set PlaylistSet=--no-playlist&goto UrlHPassed
    set PlaylistSet=--yes-playlist
    goto UrlHPassed

::Subtitle Handler
    :SubSetHandler
    if /i "%SubSet%"=="--write-subs" set SubSet=--no-write-subs&goto UrlHPassed 
    set SubSet=--write-subs
    goto UrlHPassed
    
::Cookie Handler
    :CookieSetHandler
    if not exist ..\cfg\cookies.txt goto NoCookies
    if "%CookieSet%"=="--cookies "..\cfg\cookies.txt"" set CookieSet=&goto UrlHPassed
    set CookieSet=--cookies "..\cfg\cookies.txt"
    goto UrlHPassed
    
    :NoCookies
    %mcls%
    echo cookies.txt not found.
    echo Download the extension "cookies.txt" for your Browser and export your cookies into "ytBATCH\cfg".
    pause
    explorer ..\cfg
    goto UrlHPassed

::Queue Handler
    :QueueSetHandler
    if /i "%QueueSet%"=="T" set QueueSet=F&goto UrlHPassed
    set QueueSet=T
    goto UrlHPassed

::Custom Options Handler
    :CustomOptHandler
    %mcls%
    echo Add Custom Options:
    echo.
    echo Do NOT use:    
    echo   -x / -f / --audio-format / --merge-output-format
    echo   --no-playlist / --yes-playlist / --no-write-subs / --write-subs
    echo   --cookies / --no-cookies
    echo.
    echo   The Options above are editable with the Menu
    echo.
        set /p COpt=%ytdlv% (Link) 
    goto UrlHPassed