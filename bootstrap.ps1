#!/usr/bin/env pwsh
New-Item -Force -Path $PROFILE
echo @"
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Function Django {python.exe manage.py @Args}
Set-Alias dj -Value Django
"@ | Out-File $PROFILE
