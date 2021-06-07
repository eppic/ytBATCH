@echo off
title Reset - ytBATCH %version%
if /I "%mtx%"=="" cls

::Reset Menu
    echo WARNING!
    echo If you proceed ytBATCH will get deleted and re-downloaded.
    echo - - - - -
    echo [reset123] Proceed...
    echo [B] Go Back...
    echo - - - - -
    
    set /p ResetCode=COMMAND:
    
    if /i "%ResetCode%"=="reset123" goto ResetCheck
    if /i "%ResetCode%"=="B" call Preferences.bat
    
    call Reset.bat
    
    :ResetCheck
    pause
    del /q ..\UserConfig.bat
    del /q ..\ytBATCH.lnk
    rmdir /s /q ..\exe
    start ..\installer.bat
    rmdir /s /q ..\bin
    
    echo ERROR: Something went wrong. 
    pause 
    call New.bat
    