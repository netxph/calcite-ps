. $PSScriptRoot/Privates.ps1

function Get-Workspace(
    [string]$Name,
    [string]$Source = '~/.config/tosh/tosh.json')
{
    $data = Get-Content $Source -Raw | ConvertFrom-Json

    if($Name -ne '') {
        return $data.workspaces.$Name
    }

    $table = @{}
    $data.workspaces.PSObject.Members | 
        Where-Object MemberType -eq NoteProperty | 
        ForEach-Object { $table[$_.Name] = $_.Value }

    return $table
    
}
