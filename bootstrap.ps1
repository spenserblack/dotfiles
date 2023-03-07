#!/usr/bin/env pwsh
New-Item -Force -Path $PROFILE
echo @"
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
"@ | Out-File $PROFILE
