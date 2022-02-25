# Scripts para o Microsoft Office 365

Antes de executar cada script, lembre-se de estar conectado ao serviço, de acordo com o documento 
[Conectar-se a serviços online da Microsoft](../documentos/powerShell-connect2services.md)

## Script ExportImport-UnifiedGroups

> Este script tem diversas funções, o manual de uso está contido nele. Em função do tamanho do script, 
> o mesmo não será embutido neste documento.

Para exportar todos os grupos execute:

```PowerShell
.\ExportImport-UnifiedGroups.ps1 -Mode Export -File MyUnifiedGroups.csv
```

## Obtém e nome e conta de caixas de correio compartilhadas

```PowerShell
Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited | select PrimarySmtpAddress,DisplayName |  export-csv c:\temp\SharedMailboxUsers.csv -Encoding UTF8
```

