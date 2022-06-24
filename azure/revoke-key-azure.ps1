<#
.SYNOPSIS
  Revoga contas autenticadas no Azure Active Directory

.DESCRIPTION
  Exporta uma lista de usuários de determinado domínio e revoga as conexões no Azure AD
  Ex: Desconecta um usuário do aplicativo Outlook.

.NOTES
  Name:          revoke-key-azure.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

(Get-AzureADUser | Where-Object {$_.UserPrincipalName -like "*@meudominio.com.br"}) | Select-Object ObjectID | Export-Csv -Path c:\temp\users.csv
Import-CSV “c:\temp\users.csv” | % {Get-AzureADUser -SearchString $_.ObjectID | Revoke-AzureADUserAllRefreshToken}
