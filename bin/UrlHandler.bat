@echo off
title Enter Action - ytBATCH %version%
%mcls%

::Cookie/Playlist Settings
    if "%AutoCookies%"=="T" (set CookieSet=--cookies "..\cfg\cookies.txt") else (set CookieSet=)
    set PlaylistSet=--no-playlist
    if exist ..\QueueList.bat (set QueueSet=T) else (set QueueSet=F)
    :UrlHPassed
    %mcls%

::Url Handler
    set DlOpt=
    set UrlCode=
    echo URL/FILE:"%Url%"
    echo.
    echo   (A) Audio
    echo   (V) Video
    echo   (F) List All Formats...
    echo.
    if "%QueueSet%"=="T" echo   (Q) Add to Queue... (TRUE)
    if not "%QueueSet%"=="T" echo   (Q) Add to Queue... (FALSE)
    echo.
    if "%PlaylistSet%"=="--yes-playlist" echo   (P) Playlist (TRUE)
    if "%PlaylistSet%"=="--no-playlist" echo   (P) Playlist (FALSE)
    if "%CookieSet%"=="--cookies "..\cfg\cookies.txt"" echo   (C) Cookies (TRUE)
    if not "%CookieSet%"=="--cookies "..\cfg\cookies.txt"" echo   (C) Cookies (FALSE)
    echo.
    echo (B) Go Back...
    echo.

    set /p UrlCode=COMMAND:
    
    ::Set Download Options
       set DlOpt=-o "%Destination%%FileNaming%" %CookieSet% %PlaylistSet% -i --add-metadata --config-location ..\cfg\custom.conf 

    if /i "%UrlCode%"=="A" call AudioDL.bat
    if /i "%UrlCode%"=="V" call VideoDL.bat
    if /i "%UrlCode%"=="F" call ListDL.bat
    if /i "%UrlCode%"=="C" goto CookieSetHandler
    if /i "%UrlCode%"=="P" goto PlSetHandler
    if /i "%UrlCode%"=="B" call MainMenu.bat
    if /i "%UrlCode%"=="Q" goto QueueSetHandler

    call UrlHandler.bat

::Playlist Handler
    :PlSetHandler
    if "%PlaylistSet%"=="--yes-playlist" set PlaylistSet=--no-playlist&goto UrlHPassed
    set PlaylistSet=--yes-playlist
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
    call UrlHandler.bat

::Queue Handler
    :QueueSetHandler
    if "%QueueSet%"=="T" set QueueSet=F&goto UrlHPassed
    set QueueSet=T
    goto UrlHPassed