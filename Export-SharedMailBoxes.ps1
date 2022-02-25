<#
.SYNOPSIS
    Lista usuários de listas de distribuições.

.DESCRIPTION
    Lista usários e adiciona uma coluna com o nome da lista na qual eles fazem parte.


.NOTES
  Name:          export-users-list.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited | Select-Object -Property DisplayName,UserprincipalName,PrimarySmtpAddress,RecipientTypeDetails |  Export-Csv -Path .\002-sharedMailboxes.csv -NoTypeInformation -Encoding UTF8
