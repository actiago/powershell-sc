<#
.SYNOPSIS
    Adiciona autoresposta em lote para usuários de uma lista

.DESCRIPTION
    Habilita autoresposta para os usuários do Exchange Online

.NOTES

  Name:          SetAutoReply.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

$Users = Import-Csv C:\temp\Users.csv

foreach ($user in $users) {
Set-MailboxAutoreplyConfiguration -Identity $User.UserPrincipalName -AutoReplyState Enabled -externalmessage "Texto" }
