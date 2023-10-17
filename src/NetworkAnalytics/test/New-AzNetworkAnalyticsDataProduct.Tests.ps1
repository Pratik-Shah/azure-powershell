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

    It 'Add Data Product User Role' {
        $job = Add-AzNetworkAnalyticsDataProductUserRole -ResourceGroupName $env.ResourceGroupName -DataProductName $env.DataProductName -PrincipalId $env.PrincipalId -Role $env.Role -RoleId $env.RoleId  -UserName $env.UserName -PrincipalType $env.PrincipalType  -DataTypeScope $env.DataTypeScope
        $job.PrincipalId | should -be $env.PrincipalId
    }

    It 'List Data Product User Role by Data Product' {
        $job = Get-AzNetworkAnalyticsDataProductRoleAssignment -ResourceGroupName $env.ResourceGroupName -DataProductName $env.DataProductName
        $job.Count | Should -BeGreaterOrEqual 0
    }

    It 'Remove Data Product User Role' {
        {
            Remove-AzNetworkAnalyticsDataProductUserRole -ResourceGroupName $env.ResourceGroupName -DataProductName $env.DataProductName -Role $env.Role -PrincipalType $env.PrincipalType -RoleId $env.RoleId -PrincipalId $env.PrincipalId -DataTypeScope $env.DataTypeScope -RoleAssignmentId confciftidz4 -UserName $env.UserName
        } | Should -Not -Throw
    }

    It 'Delete DataProduct' {
        {
            $job = Remove-AzNetworkAnalyticsDataProduct -ResourceGroupName $env.ResourceGroupName -Name $env.DataProductName -AsJob
            Wait-Job $job
            Receive-Job $job
        } | Should -Not -Throw
    }
}
