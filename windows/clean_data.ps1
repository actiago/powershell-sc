<#
.SYNOPSIS
    Remove não utilizados no Windows

.DESCRIPTION
    Realiza a limpeza da lixeira e Downloads

.NOTES
    Name: clean_data.ps1
    Version: 0.1.0
    Author: Tiago Amaral | github.com/actiago
    Creation Date: 
    Last Edit Date:

#>

$DATE = Get-Date -Format hh_mm_dd_MM_yyyy
$DownloadLogFile = ""
$RecycleBinLogFile = ""

# Lista arquivos do diretorio Downloads de cada usuario do Windows
$GetDownloadData = Get-ChildItem -Path 'C\Users' | foreach {
Get-ChildItem -Path "$($_.FullName)\Downloads" -ErrorAction Ignore
}

# Lista arquivos temporários
$GetTempData = Get-ChildItem -Path 'C\Users' | foreach {
    Get-ChildItem -Path "$($_.FullName)\AppData\Local\Temp" -ErrorAction Ignore
}

# Lista arquivos na lixeira
$GetReclycleBin = Get-ChildItem -Path 'C:\$Recycle.Bin' -Force

# Gerando logs
$DownloadLogPath = $DownloadLogFile + "_" + $DATE + ".log"
$RecycleBinLogPath = $RecycleBinLogFile + "_" + $DATE + ".log"
Write-Output $GetDownloadData | Out-File $DownloadLogPath -Encoding utf8 -Append
Write-Output $GetReclycleBin | Out-File $RecycleBinLogPath -Encoding utf8 -Append

# Remove os arquivos de Downloads
$GetDownloadData | Remove-Item -Recurse -Force

# Remove os arquivos contidos na lixeira
$GetReclycleBin | Remove-Item -Recurse -Force
