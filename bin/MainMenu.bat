@echo off
title Enter URL - ytBATCH %version%
%mcls%

::Main Menu
    set Url=

    ::echo (Q) Queue Download...
    echo (P) Preferences...
    echo (U) Check for Updates...
    if exist "..\QueueList.bat" echo.
    if exist "..\QueueList.bat" echo (Q) Start Queue...
    if exist "..\QueueList.bat" echo (E) Empty Queue...
    
    echo.

    set /p Url=URL/COMMAND:

    if /i "%Url%"=="P" call Preferences.bat
    if /i "%Url%"=="U" call Updater.bat
    if /i "%Url%"=="Q" start Queue.bat & call MainMenu.bat
    if /i "%Url%"=="E" del ..\QueueList.bat & call MainMenu.bat
    if /i "%Url%"=="H" call Help.bat
    if /i "%Url%"=="NEW" goto Refresh
    if /i "%Url%"=="NNEW" call Launcher.bat
    if /i "%Url%"=="C" %mcls% & title cmd & cd ..\exe & cmd.exe & cd ..\bin & call MainMenu.bat 
    if /i "%Url%"=="X" exit
    if /i "%Url%"=="echo" set mecho=1 & call Launcher.bat
    if /i "%Url%"=="B" call MainMenu.bat
    if /i "%Url%"=="" call MainMenu.bat

::Open Url Handler
    call UrlHandler.bat

::NEW Command
    :Refresh
    set mecho=
    start Launcher.bat
    exit