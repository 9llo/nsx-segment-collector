# Prompt for vCenter, credentials, and Port Group name
$vcenter = Read-Host "Enter the vCenter address (FQDN or IP)"
$cred = Get-Credential
$pgName = Read-Host "Enter the name of the port group to search"

# Connect to vCenter
Connect-VIServer -Server $vcenter -Credential $cred

# Try to retrieve the specified port group
$dvpg = Get-VDPortgroup -Name $pgName -ErrorAction SilentlyContinue

if (-not $dvpg) {
    Write-Host "Port group '$pgName' not found." -ForegroundColor Red
    return
}

# Check if it's NSX-backed and display details
if ($dvpg.ExtensionData.Config.BackingType -eq "nsx") {
    Write-Host "`nNSX-backed Port Group Details:`n" -ForegroundColor Cyan
    Write-Host "Name:               $($dvpg.Name)"
    Write-Host "TransportZoneUuid:  $($dvpg.ExtensionData.Config.TransportZoneUuid)"
    Write-Host "TransportZoneName:  $($dvpg.ExtensionData.Config.TransportZoneName)"
    Write-Host "LogicalSwitchUuid:  $($dvpg.ExtensionData.Config.LogicalSwitchUuid)"
    Write-Host "SegmentId:          $($dvpg.ExtensionData.Config.SegmentId)"
    Write-Host "VNI:                $($dvpg.ExtensionData.Config.DefaultPortConfig.VNI.Value)"
}
else {
    Write-Host "The port group '$pgName' is not backed by NSX." -ForegroundColor Yellow
}

Disconnect-VIServer -Server $vcenter -Confirm:$false