#!/usr/bin/env pwsh
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -BellStyle Visual
Function Django {python.exe manage.py @Args}
Set-Alias dj -Value Django
Function Beep {[console]::beep(256,128)}
