Describe 'Get-Workspace' {

    BeforeAll {
        . $PSScriptRoot/../src/GetWorkspace.ps1
        . $PSScriptRoot/../src/SaveWorkspace.ps1
    }

    BeforeEach {
        Remove-Item ./tosh.json -ErrorAction Ignore
    }

    It 'Should return path' {
        Save-Workspace -Name users -Path c:/users -Source ./tosh.json

        $sut = Get-Workspace -Name users -Source ./tosh.json

        $sut | Should Be "c:/users"
    }

}
