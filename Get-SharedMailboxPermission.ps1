<#
.SYNOPSIS
  Lista permissões de caixas de e-mail compartilhadas.

.DESCRIPTION
  Lista as caixas de correios compartilhadas, usuários e suas respectivas permissões.

.NOTES
  Name:          Get-SharedMailboxPermission.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize:Unlimited | Get-MailboxPermission |Select-Object Identity,User,AccessRights | Where-Object {($_.user -like '*@*')}|Export-Csv C:\Temp\sharedfolders.csv  -NoTypeInformation -Encoding UTF8
