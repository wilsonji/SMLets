. ./Common.ps1
$InstanceCollection = @{}
$list = "Microsoft.Windows.Computer",
   "Microsoft.Windows.OperatingSystem",
   "Microsoft.Windows.Peripheral.LogicalDisk",
   "Microsoft.Windows.Peripheral.NetworkAdapter",
   "Microsoft.Windows.Peripheral.PhysicalDisk",
   "Microsoft.Windows.Peripheral.Processor",
   "System.ConfigItem",
   "System.FileAttachment",
   "System.Knowledge.Article",
   "System.User"
$list | %{ $InstanceCollection["$_"] = get-scsmobject "^${_}$" }
$missing = $list | ?{ ! $InstanceCollection["$_"] }
if ( $missing ) { write-host -for red "The following classes have no instances:" ; $missing | %{ write-host -for red "  $_" } }
throw "Cannot continue"
$projectionHash = @{ 
    __CLASS  = 'Microsoft.Windows.Computer'
    __OBJECT = @{
        ActiveDirectoryObjectSid        = $null
        ActiveDirectorySite             = $null
        AssetStatus                     = $null
        DisplayName                     = $null
        DNSName                         = $null
        DomainDnsName                   = $null
        ForestDnsName                   = $null
        IPAddress                       = $null
        IsVirtualMachine                = $null
        LastInventoryDate               = $null
        LogicalProcessors               = $null
        NetbiosComputerName             = $null
        NetbiosDomainName               = $null
        NetworkName                     = $null
        Notes                           = $null
        ObjectStatus                    = $null
        OffsetInMinuteFromGreenwichTime = $null
        OrganizationalUnit              = $null
        PrincipalName                   = $null
        }

    PhysicalComputer           = Get-RandomItemFromList $InstanceCollection['Microsoft.Windows.Computer']
    OperatingSystem            = Get-RandomItemFromList $InstanceCollection['Microsoft.Windows.OperatingSystem']
    NetworkAdapter             = Get-RandomItemFromList $InstanceCollection['Microsoft.Windows.Peripheral.NetworkAdapter']
    Processor                  = Get-RandomItemFromList $InstanceCollection['Microsoft.Windows.Peripheral.Processor']
    PhysicalDisk               = Get-RandomItemFromList $InstanceCollection['Microsoft.Windows.Peripheral.PhysicalDisk']
    LogicalDisk                = Get-RandomItemFromList $InstanceCollection['Microsoft.Windows.Peripheral.LogicalDisk']
    PrimaryUser                = Get-RandomItemFromList $InstanceCollection['System.User']
    Custodian                  = Get-RandomItemFromList $InstanceCollection['System.User']
    ImpactedWorkItem           = Get-RandomItemFromList $InstanceCollection['System.ConfigItem']
    RelatedWorkItem            = Get-RandomItemFromList $InstanceCollection['System.ConfigItem']
    FileAttachment             = Get-RandomItemFromList $InstanceCollection['System.FileAttachment']
    RelatedConfigItem          = Get-RandomItemFromList $InstanceCollection['System.ConfigItem']
    RelatedConfigItemSource    = Get-RandomItemFromList $InstanceCollection['System.ConfigItem']
    RelatedKnowledgeArticles   = Get-RandomItemFromList $InstanceCollection['System.Knowledge.Article']
}

# $projection | new-scsmobjectprojection $projection $projectionHash
