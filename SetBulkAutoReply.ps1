<#
.SYNOPSIS
    Adiciona autoresposta em lote para usuários de uma lista

.DESCRIPTION
    Habilita autoresposta para os usuários do Exchange Online

.NOTES

  Name:          SetBulkAutoReply.ps1
  Version:       0.2.0
  Author:        Tiago Amaral, Werner Butcher
  Creation Date: 24 Feb 2022
  Link:          ---

.NOTES
  O arquivo deverá ter duas colunas, uma nomeada como Origem e outra como Destino.
  Na primeira adicione o e-mail atual a na segunda a nova conta.
#>

$Users = Import-Csv .\Users2.csv -Delimiter ";"

ForEach ($user in $Users) {
  $EmailBody = @"

  <html>

    <head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    </head>

    <body style="font-family: Calibri;">

    Ola, a partir do dia 3ee3 meu novo e-mail sera $($user.Destino).<br/><br/>

    VALEUUU!<br/><br/>

  </body></html>

"@

  Set-MailboxAutoreplyConfiguration -Identity $user.Origem -AutoReplyState Enabled -ExternalMessage $EmailBody
}

