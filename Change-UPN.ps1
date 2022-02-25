<#
.SYNOPSIS
    Change UserPrincipalName of users on Active Directory

.DESCRIPTION
    Find users with a domain and add a new one

.NOTES
  Name:          Change-UPN.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

$LocalUsers = Get-ADUser -Filter {UserPrincipalName -like '*meudominio.com.br'} -SearchBase 'OU=Brazil,DC=b,DC=local' -Properties UserPrincipalName -ResultSetSize $null
$LocalUsers | foreach {$newUpn = $_.UserPrincipalName.Replace("meudominio.com.br","novodominio.com.br"); $_ | Set-ADUser -UserPrincipalName $newUpn}
