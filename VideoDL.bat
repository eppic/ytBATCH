@echo off
title Download Video - ytBATCH %version%
cls

::Download Video
    echo Video
    youtube-dl -o "%Destination%%FileNaming%" %CookieSet% --add-metadata %Url%
    if "%DestOpen%"=="T" explorer %Destination% 
    pause
    cls
    echo - - - - -
    echo Saved "%Url%" under "%Destination%".
    echo - - - - -
    pause
    call MainMenu
    
    ::-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4
