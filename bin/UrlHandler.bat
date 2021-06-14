@echo off
title Enter Action - ytBATCH %version%
%mcls%

::Cookie Settings
    if "%AutoCookies%"=="T" (set CookieSet=--cookies "..\cookies.txt") else (set CookieSet=)
    :CookiesPassed
    %mcls%

::Url Handler
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
    ::echo (K) Convert File...
    ::echo.
    echo (B) Go Back...
    echo.

    set /p UrlCode=COMMAND:

    if /I "%UrlCode%"=="A" call AudioDL.bat
    if /I "%UrlCode%"=="V" call VideoDL.bat
    if /I "%UrlCode%"=="F" call ListDL.bat
    if /I "%UrlCode%"=="C" goto CookieSetHandler
    if /I "%UrlCode%"=="K" call Converter.bat
    if /I "%UrlCode%"=="B" call MainMenu.bat

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
