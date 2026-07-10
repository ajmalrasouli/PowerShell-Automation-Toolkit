<#
.SYNOPSIS
Demonstrates basic usage of the Write-ToolkitLog function.

.DESCRIPTION
This example writes log messages using each available log level.

.NOTES
Project : PowerShell Automation Toolkit
#>

# Import the logging function
. "$PSScriptRoot\..\Write-ToolkitLog.ps1"

Write-ToolkitLog -Message "Toolkit started."

Write-ToolkitLog -Message "Connected to Azure." -Level Success

Write-ToolkitLog -Message "Configuration loaded." -Level Info

Write-ToolkitLog -Message "Disk space below 20%." -Level Warning

Write-ToolkitLog -Message "Authentication failed." -Level Error

Write-ToolkitLog -Message "Debug information." -Level Debug