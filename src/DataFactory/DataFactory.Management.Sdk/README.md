# Overall
This directory contains management plane service clients of Az.DataFactory module.

## Run Generation
In this directory, run AutoRest:
```
autorest --reset
autorest --use:@microsoft.azure/autorest.csharp@2.3.90
autorest.cmd README.md --version=v2
```

### AutoRest Configuration
> see https://aka.ms/autorest
``` yaml
csharp: true
clear-output-folder: true
reflect-api-versions: true
openapi-type: arm
azure-arm: true
license-header: MICROSOFT_MIT_NO_VERSION
payload-flattening-threshold: 2
```

###
``` yaml
commit: 9ec0fcc278aa2128c4fbb2b8a1aa93432d72cce0
input-file:
  - https://github.com/Azure/azure-rest-api-specs/blob/$(commit)/specification/datafactory/resource-manager/Microsoft.DataFactory/stable/2018-06-01/datafactory.json

output-folder: Generated

namespace: Microsoft.Azure.Management.DataFactory
```