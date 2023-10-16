if(($null -eq $TestName) -or ($TestName -contains 'New-AzNetworkAnalyticsDataProduct'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-AzNetworkAnalyticsDataProduct.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-AzNetworkAnalyticsDataProduct' {
    It 'Create DataProduct with minimum set of parameters' {
        {
            $job = New-AzNetworkAnalyticsDataProduct -Name $env.DataProductName -Product $env.Product -MajorVersion $env.MajorVersion -Publisher $env.Publisher -Location $env.Location -ResourceGroupName $env.ResourceGroupName -AsJob
            Wait-Job $job
            $result = Receive-Job $job
            $result.Name | Should -be $env.DataProductName
            $GetDataProduct = Get-AzNetworkAnalyticsDataProduct -ResourceGroupName $env.ResourceGroupName -Name $env.DataProductName
            $GetDataProduct.Name | should -be $env.DataProductName
        } | Should -Not -Throw
    }

    It 'List DataProduct for a Subscription' {
        $job = Get-AzNetworkAnalyticsDataProduct
        $job.Count | Should -BeGreaterOrEqual 0
    }

    It 'List DataProduct for a ResourceGroup' {
        $job = Get-AzNetworkAnalyticsDataProduct -ResourceGroupName $env.ResourceGroupName
        $job.Count | Should -BeGreaterOrEqual 0
    }

    It 'Get DataProduct by Name' {
        $job = Get-AzNetworkAnalyticsDataProduct -ResourceGroupName $env.ResourceGroupName -Name $env.DataProductName
        $job.Name | should -be $env.DataProductName
    }

    It 'Delete DataProduct' {
        {
            $job = Remove-AzNetworkAnalyticsDataProduct -ResourceGroupName $env.ResourceGroupName -Name $env.DataProductName -AsJob
            Wait-Job $job
            Receive-Job $job
        } | Should -Not -Throw
    }
}
