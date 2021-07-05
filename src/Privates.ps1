function Initialize-WorkspaceDb([string]$Source)
{
    New-Item -Path $Source -ItemType File -Force | Out-Null

    @(
        @{
            workspaces = @{}
        }
    ) | ConvertTo-Json -depth 100 | Out-File $Source
}
