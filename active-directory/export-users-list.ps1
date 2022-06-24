<#
.SYNOPSIS
    Lista usuários de listas de distribuições.

.DESCRIPTION
    Lista usários e adiciona uma coluna com o nome da lista na qual eles fazem parte.
    User o script Get-DistributionListByDomain.ps1 para coletar estes dados.

.NOTES
  Name:          export-users-list.ps1
  Version:       0.1.0
  Author:        Tiago Amaral / Werner Butcher
  Creation Date: 24 Feb 2022
  Link:          ---
#>

$Dados = Get-Content -Path .\lista-dist-company.txt

ForEach ($Dado in $Dados) {
    Get-DistributionGroupMember -Identity $Dado |Select-Object identity,PrimarySmtpAddress,@{n="Conta";e={$Dado}} | Export-Csv -path '.\listas-final.csv' -NoTypeInformation -Append -Encoding UTF8
}
