function Initialize-WorkspaceDb([string]$Source)
{
    @(
        @{
            workspaces = @{}
        }
    ) | ConvertTo-Json -depth 100 | Out-File $Source
}
