# powershell 5.1
## locations
### settings.json
C:\users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json

#### documentation
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config?view=powershell-7.5

#### get or do location
```
$settings = (Get-Item "C:\users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json")
$settings.DirectoryName
```
To open it from the Windows Terminal directly:
```
Ctrl + ,
Edit the settings.json file.
Save settings.json file.
```
### Microsoft.PowerShell_profile.ps1
C:\Users\$env:UserName\OneDrive - {Org}\Documents\WindowsPowerShell

