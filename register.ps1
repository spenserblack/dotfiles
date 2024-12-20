<#
.SYNOPSIS
    Register a file for the dotfiles repository.
.DESCRIPTION
    Register a file for the dotfiles repository.
.PARAMETER Path
    The path to the file to register.
.PARAMETER DotFolder
    The name of the folder containing the dotfiles.
.EXAMPLE
    register.ps1 -Path $Profile
.EXAMPLE
    register.ps1 -Path $Profile DotFolder .windows
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [string]$DotFolder = ".all"
)

$Path = $Path -replace "^~", $HOME
$RelativePath = $Path -replace [regex]::Escape("$HOME\"), ""
$RelativePath = $RelativePath -replace "\\", "/"
$Dotfiles = $PSScriptRoot
$DestinationFolder = "$Dotfiles\$DotFolder"

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
    $DestinationFile = "$DestinationFolder/$RelativePath"
    if (Test-Path -Path $DestinationFile) {
        Write-Error "Already registered: $RelativePath"
        return
    }

    # NOTE: Since Windows doesn't usually have symlinks, we'll just copy the file
    Copy-Item -Recurse -Path "$Path" -Destination "$DestinationFile"
    git.exe -C "$Dotfiles" add "$DestinationFile"
}

Register -Path $Path

git.exe -C "$Dotfiles" commit -m "Register $RelativePath"
