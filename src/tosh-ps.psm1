. $PSScriptRoot\SaveWorkspace.ps1

$modules = @{
    Function = @(
        'Save-Workspace'
    )
}

Export-ModuleMember @modules
