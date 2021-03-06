#This is just a quick and dirty script to demonstrate type projection traversal to get an email address for a given username

[CmdletBinding(DefaultParameterSetName="username")]
param ( [Parameter(ParameterSetName="username")]$username)

Import-Module SMLets -Force
$UserProjection = Get-SCSMTypeProjection -Name System.User.Preferences.Projection
$User = Get-SCSMObjectProjection -ProjectionObject $UserProjection -Filter "UserName -eq $UserName"
foreach ($Preference in $User.Preference){if($Preference.DisplayName -like "*SMTP"){$SMTPAddress = $Preference}}
Write-Host $SMTPAddress.TargetAddress