<#
.SYNOPSIS
    Copy registered files to the home directory.
.DESCRIPTION
    Copy registered files to the home directory.
#>
$Dotfiles = $PSScriptRoot
$Destination = $HOME

# For each filename in registered.txt and registered-windows.txt, copy the file
# to the home directory.
function Bootstrap {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Registered
    )

    Get-Content -Path $Registered | ForEach-Object {
        $RelativePath = $_
        $Path = "$Dotfiles\$_"
        $DestinationPath = "$Destination\$_"

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

Bootstrap -Registered "$Dotfiles/registered.txt"
Bootstrap -Registered "$Dotfiles/registered-windows.txt"
Write-Output "Bootstrap complete."
