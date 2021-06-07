@echo off
title ytBATCH Installer
cls

:ChoosePath
set icode=
cls
echo Welcome to the ytBATCH Installer!!
echo Choose a location to install ytBATCH:
echo - - - - -
echo [A] AppData... [Recommended]
echo - - - - -
echo [X] Do not install...
echo - - - - -

set /p icode=COMMAND:

if /i "%icode%"=="A" goto appdata_install
if /i "%icode%"=="X" exit
goto ChoosePath

:appdata_install

echo Installing to AppData...
echo - - - - -
xcopy ".\" "%AppData%\ytBATCH" /I /Y
echo - - - - -
echo Creating Shortcuts...
echo - - - - -
xcopy ".\ytBATCH.lnk" "%userprofile%\Desktop" /Y
xcopy ".\ytBATCH.lnk" "%AppData%\Microsoft\Windows\Start Menu\Programs" /Y

:RmOGF
cls
echo Moved and created shortcuts successfully!
echo Remove original folder (Y/N)?
echo - - - - - 
set /p icode=COMMAND:
if /i "%icode%"=="Y" goto rm_yes
if /i "%icode%"=="N" goto rm_no
goto 

:rm_yes
cls
echo Installation finished!
echo - - - - -
echo Press any key to close the installer and delete the Original Directory...
rmdir ".\" /s /q
exit

:rm_no
cls
echo Installation finished!
echo - - - - -
echo Press any key to close the installer...
exit
