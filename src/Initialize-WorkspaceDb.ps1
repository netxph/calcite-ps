function Initialize-WorkspaceDb([string]$Path)
{
    @(
        @{
            workspaces = @{}
        }
    ) | ConvertTo-Json -depth 100 | Out-File ${Path}\tosh.json
}
