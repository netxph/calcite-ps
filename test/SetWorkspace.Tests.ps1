Describe 'Set-Workspace' {

    BeforeAll {
        . $PSScriptRoot/../src/GetWorkspace.ps1
        . $PSScriptRoot/../src/SaveWorkspace.ps1
        . $PSScriptRoot/../src/SetWorkspace.ps1
    }

    BeforeEach {
        Remove-Item ./tosh.json -ErrorAction Ignore
    }

    It 'Should set path' {
        $source = Join-Path (Resolve-Path .).Path tosh.json

        Save-Workspace -Name users -Source $source
        Set-Location $PSScriptRoot

        Set-Workspace -Name users -Source $source

        $expected = (Resolve-Path $PSScriptRoot/..).Path
        (Get-Location).Path | Should Be $expected
    }

    It 'Should do nothing when $name not exist' {
        $expected = (Get-Location).Path

        Save-Workspace -Name users -Source ./tosh.json
        Set-Workspace -Name xxx -Source ./tosh.json

        (Get-Location).Path | Should Be $expected
    }

    AfterEach {
        Remove-Item -Path $PSScriptRoot/Test -Force -ErrorAction Ignore
        Set-Location -Path $PSScriptRoot/..
    }
}
