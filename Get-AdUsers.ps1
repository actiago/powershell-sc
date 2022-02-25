# Lista usuários do Active Directory e exporta para um arquivo
# Para a obtenção de mais propriedades no filtro, use a documentação oficial: https://docs.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=winserver2012-ps

Get-ADUser -filter * -SearchBase 'DC=domain,DC=local' -Properties *|select name,PhysicalDeliveryOfficeName,CPF,Enabled,Mail,Created,LastLogonDate |export-csv C:\Temp\AD2.csv -Encoding UTF8
