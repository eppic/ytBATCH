@echo off
title Download Video - ytBATCH %version%
%mcls%

::Download Video
    echo Video
    ..\exe\youtube-dl -o "%Destination%%FileNaming%" %CookieSet% --add-metadata %Url%
    if "%DestOpen%"=="T" explorer %Destination% 
    pause
    %mcls%
    echo - - - - -
    echo Saved "%Url%" under "%Destination%".
    echo - - - - -
    pause
    call MainMenu
    
    ::-f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4
