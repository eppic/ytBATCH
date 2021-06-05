@echo off
title Preferences - ytBATCH %version%
if /I "%mtx%"=="" cls

::Preferences
    set PrefCode=

    echo General:
    echo (P) Change Output Path...
    if "%AutoCookies%"=="T" echo (K) Use Cookies by default... (TRUE)
    if not "%AutoCookies%"=="T" echo (K) Use Cookies by default... (FALSE)
    if "%DestOpen%"=="T" echo (O) Open Containing Folder after Download... (TRUE)
    if not "%DestOpen%"=="T" echo (O) Open Containing Folder after Download... (FALSE)
    echo (D) Download Files...
    echo (R) Reset ytBATCH...
    echo Open:
    echo (L) Open Changelog...
    echo (C) Open Config File...
    echo (Y) Open Root Folder...
    echo (X) Open Download Folder...
    echo - - - - -
    echo (B) Go Back...

    set /p PrefCode=COMMAND:

    if /i "%PrefCode%"=="L" notepad Changelog.txt
    if /i "%PrefCode%"=="P" goto OutputPath
    if /i "%PrefCode%"=="K" goto AutoCookiesSet
    if /i "%PrefCode%"=="O" goto DestOpenSet
    if /i "%PrefCode%"=="D" call FileDownloader.bat
    if /i "%PrefCode%"=="R" call Reset.bat
    if /i "%PrefCode%"=="Y" explorer %~dp0
    if /i "%PrefCode%"=="X" explorer %Destination%
    if /i "%PrefCode%"=="C" notepad UserConfig.bat
    if /i "%PrefCode%"=="B" call MainMenu.bat
    if /i "%PrefCode%"=="" call Preferences.bat

    call Preferences.bat

::Change Output Path
    :OutputPath
    if /I "%mtx%"=="" cls
    echo Type in your desired output path: (Type "D" for Default / Type "B" to go back)
    set /p Destination=Path:

    if /I "%Destination%"=="B" call Preferences.bat
    if /I "%Destination%"=="D" set Destination=%userprofile%\Downloads\ytBATCH
    goto ConfigSet

::True/False Preferences
    :AutoCookiesSet
    if /I "%AutoCookies%"=="F" (set AutoCookies=T) else (set AutoCookies=F)
    call Preferences.bat

    :DestOpenSet
    if /I "%DestOpen%"=="F" (set DestOpen=T) else (set DestOpen=F)
    call Preferences.bat

::Apply Config to UserConfig.bat
    :ConfigSet
    if not exist UserConfig.bat copy nul "UserConfig.bat"

    echo set Destination=%Destination%> UserConfig.bat
    echo set DestOpen=%DestOpen%>> UserConfig.bat
    echo set AutoCookies=%AutoCookies%>> UserConfig.bat
    call UserConfig.bat
    call Preferences.bat

