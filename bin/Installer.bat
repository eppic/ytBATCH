@echo off
title ytBATCH Installer
cls

::Installer
    :ChoosePath
    set icode=
    cls
    echo Welcome to the ytBATCH Installer!
    echo Recommended: Install ytBATCH to AppData? (Y/N)
    echo.
    
    choice /c YN /n
    set icode=%errorlevel%
    
    if /i "%icode%"=="1" goto appdata_install
    if /i "%icode%"=="2" mkdir ..\cfg & copy nul "..\cfg\UserConfig.bat" & copy nul "..\cfg\youtube-dl.conf" & call Launcher.bat
    goto ChoosePath
    
    :appdata_install
    cd ..\
    xcopy ".\" "%AppData%\ytBATCH" /S /I /Y
    
    powershell.exe "powershell -ExecutionPolicy Bypass -File bin\makeshortcut.ps1"

    mkdir "%AppData%\ytBATCH\cfg"
    copy nul "%AppData%\ytBATCH\cfg\UserConfig.bat"
    copy nul "%AppData%\ytBATCH\cfg\youtube-dl.conf"
    copy nul "%AppData%\ytBATCH\cfg\installation.info"

    :RmOGD
    set icode=
    cls
    echo Moved and created shortcuts successfully!
    echo Keep original folder? (Y/N)
    echo. 

    choice /c YN /n
    set icode=%errorlevel%
    if /i "%icode%"=="1" goto rm_yes
    if /i "%icode%"=="2" goto rm_no
    goto RmOGD
    
    :rm_no
    cls
    echo Installation finished!
    echo.
    echo Press any key to close the installer and delete the Original Folder...
    pause>nul
    explorer %AppData%\ytBATCH
    rmdir ".\" /s /q
    exit
    
    :rm_yes
    cls
    echo Installation finished!
    echo.
    echo Press any key to close the installer...
    pause>nul
    explorer %AppData%\ytBATCH
    exit
    