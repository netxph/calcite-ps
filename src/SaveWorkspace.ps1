. $PSScriptRoot/Privates.ps1

function Save-Workspace(
    [string]$Name, 
    [string]$Path, 
    [string]$Source = '~/.config/tosh/tosh.json')
{
    if ((Test-Path $Source) -eq $false) {
        Initialize-WorkspaceDb -Source $Source
    }

    if (!$Path) {
        $Path = (Get-Location).Path
    }

    $data = Get-Content $Source -Raw | ConvertFrom-Json
    $data.workspaces | Add-Member -MemberType NoteProperty -Name $Name -Value $Path -Force

    
    $data | ConvertTo-Json -depth 100 | Out-File $Source
}
