<#
.SYNOPSIS
Displays values loaded from a JSON configuration file.

.NOTES
Project : PowerShell Automation Toolkit
#>

# Import shared functions
. "$PSScriptRoot\..\Get-ToolkitConfig.ps1"

$config = Get-ToolkitConfig `
    -Path "$PSScriptRoot\config.json"

$config | Format-List

Write-Output ""
Write-Output "Configuration loaded successfully."