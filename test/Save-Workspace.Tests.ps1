
Describe 'Initialize-WorkspaceDb' {
    BeforeAll {
        . $PSScriptRoot\..\src\Initialize-WorkspaceDb.ps1
    }

    BeforeEach {
        Remove-Item ./tosh.json -ErrorAction Ignore
    }

    It 'Should create file' {
        Initialize-WorkspaceDb -Path .

        Test-Path ./tosh.json | Should Be $true
    }

    It 'Should contain empty json' {
        Initialize-WorkspaceDb -Path .

        $sut = Get-Content ./tosh.json | Out-String | ConvertFrom-Json
        $sut | Should Not Be $null
    }
}
