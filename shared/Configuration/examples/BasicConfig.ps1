<#
.SYNOPSIS
Basic example demonstrating Get-ToolkitConfig.

.NOTES
Project : PowerShell Automation Toolkit
#>

# Import shared functions
. "$PSScriptRoot\..\Get-ToolkitConfig.ps1"

$config = Get-ToolkitConfig `
    -Path "$PSScriptRoot\config.json"

Write-Output "Environment: $($config.Toolkit.Environment)"
Write-Output "Log Level: $($config.Logging.LogLevel)"
Write-Output "Azure Location: $($config.Azure.Location)"