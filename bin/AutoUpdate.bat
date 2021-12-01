title Auto Updater
%mcls%

::ytBATCH
    :ytbatch-release-dl
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/eppic/ytBATCH/main/bin/versionnumber.info', '..\updatecheck_temp.info')"
    
    ::set latest version to var
    set /p latestversion=<..\updatecheck_temp.info
    del ..\updatecheck_temp.info
    
    ::check if error
    if /i "%latestversion%"=="" exit
    
    ::check if same
    if /i "%version%"=="%latestversion%" (goto UpMsg_UpToDate) else (goto UpMsg_UpdateDL)
    
    :UpMsg_UpToDate
    exit
    
    :UpMsg_UpdateDL
    echo %latestversion% > ..\update.info
    exit
