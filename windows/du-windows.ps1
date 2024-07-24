<#
.SYNOPSIS
    Script em powershell equivalente ao du (Linux)
.DESCRIPTION
    Lista o tamanho dos arquivos e diretórios do windows

.NOTES
    Name: du-windows.ps1
    Version: 0.1.0
    Author: Tiago Amaral | github.com/actiago
    Creation Date: 24/07/2024
    Last Edit Date:

#>

Get-ChildItem -Directory -Recurse | ForEach-Object {
    $size = (Get-ChildItem -Path $_.FullName -Recurse -File | Measure-Object -Property Length -Sum).Sum
    [PSCustomObject]@{
        Name = $_.FullName
        Size = [Math]::Round($size / 1MB, 2)
    }
} | Sort-Object Size -Descending

