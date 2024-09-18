[![icon](https://github.com/eppic/ytBATCH/blob/main/bin/256.ico)](https://github.com/eppic/ytBATCH)
# ytBATCH
An easy to use Batch Script for downloading Audio and Video using [yt-dlp](https://github.com/yt-dlp/yt-dlp).  

## For Linux
[ytBASH](https://github.com/eppic/ytBASH) is an alternative to ytBATCH but for Linux, also made by me.
This also means I won't be working on ytBATCH any longer.

## SCREENSHOTS

   - [Main Menu](https://raw.githubusercontent.com/eppic/ytBATCH-externals/main/image_295.png)
   - [Download Menu](https://raw.githubusercontent.com/eppic/ytBATCH-externals/main/image_293.png)  
   - [Preferences](https://raw.githubusercontent.com/eppic/ytBATCH-externals/main/image_294.png)  

## INSTALL

1. Download the [latest code](https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip) or a [release](https://github.com/eppic/ytBATCH/releases)  
2. Run ytBATCH.bat in the provided folder  
3. A prompt appears asking to install ytBATCH.  
   - `Yes`: Install ytBATCH to AppData and generate shortcuts  
   - `No`: Keep ytBATCH as a portable program  
4. Wait for yt-dlp.exe and ffmpeg.exe to download  
5. Done  

## USAGE

1. Open ytBATCH.bat or the shortcut on the Desktop / Start Menu  
2. Paste Link  
3. Select an option  
   - `Audio`: Download Audio
   - `Video`: Download Video (when available)
   - `List All`: List all available formats
   - `Change Format`: Show a menu to change the Audio/Video format
   - `Add to Queue`: Add the link to the queue instead of downloading it directly
   - `Playlist`: Download the whole playlist 
   - `Subtitles`: Download Video subtitles
   - `Cookies`: Use Cookies.txt (when available) 
   - `Add Custom Options`: Add custom yt-dlp parameters
4. Start Download (If Change Format is `TRUE`, choose format first)
5. Output is Downloads/ytBATCH (can be changed)

## QUEUE USAGE

1. Paste Link
2. Set `Add to Queue` to `TRUE`
3. Select `Video`/`Audio`/`List All Formats`and File Extension
4. Press Q to start Queue.
5. Add more Links to the Queue while downloading, when wanted
6. When all downloads are finished, Queue closes
