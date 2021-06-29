function Save-Workspace([string]$Name, [string]$Path, [string]$Source)
{
    if ((Test-Path $Source) -eq $false) {
        Initialize-WorkspaceDb -Source $Source
    }

    $data = Get-Content $Source | Out-String | ConvertFrom-Json

    $table = @{}
    $properties = $data.workspaces.Properties 

    if ($properties -ne $null) {
        $properties | ForEach { $table[$_.Name] = $_.Value }
    }

    $table[$Name] = $Path
    $data.workspaces = $table

    $data | ConvertTo-Json -depth 100 | Out-File $Source
}
