<#
.SYNOPSIS
Demonstrates logging to a file.

.DESCRIPTION
This example writes log entries to the console and to a log file.

.NOTES
Project : PowerShell Automation Toolkit
#>

# Import the logging function
. "$PSScriptRoot\..\Write-ToolkitLog.ps1"

$LogFile = Join-Path `
    -Path $PSScriptRoot `
    -ChildPath "Logs\Toolkit.log"

Write-ToolkitLog `
    -Message "Backup started." `
    -Level Info `
    -LogFile $LogFile

Write-ToolkitLog `
    -Message "Processing files..." `
    -Level Info `
    -LogFile $LogFile

Write-ToolkitLog `
    -Message "Backup completed successfully." `
    -Level Success `
    -LogFile $LogFile

Write-Host ""
Write-Host "Log file created at:" -ForegroundColor Green
Write-Host $LogFile