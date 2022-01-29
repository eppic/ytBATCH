@echo off
title Choose Format - ytBATCH %version%
%mcls%

::Download Audio
    set FormatListCode=
    echo Checking available formats...
    echo.
    ..\exe\%ytdlv% -F %Url%
    echo.
    echo (B) Go Back...
    echo.
    
    :ReturnFLC
    set /p FormatListCode=CODE/ID:
    if /i "%FormatListCode%"=="B" call UrlHandler
    if /i "%FormatListCode%"=="" goto ReturnFLC

::Add Url to History 
    if /i "%HstEnb%"=="T" echo %Url%>> ..\History.txt

::Add to Queue
    if /i "%QueueSet%"=="T" echo ..\exe\%ytdlv% -f %FormatListCode%+bestaudio %%DlOpt%% %CookieSet% %PlaylistSet% %Url% >> ..\QueueList.bat & call MainMenu.bat

::Download
    ..\exe\%ytdlv% -f %FormatListCode%+bestaudio %DlOpt% %CookieSet% %PlaylistSet% %SubSet% %Url%
    if /i "%DestOpen%"=="T" explorer %Destination% 

    echo.
    pause
    call MainMenu.bat