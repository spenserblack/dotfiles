#!/usr/bin/env pwsh
New-Item -Force -Path $PROFILE
echo @"
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Function Django {python.exe manage.py @Args}
Set-Alias dj -Value Django
Function Beep {[console]::beep(256,128)}
"@ | Out-File $PROFILE
