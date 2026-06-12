<# 
Basic Windows server inventory collection script.

Run as Administrator on a Windows server or workstation.
This does not upload data anywhere. It creates a local CSV report.
#>

$OutputPath = ".\server-inventory-output.csv"

$ComputerInfo = Get-ComputerInfo
$Disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
$IPConfig = Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -notlike "169.*"}

$Inventory = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    OSName = $ComputerInfo.OsName
    OSVersion = $ComputerInfo.OsVersion
    Manufacturer = $ComputerInfo.CsManufacturer
    Model = $ComputerInfo.CsModel
    TotalPhysicalMemoryGB = [math]::Round($ComputerInfo.CsTotalPhysicalMemory / 1GB, 2)
    IPv4Addresses = ($IPConfig.IPAddress -join ";")
    Disks = (($Disks | ForEach-Object { "$($_.DeviceID) FreeGB=$([math]::Round($_.FreeSpace/1GB,2)) SizeGB=$([math]::Round($_.Size/1GB,2))" }) -join " | ")
    CollectedAt = (Get-Date).ToString("s")
}

$Inventory | Export-Csv -Path $OutputPath -NoTypeInformation
Write-Host "Inventory written to $OutputPath"
