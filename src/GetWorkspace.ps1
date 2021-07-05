. $PSScriptRoot/Privates.ps1

function Get-Workspace(
    [string]$Name,
    [string]$Source = '~/.config/tosh/tosh.json')
{
    $data = Get-Content $Source -Raw | ConvertFrom-Json

    return $data.workspaces.$Name
}
