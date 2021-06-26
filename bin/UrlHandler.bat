@echo off
title Enter Action - ytBATCH %version%
%mcls%

::Cookie Settings
    if "%AutoCookies%"=="T" (set CookieSet=--cookies "..\cookies.txt") else (set CookieSet=)
    :CookiesPassed
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
    if "%CookieSet%"=="--cookies "..\cookies.txt"" echo   (C) Cookies activated!
    if not "%CookieSet%"=="--cookies "..\cookies.txt"" echo   (C) Use Cookies...
    echo.
    echo (B) Go Back...
    echo.

    set /p UrlCode=COMMAND:
    
    ::Set Download Options
       set DlOpt=-o "%Destination%%FileNaming%" %CookieSet% --add-metadata --config-location ..\custom.conf 

    if /i "%UrlCode%"=="A" call AudioDL.bat
    if /i "%UrlCode%"=="V" call VideoDL.bat
    if /i "%UrlCode%"=="F" call ListDL.bat
    if /i "%UrlCode%"=="C" goto CookieSetHandler
    if /i "%UrlCode%"=="B" call MainMenu.bat

    call UrlHandler.bat

::Cookie Handler
    :CookieSetHandler
    if not exist ..\cookies.txt goto NoCookies
    set CookieSet=--cookies "..\cookies.txt"
    goto CookiesPassed
    
    :NoCookies
    %mcls%
    echo cookies.txt not found.
    echo Download the extension "cookies.txt" for your Browser and export your cookies into the root of ytBATCH.
    pause
    call UrlHandler.bat
