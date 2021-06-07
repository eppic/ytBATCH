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
if /i "%icode%"=="X" copy nul "..\UserConfig.bat" & call New.bat
goto ChoosePath

:appdata_install
cd ..\
::xcopy ".\" "%AppData%\ytBATCH" /I /Y
copy ".\" "%AppData%\ytBATCH" 

ren .\bin\ytbsc ytBATCH.lnk
xcopy ".\bin\ytBATCH.lnk" "%userprofile%\Desktop" /Y
xcopy ".\bin\ytBATCH.lnk" "%AppData%\Microsoft\Windows\Start Menu\Programs" /Y

copy nul "%AppData%\ytBATCH\UserConfig.bat"

:RmOGD
cls
echo Moved and created shortcuts successfully!
echo Remove original folder (Y/N)?
echo - - - - - 
set /p icode=COMMAND:
if /i "%icode%"=="Y" goto rm_yes
if /i "%icode%"=="N" goto rm_no
goto RmOGD

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
