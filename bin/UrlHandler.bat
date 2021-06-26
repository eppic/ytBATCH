@echo off
title Enter Action - ytBATCH %version%
%mcls%

::Cookie/Playlist Settings
    if "%AutoCookies%"=="T" (set CookieSet=--cookies "..\cookies.txt") else (set CookieSet=)
    set PlaylistSet=--no-playlist
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

    if "%PlaylistSet%"=="--yes-playlist" echo   (P) Playlist (TRUE)
    if "%PlaylistSet%"=="--no-playlist" echo   (P) Playlist (FALSE)
    if "%CookieSet%"=="--cookies "..\cookies.txt"" echo   (C) Cookies (TRUE)
    if not "%CookieSet%"=="--cookies "..\cookies.txt"" echo   (C) Cookies (FALSE)

    echo.
    echo (B) Go Back...
    echo.

    set /p UrlCode=COMMAND:
    
    ::Set Download Options
       set DlOpt=-o "%Destination%%FileNaming%" %CookieSet% %PlaylistSet% --add-metadata --config-location ..\custom.conf 

    if /i "%UrlCode%"=="A" call AudioDL.bat
    if /i "%UrlCode%"=="V" call VideoDL.bat
    if /i "%UrlCode%"=="F" call ListDL.bat
    if /i "%UrlCode%"=="C" goto CookieSetHandler
    if /i "%UrlCode%"=="P" goto PlSetHandler
    if /i "%UrlCode%"=="B" call MainMenu.bat

    call UrlHandler.bat

::Playlist Handler
    :PlSetHandler
    if "%PlaylistSet%"=="--yes-playlist" set PlaylistSet=--no-playlist&goto UrlHPassed
    set PlaylistSet=--yes-playlist
    goto UrlHPassed
    
::Cookie Handler
    :CookieSetHandler
    if not exist ..\cookies.txt goto NoCookies
    if "%CookieSet%"=="--cookies "..\cookies.txt"" set CookieSet=&goto UrlHPassed
    set CookieSet=--cookies "..\cookies.txt"
    goto UrlHPassed
    
    :NoCookies
    %mcls%
    echo cookies.txt not found.
    echo Download the extension "cookies.txt" for your Browser and export your cookies into the root of ytBATCH.
    pause
    call UrlHandler.bat
