<#
Sync a Windows folder to S3 using AWS CLI.

Prerequisites:
- AWS CLI installed
- Auth configured through SSO, role, profile, or environment
- S3 bucket already created
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,

    [Parameter(Mandatory=$true)]
    [string]$BucketName,

    [string]$Prefix = "file-server-backup"
)

if (-not (Test-Path $SourcePath)) {
    throw "Source path does not exist: $SourcePath"
}

$DatePrefix = Get-Date -Format "yyyy-MM-dd"
$Target = "s3://$BucketName/$Prefix/$DatePrefix/"

Write-Host "Syncing $SourcePath to $Target"
aws s3 sync $SourcePath $Target --only-show-errors

Write-Host "Backup sync completed."
