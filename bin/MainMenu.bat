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
    if /i "%DescScShow%"=="T" echo.
    if /i "%DescScShow%"=="T" echo (D) Open Download Directory...
    
    echo.

    set /p Url=URL/COMMAND:

    if /i "%Url%"=="P" call Preferences.bat
    if /i "%Url%"=="U" call Updater.bat
    if /i "%Url%"=="Q" start Queue.bat & call MainMenu.bat
    if /i "%Url%"=="E" del ..\QueueList.bat & call MainMenu.bat
    if /i "%Url%"=="H" title Help - ytBATCH %version% & cls & ..\exe\%ytdlv% --help & pause & call MainMenu.bat
    if /i "%Url%"=="D" explorer %Destination% & call MainMenu.bat
    if /i "%Url%"=="NEW" goto Refresh
    if /i "%Url%"=="NNEW" call Launcher.bat
    if /i "%Url%"=="C" %mcls% & title cmd & cd ..\exe & echo Type "EXIT" to return to the Main Menu... & cmd.exe & cd ..\bin & call MainMenu.bat 
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