<#
.SYNOPSIS
Loads a JSON configuration file for the PowerShell Automation Toolkit.

.DESCRIPTION
Reads a JSON configuration file, validates that it exists,
parses the JSON, and returns a PowerShell object.

The configuration framework is shared across all toolkit modules.

.PARAMETER Path
Path to the JSON configuration file.

.EXAMPLE
$config = Get-ToolkitConfig -Path ".\config.json"

.EXAMPLE
$config.Logging.LogLevel

.NOTES
Project : PowerShell Automation Toolkit
Author  : Ajmal Rasouli
Version : 0.3.0
License : MIT
#>

function Get-ToolkitConfig {

    [CmdletBinding()]
    [OutputType([PSCustomObject])]

    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path

    )

    begin {

        $LoggingFunction = Join-Path `
            $PSScriptRoot `
            "..\Logging\Write-ToolkitLog.ps1"

        if (Test-Path $LoggingFunction) {

            . $LoggingFunction

        }

    }

    process {

        if (-not (Test-Path $Path)) {

            if (Get-Command Write-ToolkitLog -ErrorAction Ignore) {

                Write-ToolkitLog `
                    -Message "Configuration file not found: $Path" `
                    -Level Error `
                    -NoConsole

            }

            throw "Configuration file '$Path' does not exist."

        }

        try {

            $Configuration = Get-Content `
                -Path $Path `
                -Raw |
                ConvertFrom-Json

        }

        catch {

            if (Get-Command Write-ToolkitLog -ErrorAction Ignore) {

                Write-ToolkitLog `
                    -Message "Invalid JSON in configuration file." `
                    -Level Error `
                    -NoConsole

            }

            throw "Invalid JSON configuration file."

        }

        if (Get-Command Write-ToolkitLog -ErrorAction Ignore) {

            Write-ToolkitLog `
                -Message "Configuration loaded successfully." `
                -Level Success `
                -NoConsole

        }

        return $Configuration

    }

}