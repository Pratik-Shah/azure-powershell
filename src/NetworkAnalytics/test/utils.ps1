function RandomString([bool]$allChars, [int32]$len) {
    if ($allChars) {
        return -join ((33..126) | Get-Random -Count $len | % { [char]$_ })
    }
    else {
        return -join ((48..57) + (97..122) | Get-Random -Count $len | % { [char]$_ })
    }
}
$env = @{}
if ($UsePreviousConfigForRecord) {
    $previousEnv = Get-Content (Join-Path $PSScriptRoot 'env.json') | ConvertFrom-Json
    $previousEnv.psobject.properties | Foreach-Object { $env[$_.Name] = $_.Value }
}
# Add script method called AddWithCache to $env, when useCache is set true, it will try to get the value from the $env first.
# example: $val = $env.AddWithCache('key', $val, $true)
$env | Add-Member -Type ScriptMethod -Value { param( [string]$key, [object]$val, [bool]$useCache) if ($this.Contains($key) -and $useCache) { return $this[$key] } else { $this[$key] = $val; return $val } } -Name 'AddWithCache'
function setupEnv() {
    # Preload subscriptionId and tenant from context, which will be used in test
    # as default. You could change them if needed.
    $env.SubscriptionId = (Get-AzContext).Subscription.Id
    $env.Tenant = (Get-AzContext).Tenant.Id
    # For any resources you created for test, you should add it to $env here.
    $env.Add("DataProductName", "pwshdataproductinstance01")
    $env.Add("Product", "MCC")
    $env.Add("MajorVersion", "2.0.0")
    $env.Add("Publisher", "Microsoft")
    $env.Add("Location", "southcentralus")
    $env.Add("ResourceGroupName", "powershell-test")

    # Need to remove this     
    $env.Add("ManagedResourceGroupConfigurationLocation", $null)
    $env.Add("ManagedResourceGroupConfigurationName", $null)

    # Default Settings
    $env.Add("PurviewAccount", $null)
    $env.Add("PurviewCollection", $null)
    $env.Add("Redundancy", "Disabled")
    $env.Add("CurrentMinorVersion", "2.0.0")
    $env.Add("Tag", "")
    $env.Add("Owner", "")
    $env.Add("CustomerEncryptionKeyName", $null)
    $env.Add("CustomerEncryptionKeyVaultUri", $null)
    $env.Add("CustomerEncryptionKeyVersion", $null)
    $env.Add("CustomerManagedKeyEncryptionEnabled", "Disabled")

    $env.Add("PublicNetworkAccess", "Enabled")
    $env.Add("PrivateLinksEnabled", "Disabled")
    $env.Add("NetworkaclVirtualNetworkRule", "")
    $env.Add("NetworkaclIPRule", "")
    $env.Add("NetworkaclAllowedQueryIPRangeList", "")
    $env.Add("NetworkaclDefaultAction", "Allow")
    $env.Add("IdentityType", "")
    $env.Add("IdentityUserAssignedIdentity", "")

    $envFile = 'env.json'
    if ($TestMode -eq 'live') {
        $envFile = 'localEnv.json'
    }
    set-content -Path (Join-Path $PSScriptRoot $envFile) -Value (ConvertTo-Json $env)
}
function cleanupEnv() {
    # Clean resources you create for testing
}

