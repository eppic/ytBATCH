[![icon](https://github.com/eppic/ytBATCH/blob/main/bin/256.ico)](https://github.com/eppic/ytBATCH)
# ytBATCH
An easy to use Batch Script using [youtube-dl](https://github.com/ytdl-org/youtube-dl).  

## INSTALL

1. Download the [latest code](https://github.com/eppic/ytBATCH/archive/refs/heads/main.zip) or a [release](https://github.com/eppic/ytBATCH/releases)  
2. Run ytBATCH.bat in the provided folder  
3. A prompt appears asking to install ytBATCH.  
   - *`Yes`: Install ytBATCH to AppData and generate shortcuts*  
   - *`No`: Keep ytBATCH in its download folder.*  
4. Press any key to download youtube-dl.exe and ffmpeg.exe  
5. Done  

## USAGE

1. Open ytBATCH.bat or the shortcut on the Desktop / Start Menu  
2. Paste URL  
3. Select an Option  
   - `Audio`: Downloads Audio, Select Audio Format  
   - `Video`: Downloads Video (When available), Select Video Format  
   - `List All Formats...`: Lists all available formats found
   - `Add to Queue...`: Adds the link to the queue instead of downloading it separately
   - `Playlist`: When the link obtains a playlist, download whole playlist
   - `Cookies`: When available, uses cookies.txt  
4. Select an Option
   - `Audio`/`Video`: Select format
   - `List All Formats...`: Lists formats, type code of wanted format
5. Download starts
6. Output is Downloads/ytBATCH (by default)

## QUEUE USAGE

1. Paste URL
2. Set `Add to Queue...` to `TRUE`
3. Select `Video`/`Audio`/`List All Formats`and File Extension
4. Press Q to start Queue.
5. Add more URLs to the Queue while downloading, when wanted
6. When all downloads are finished, Queue closes

## PREFERENCES

 - `Change Output Path...`: Specify Download Output Path
 - `Set Default Audio and Video Formats...`: Set `Audio/Video.*` (mp3, wav,... / mp4, mkv,...)
 - `Use Cookies by default...`: Use `cookies.txt` by default when downloading
 - `Open Containing Folder after Download...`: Open Download Directory in explorer
 - `Clean Queue when restarting`: Delete all Links in Queue when restarting
 - `Keep Download History`: Saves URL History under ytBATCH/History.txt
  
 - `Open ytBATCH Config...`: ytBATCH Config, for manual editing
 - `Open youtube-dl Config...`: Enter own youtube-dl Options used for every download; (sperated by Enter)
 - `Open Root Directory...`: Open ytBATCH diretory
 - `Open Download Directory...`: Open assigned Download directory
 - `Open GitHub Repository...`: Open this Site
