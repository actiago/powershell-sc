# PowerShell scripts

## Conectar-se a serviços online da Microsoft

Para algumas tarefas, é necessário conectar-se ao seu respectivo serviço.

### Azure AD

```PowerShell
Connect-AzureAD
```

### Exchange Online

```PowerShell
Connect-ExchangeOnline -UserPrincipalName navin@contoso.com
```

### Sharepoint Online

```PowerShell
Connect-SPOService -Url https://contoso-admin.sharepoint.com
```

### MSOnline 
```PowerShell
Connect-MsolService
```

---

## Comandos rápidos

```PowerShell
Get-DistributionGroup -Identity "*@mydomain.com" -ResultSize Unlimited | Format-Table
```

