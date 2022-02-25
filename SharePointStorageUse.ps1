# $userName = "me@mycompany.onmicrosoft.com"
# $orgName="myorg.onmicrosoft.com"
# $o365Cred = Get-Credential -UserName $userName -Message "Entre com as credenciais do Office 365"
# $o365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $o365Cred -Authentication Basic -AllowRedirection

# Connect-MsolService
# Import-Module ExchangeOnlineManagement

# $o365Session = Connect-ExchangeOnline -UserPrincipalName $userName -ShowProgress $true

# Import-PSSession $o365Session

$spoAdminUrl ="https://company-admin.sharepoint.com"

# Connect-SPOService -Url https://contoso-admin.sharepoint.com

Connect-SPOService -Url $spoAdminUrl # $o365Cred

$O365Groups = Get-UnifiedGroup -ResultSize Unlimited

$CustomResult=@()

ForEach ($O365Group in $O365Groups){
If($O365Group.SharePointSiteUrl -ne $null) { $O365GroupSite=Get-SPOSite -Identity $O365Group.SharePointSiteUrl

$CustomResult += [PSCustomObject] @{
    GroupName =  $O365Group.DisplayName
    Owner = $O365Group.Owner
    SiteUrl = $O365GroupSite.Url
    StorageUsed_inMB = $O365GroupSite.StorageUsageCurrent
    StorageQuota_inGB = $O365GroupSite.StorageQuota/1024
    WarningSize_inGB =  $O365GroupSite.StorageQuotaWarningLevel/1024
}
}
}

$CustomResult | Format-Table

$CustomResult | Export-CSV "C:\Users\user00\STORAGE-SHAREPOINT.csv" -NoTypeInformation -Encoding UTF8
