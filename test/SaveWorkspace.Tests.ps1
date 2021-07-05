Describe 'Save-Workspace' {

    BeforeAll {
        . $PSScriptRoot/../src/SaveWorkspace.ps1
    }

    BeforeEach {
        Remove-Item ./tosh.json -ErrorAction Ignore
    }

    It 'Should create source When not exist' {
        Save-Workspace -Name users -Path c:/users -Source ./tosh.json

        Test-Path ./tosh.json | Should Be $true
    }

    It 'Should save workspace' {
        Save-Workspace -Name users -Path c:/users -Source ./tosh.json
        
        $sut = Get-Content ./tosh.json | Out-String | ConvertFrom-Json
        $sut.workspaces.users | Should Be 'c:/users'
    }

    It 'Should overwrite workspace' {
        Save-Workspace -Name users -Path c:/users -Source ./tosh.json
        Save-Workspace -Name users -Path c:/overwrite -Source ./tosh.json

        $sut= Get-Content ./tosh.json | Out-String | ConvertFrom-Json
        $sut.workspaces.users | Should Be 'c:/overwrite'
    }

    It 'Should get current directory when $path not supplied' {
        Save-Workspace -Name users -Source ./tosh.json 

        $path = Get-Location

        $sut= Get-Content ./tosh.json | Out-String | ConvertFrom-Json
        $sut.workspaces.users | Should Be $path.path
    }
}
