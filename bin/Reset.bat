@echo off
title Reset - ytBATCH %version%
%mcls%

::Reset Menu
    set ResetCode=
    echo WARNING!
    echo If you proceed ytBATCH will get deleted and re-downloaded.
    echo.
    echo   (reset123) Proceed...
    echo.
    echo (B) Go Back...
    echo.
    
    set /p ResetCode=COMMAND:
    
    if /i "%ResetCode%"=="reset123" goto ResetCheck
    if /i "%ResetCode%"=="B" call Preferences.bat
    
    call Reset.bat
    
    :ResetCheck
    pause
    del /q ..\UserConfig.bat
    rmdir /s /q ..\exe
	move Installer.bat ..\
    start ..\Installer.bat
    rmdir /s /q ..\bin
    
    echo ERROR: Something went wrong. 
    pause 
    call New.bat
    