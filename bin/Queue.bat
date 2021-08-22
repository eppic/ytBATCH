@echo off
title Queue Window - ytBATCH %version%
%mcls%

call ..\QueueList.bat
del ..\QueueList.bat
pause
exit