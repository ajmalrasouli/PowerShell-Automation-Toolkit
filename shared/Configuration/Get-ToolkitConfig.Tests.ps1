<#
.SYNOPSIS
Unit tests for Get-ToolkitConfig.

.NOTES
Project : PowerShell Automation Toolkit
#>

BeforeAll {

    . "$PSScriptRoot\..\..\shared\Configuration\Get-ToolkitConfig.ps1"

    $ValidConfig = Join-Path $TestDrive "config.json"

    @'
{
    "Logging": {
        "LogLevel": "Info"
    },

    "Toolkit": {
        "Environment": "Development"
    },

    "Azure": {
        "Location": "uksouth"
    }
}
'@ | Set-Content $ValidConfig

    $InvalidConfig = Join-Path $TestDrive "invalid.json"

    "{ invalid json }" | Set-Content $InvalidConfig

}

Describe "Get-ToolkitConfig" {

    It "Function should exist" {

        Get-Command Get-ToolkitConfig |
            Should -Not -BeNullOrEmpty

    }

    It "Loads a valid configuration file" {

        {
            Get-ToolkitConfig `
                -Path $ValidConfig
        } | Should -Not -Throw

    }

    It "Returns a PowerShell object" {

        $Config = Get-ToolkitConfig `
            -Path $ValidConfig

        $Config | Should -Not -BeNullOrEmpty

    }

    It "Returns the expected LogLevel" {

        $Config = Get-ToolkitConfig `
            -Path $ValidConfig

        $Config.Logging.LogLevel |
            Should -Be "Info"

    }

    It "Returns the expected Environment" {

        $Config = Get-ToolkitConfig `
            -Path $ValidConfig

        $Config.Toolkit.Environment |
            Should -Be "Development"

    }

    It "Throws if configuration file is missing" {

        {
            Get-ToolkitConfig `
                -Path "$TestDrive\missing.json"
        } | Should -Throw

    }

    It "Throws on invalid JSON" {

        {
            Get-ToolkitConfig `
                -Path $InvalidConfig
        } | Should -Throw

    }

}