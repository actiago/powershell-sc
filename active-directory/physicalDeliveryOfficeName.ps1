<#
.SYNOPSIS
    Change UserPrincipalName of users on Active Directory

.DESCRIPTION
    Find users with a domain and add a new one

.NOTES
  Name:          Change-UPN.ps1
  Version:       0.1.0
  Author:        Tiago Amaral
  Creation Date: 24 Feb 2022
  Link:          ---
#>

$USERS = Get-Aduser -Filter "physicalDeliveryOfficeName -eq '4385 - Company00'" -Property *
$USERS | Select-Object Name, Office
ForEach ($User in $USERS){Set-ADUser -Identity $User -Office ‘4385 - Company 01’}
Get-ADUser -Filter "Office -eq '4385 - Company 01' " -Property * | Select-Object Name, Office
