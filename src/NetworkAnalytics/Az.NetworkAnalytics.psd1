@{
  GUID = '8c377fcd-c415-4ea5-bee0-e6b59ea922fd'
  RootModule = './Az.NetworkAnalytics.psm1'
  ModuleVersion = '0.1.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: NetworkAnalytics cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.NetworkAnalytics.private.dll'
  FormatsToProcess = './Az.NetworkAnalytics.format.ps1xml'
  FunctionsToExport = 'Add-AzNetworkAnalyticsDataProductUserRole', 'Get-AzNetworkAnalyticsDataProduct', 'Get-AzNetworkAnalyticsDataProductRoleAssignment', 'New-AzNetworkAnalyticsDataProduct', 'New-AzNetworkAnalyticsDataProductStorageAccountSasToken', 'Remove-AzNetworkAnalyticsDataProduct', 'Remove-AzNetworkAnalyticsDataProductUserRole', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'NetworkAnalytics'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
