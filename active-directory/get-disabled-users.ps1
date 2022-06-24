<#
.SYNOPSIS
    Listar usuários que não se autenticam a mais de 60 dias.
.DESCRIPTION
.NOTES
  Name:          get-disabled-users.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Jun 2022
  Link:          ---
#>

$InactiveDays = 60
$Days = (Get-Date).Adddays(-($InactiveDays))

Get-ADUser -Filter {LastLogonTimeStamp -lt $Days} -SearchBase 'DC=domain,DC=local' -Properties LastLogonTimeStamp,CPF,SamAccountName,physicalDeliveryOfficeName,Office,Enabled,Description,camelIgnore,CanonicalName | select-object Name,SamAccountName,CPF,physicalDeliveryOfficeName,Office,Enabled,Description,camelIgnore,CanonicalName,@{Name="Date"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('MM-dd-yyyy')}} | Export-Csv 'C:\tmp\60diasapaixonado-ALL.csv' -notypeinformation -Encoding UTF-8
