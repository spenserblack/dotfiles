<#
.SYNOPSIS
    Copy registered files to the home directory.
.DESCRIPTION
    Copy registered files to the home directory.
#>
$Dotfiles = $PSScriptRoot
$Destination = $HOME

function Bootstrap {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Registered
    )

    Get-ChildItem -Path $Registered -File -Recurse | ForEach-Object {
        $Path = $_.FullName
        $RelativePath = $Path -replace [regex]::Escape("$Registered\"), ""
        $DestinationPath = "$Destination\$RelativePath"

        if ($_.Name -eq ".gitkeep") {
            return
        }

        # If the file already exists in the home directory, skip it.
        if (Test-Path -Path $DestinationPath) {
            Write-Error "Already exists: $DestinationPath"
            return
        }

        # If the file to copy does not exist, throw an error.
        if (-not (Test-Path -Path $Path)) {
            throw "File not found: $Path"
        }

        $Directory = Split-Path -Path $DestinationPath
        if (-not (Test-Path -Path $Directory)) {
            New-Item -Path $Directory -ItemType Directory
        }

        Copy-Item -Path $Path -Destination $DestinationPath
        Write-Output "Copied: $RelativePath"
    }
}

Bootstrap -Registered "$Dotfiles\.all"
Bootstrap -Registered "$Dotfiles\.windows"
Write-Output "Bootstrap complete."
