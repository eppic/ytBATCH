$AULink = (Get-Item .).FullName + "\AutoUpdate.bat"
$WshShell = New-Object -comObject WScript.Shell

$AUSc = (Get-Item .).FullName + "\AutoUpdate.lnk"
$Shortcut = $WshShell.CreateShortcut("$AUSc")

$Shortcut.TargetPath = "$AULink"
$Shortcut.WindowStyle = 7
$Shortcut.Save()

