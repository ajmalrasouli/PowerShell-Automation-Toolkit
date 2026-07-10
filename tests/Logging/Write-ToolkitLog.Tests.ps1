<#
.SYNOPSIS
Unit tests for Write-ToolkitLog.

.NOTES
Project : PowerShell Automation Toolkit
Author  : Ajmal Rasouli
#>

BeforeAll {

    . "$PSScriptRoot\..\..\shared\Logging\Write-ToolkitLog.ps1"

}

Describe "Write-ToolkitLog" {

    It "Function should exist" {

        Get-Command Write-ToolkitLog | Should -Not -BeNullOrEmpty

    }

    It "Should write an INFO message without throwing" {

        {
            Write-ToolkitLog `
                -Message "Testing INFO"
        } | Should -Not -Throw

    }

    It "Should write a SUCCESS message without throwing" {

        {
            Write-ToolkitLog `
                -Message "Testing SUCCESS" `
                -Level Success
        } | Should -Not -Throw

    }

    It "Should write a WARNING message without throwing" {

        {
            Write-ToolkitLog `
                -Message "Testing WARNING" `
                -Level Warning
        } | Should -Not -Throw

    }

    It "Should write an ERROR message without throwing" {

        {
            Write-ToolkitLog `
                -Message "Testing ERROR" `
                -Level Error
        } | Should -Not -Throw

    }

    It "Should create a log file" {

        $LogFile = Join-Path `
            $TestDrive `
            "Toolkit.log"

        Write-ToolkitLog `
            -Message "Testing file logging" `
            -LogFile $LogFile

        Test-Path $LogFile | Should -BeTrue

    }

    It "Should return an object when PassThru is used" {

        $Result = Write-ToolkitLog `
            -Message "Pipeline test" `
            -PassThru

        $Result | Should -Not -BeNullOrEmpty

        $Result.Level | Should -Be "INFO"

    }

    It "Should reject an invalid log level" {

        {
            Write-ToolkitLog `
                -Message "Invalid" `
                -Level Invalid
        } | Should -Throw

    }

}