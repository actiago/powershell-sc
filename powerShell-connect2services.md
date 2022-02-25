# Conectar-se a serviços online da Microsoft

Antes de iniciar qualquer script, certifique-se de que esteja conectado aos serviços abaixo.

## Azure AD

```PowerShell
Connect-AzureAD
```

## Exchange Online

```PowerShell
Connect-ExchangeOnline -UserPrincipalName navin@contoso.com
```

## Sharepoint Online

```PowerShell
Connect-SPOService -Url https://contoso-admin.sharepoint.com
```
