<#
.SYNOPSIS
Writes formatted log messages to the console and optionally to a log file.

.DESCRIPTION
Write-Log provides consistent logging throughout the PowerShell Automation Toolkit.
It supports multiple log levels, colourised console output, optional log file output,
automatic log directory creation and structured objects for pipeline integration.

.PARAMETER Message
The message to log.

.PARAMETER Level
The logging level.

.PARAMETER LogFile
Optional path to a log file.

.PARAMETER NoConsole
Suppress console output.

.PARAMETER PassThru
Returns the generated log object.

.EXAMPLE
Write-ToolkitLog -Message "Toolkit started."

.EXAMPLE
Write-ToolkitLog -Message "Connected to Azure." -Level Success

.EXAMPLE
Write-ToolkitLog -Message "Backup completed." -LogFile ".\Logs\Toolkit.log"

.NOTES
Project : PowerShell Automation Toolkit
Author  : Ajmal Rasouli
Version : 0.2.0
License : MIT
#>


function Write-ToolkitLog {

    [OutputType([PSCustomObject])]

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message,

        [Parameter()]
        [ValidateSet(
            'Info',
            'Success',
            'Warning',
            'Error',
            'Debug'
        )]
        [string]
        $Level = 'Info',

        [Parameter()]
        [string]
        $LogFile,

        [Parameter()]
        [switch]
        $NoConsole,

        [Parameter()]
        [switch]
        $PassThru
    )

    begin {

        $Colours = @{
            Info    = 'White'
            Success = 'Green'
            Warning = 'Yellow'
            Error   = 'Red'
            Debug   = 'Cyan'
        }

    }

    process {

        $Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

        $Entry = "{0} [{1}] {2}" -f `
            $Timestamp,
            $Level.ToUpper(),
            $Message

        if (-not $NoConsole) {

            Write-Host `
                $Entry `
                -ForegroundColor $Colours[$Level]

        }

        if ($LogFile) {

            try {

                $Directory = Split-Path `
                    -Path $LogFile `
                    -Parent

                if (-not [string]::IsNullOrWhiteSpace($Directory)) {

                    if (-not (Test-Path -Path $Directory)) {

                        New-Item `
                            -Path $Directory `
                            -ItemType Directory `
                            -Force | Out-Null

                    }

                }

                Add-Content `
                    -Path $LogFile `
                    -Value $Entry `
                    -Encoding UTF8

            }

            catch {

                Write-Error (
                    "Unable to write to log file '{0}'. {1}" -f `
                    $LogFile,
                    $_.Exception.Message
                )

            }

        }

        if ($PassThru) {

            [PSCustomObject]@{

                Timestamp = $Timestamp
                Level     = $Level.ToUpper()
                Message   = $Message
                Entry     = $Entry

            }

        }

    }

    end {

        # Reserved for future enhancements.

    }

}