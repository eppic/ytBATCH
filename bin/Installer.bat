@echo off
title ytBATCH Installer
cls

::Check if ytBATCH data is there
    if exist ..\exe\ goto :ChoosePath
    echo ytBATCH data not found. 
    echo Automatic Downloads are currently not supported.
    echo Now opening GitHub Page.
    pause
    start "" "https://github.com/eppic/ytBATCH"
    exit

::Installer
    :ChoosePath
    set icode=
    cls
    echo Welcome to the ytBATCH Installer!
    echo Recommended: Install ytBATCH to AppData? (Y/N)
    echo.
    
    set /p icode=COMMAND:
    
    if /i "%icode%"=="Y" goto appdata_install
    if /i "%icode%"=="N" copy nul "..\cfg\userconfig.bat" & call New.bat
    goto ChoosePath
    
    :appdata_install
    cd ..\
    xcopy ".\" "%AppData%\ytBATCH" /S /I /Y
    
    ren .\bin\ytbsc ytBATCH.lnk
    xcopy ".\bin\ytBATCH.lnk" "%userprofile%\Desktop" /Y
    xcopy ".\bin\ytBATCH.lnk" "%AppData%\Microsoft\Windows\Start Menu\Programs" /Y
        
    copy nul "%AppData%\ytBATCH\cfg\userconfig.bat"
    
    :RmOGD
    set icode=
    cls
    echo Moved and created shortcuts successfully!
    echo Keep original folder? (Y/N)
    echo. 
    set /p icode=COMMAND:
    if /i "%icode%"=="Y" goto rm_yes
    if /i "%icode%"=="N" goto rm_no
    goto RmOGD
    
    :rm_no
    cls
    echo Installation finished!
    echo.
    echo Press any key to close the installer and delete the Original Folder...
    explorer %AppData%\ytBATCH
    rmdir ".\" /s /q
    exit
    
    :rm_yes
    cls
    echo Installation finished!
    echo.
    echo Press any key to close the installer...
    explorer %AppData%\ytBATCH
    exit
    