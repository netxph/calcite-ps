function Set-Workspace(
        [string]$Name,
        [string]$Source) {

    $path = Get-Workspace -Name $Name -Source $Source

    if($path -ne $null) {
        Set-Location -Path $path
    }
}
