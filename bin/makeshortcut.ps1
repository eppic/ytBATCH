$YtbLink = $env:APPDATA + "\ytBATCH\ytBATCH.bat"
$YtbLinkSM = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\ytBATCH.lnk"
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\ytBATCH.lnk")

$Shortcut.TargetPath = "$YtbLink"
$YtbWD = $env:APPDATA + "\ytBATCH\"
$Shortcut.WorkingDirectory = "$YtbWD"
$YtbIL = $env:APPDATA + "\ytBATCH\bin\256.ico"
$Shortcut.IconLocation = "$YtbIL"
$Shortcut.Save()

$Shortcut = $WshShell.CreateShortcut("$YtbLinkSM")

$Shortcut.TargetPath = "$YtbLink"
$YtbWD = $env:APPDATA + "\ytBATCH\"
$Shortcut.WorkingDirectory = "$YtbWD"
$YtbIL = $env:APPDATA + "\ytBATCH\bin\256.ico"
$Shortcut.IconLocation = "$YtbIL"
$Shortcut.Save()
