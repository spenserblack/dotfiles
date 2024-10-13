<#
.SYNOPSIS
    Register a file for the dotfiles repository.
.DESCRIPTION
    Register a file for the dotfiles repository.
.PARAMETER Path
    The path to the file to register.
.PARAMETER Suffix
    The suffix to append to the registered file.
.EXAMPLE
    register.ps1 -Path $Profile
.EXAMPLE
    register.ps1 -Path $Profile -Suffix Profile
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [string]$Suffix = ""
)

$Path = $Path -replace "^~", $HOME
$RelativePath = $Path -replace [regex]::Escape("$HOME\"), ""
$RelativePath = $RelativePath -replace "\\", "/"
$Dotfiles = $PSScriptRoot
$Destination = "$Dotfiles\registered$Suffix.txt"

function Register {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $Path = $Path -replace "^~", $HOME

    # If $Path is a directory, call Register for each file in the directory
    if (Test-Path -Path $Path -PathType Container) {
        Get-ChildItem -Path $Path | ForEach-Object {
            Register -Path $_.FullName
        }
        return
    }

    # If the file to register does not exist, throw an error.
    if (-not (Test-Path $Path)) {
        throw "File not found: $Path"
    }

    # The filename relative to $HOME
    $RelativePath = $Path -replace [regex]::Escape("$HOME\"), ""

    # NOTE: Normalize to "/"
    $RelativePath = $RelativePath -replace "\\", "/"

    # NOTE: Skip the file if it's already registered
    if (Select-String -Path $Destination -Pattern "^$RelativePath$") {
        Write-Error "Already registered: $RelativePath"
        return
    }

    # NOTE: Since Windows doesn't usually have symlinks, we'll just copy the file
    $Folder = Split-Path -Path "$Dotfiles/$RelativePath" -Parent
    if (-not (Test-Path -Path $Folder)) {
        New-Item -ItemType Directory -Path $Folder
    }
    Copy-Item -Recurse -Path "$Path" -Destination "$Dotfiles/$RelativePath"
    Add-Content -Path "$Destination" -Value "$RelativePath"
    Get-Content -Path "$Destination" | Sort-Object | Set-Content -Path "$Destination"
    git.exe -C "$Dotfiles" add "$Dotfiles/$RelativePath"
}

Register -Path $Path

git.exe -C "$Dotfiles" add "$Destination"
git.exe -C "$Dotfiles" commit -m "Register $RelativePath"
