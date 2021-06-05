@echo off
title Enter URL - ytBATCH %version%
cls

::Main Menu
    set Url=

    echo (Q) Queue Download...
    echo (P) Preferences...
    echo (U) Check for Updates...
    echo - - - - -

    set /p Url=URL/FILE/COMMAND:

    if /I "%Url%"=="Q" call Queue.bat
    if /I "%Url%"=="P" call Preferences.bat
    if /I "%Url%"=="U" call Updater.bat
    if /I "%Url%"=="H" call Help.bat
    if /I "%Url%"=="M" call ManualMode.bat
    if /I "%Url%"=="NEW" goto Refresh
    if /I "%Url%"=="NNEW" call Launcher.bat
    if /I "%Url%"=="X" exit
    if /I "%Url%"=="MATRIX" call Reset.bat
    if /I "%Url%"=="" call MainMenu.bat

::Open Url Handler
    call UrlHandler.bat

::NEW Command
    :Refresh
    start New.bat
    exit