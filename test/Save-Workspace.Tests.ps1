
Describe 'Initialize-WorkspaceDb' {
    BeforeAll {
        function Initialize-WorkspaceDb([string]$Path)
        {
            @(
                @{
                    workspaces = @{}
                }
            ) | ConvertTo-Json -depth 100 | Out-File ${Path}\tosh.json
        }
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
