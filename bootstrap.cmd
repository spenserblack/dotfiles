@echo off
SET DOTFILES=%~dp0
%windir%\System32\WindowsPowerShell\v1.0\powershell.exe -NonInteractive -File "%DOTFILES%bootstrap.ps1"
