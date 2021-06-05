@echo off
title Convert Audio or Video to another File - ytBATCH %version%
cls

::Converter
    echo WARNING! - This script is not fully tested!
    echo (A) Convert File to Audio File
    echo (V) Convert File to Video File
    echo 
    echo - - - - -

    set /P ConvCode=COMMAND:

    if /I "%ConvCode%"=="A" goto Audioconv
    if /I "%ConvCode%"=="V" goto VideoConv
    if /I "%ConvCode%"=="" call Converter
    call Converter.bat

    :AudioConv
    set /P ConvOutName=Output File Name (include .mp3 or .wav etc.):
    ffmpeg -i %Url% -vn %Destination%/%ConvOutName%
    goto ConvFin

    :VideoConv
    set /P ConvOutName=Output File Name (include .mp4 or .mov etc.):
    ffmpeg -i %Url% -c:v libx265 -crf 0 %Destination%/%ConvOutName%
    goto ConvFin

    :ConvFin
    cls
    echo Finished converting %Url%
    echo - - - - -
    call MainMenu.bat
