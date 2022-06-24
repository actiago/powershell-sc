<#
.SYNOPSIS
    Lista usuários de caixas de e-mail compartilhadas.

.DESCRIPTION
    Lista usários e adiciona uma coluna com o nome da caixa compartilhada na qual eles fazem parte.
    User o script Get-DistributionListByDomain.ps1 para coletar estes dados.

.NOTES
  Name:          get-sharedMailboxesUsers.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

$Dados = Get-Content -Path .\company-shared.txt

ForEach ($Dado in $Dados) {
    Get-Mailbox -Identity $Dado | Get-Mailboxpermission | Select-Object -Property User,@{n="Conta";e={$Dado}} | Export-Csv -path '.\shared-company.csv' -NoTypeInformation -Append -Encoding UTF8
}
