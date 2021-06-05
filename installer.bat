@echo off
title ytBATCH Installer
if /I "%mtx%"=="" cls

echo Welcome to the ytBATCH Installer!!
echo - - - - -
pause
if /I "%mtx%"=="" cls

echo Please wait for ytBATCH to download...
echo - - - - -
pause

::download to batch path

:ChoosePath
set icode=
if /I "%mtx%"=="" cls
echo Please choose a place to install ytBATCH:
echo - - - - -
echo [A] AppData... [Recommended]
echo - - - - -
echo [X] Do not install...
echo - - - - -

set /p icode=COMMAND:

if /i "%icode%"=="A" goto appdata_install
if /i "%icode%"=="PF" goto pfiles_install
if /i "%icode%"=="CT" goto custom_install
if /i "%icode%"=="X" exit
if /i "%icode%"=="" goto ChoosePath
goto ChoosePath

:appdata_install

echo Installing to AppData...
echo - - - - -
xcopy ".\ytBATCH_dl" "%AppData%\ytBATCH" /I /Y
echo - - - - -
echo Creating Shortcuts...
echo - - - - -
xcopy ".\ytBATCH_dl\ytBATCH.lnk" "%userprofile%\Desktop" /Y
xcopy ".\ytBATCH_dl\ytBATCH.lnk" "%AppData%\Microsoft\Windows\Start Menu\Programs" /Y
echo - - - - -
echo Removing original folder...
rmdir "ytBATCH_dl" /s /q
echo - - - - -
echo Installation finished!
echo - - - - -
echo Press any key to close the installer...
pause >nul
exit
