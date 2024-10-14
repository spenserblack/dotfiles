Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -BellStyle Visual
Function Django {python.exe manage.py @Args}
Set-Alias dj -Value Django
Function Beep {[console]::beep(512,128)}
