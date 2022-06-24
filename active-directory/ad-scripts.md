# Scripts para o Microsoft Active Directory

### Lista usuários do Active Directory e exporta para um arquivo
> Para a obtenção de mais propriedades no filtro, use a documentação oficial: https://docs.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=winserver2012-ps

```PowerShell
Get-ADUser -filter * -SearchBase 'DC=domain,DC=local' -Properties *|select name,PhysicalDeliveryOfficeName,CPF,Enabled,Mail,Created,LastLogonDate |export-csv C:\Temp\AD2.csv -Encoding UTF8
```

### Exporta a propriedade _Logon Hours_ dos usuários do AD

```PowerShell
Get-ADUser -filter * -SearchBase 'DC=domain,DC=local' -Properties *|select name,PhysicalDeliveryOfficeName,CPF,Enabled,Mail, @{N=" LogonHours";E={$_.LogonHours}} |export-csv 002FINAL.csv
```
