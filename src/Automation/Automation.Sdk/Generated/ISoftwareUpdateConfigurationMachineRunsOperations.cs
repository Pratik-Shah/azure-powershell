// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.Automation
{
    using Microsoft.Rest.Azure;
    using Models;

    /// <summary>
    /// SoftwareUpdateConfigurationMachineRunsOperations operations.
    /// </summary>
    public partial interface ISoftwareUpdateConfigurationMachineRunsOperations
    {
        /// <summary>
        /// Get a single software update configuration machine run by Id.
        /// </summary>
        /// <remarks>
        /// Get a single software update configuration machine run by Id.
        /// </remarks>
        /// <param name='resourceGroupName'>
        /// Name of an Azure Resource group.
        /// </param>
        /// <param name='automationAccountName'>
        /// The name of the automation account.
        /// </param>
        /// <param name='softwareUpdateConfigurationMachineRunId'>
        /// The Id of the software update configuration machine run.
        /// </param>
        /// <param name='clientRequestId'>
        /// Identifies this specific client request.
        /// </param>
        /// <param name='customHeaders'>
        /// The headers that will be added to request.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        /// <exception cref="Microsoft.Rest.Azure.CloudException">
        /// Thrown when the operation returned an invalid status code
        /// </exception>
        /// <exception cref="Microsoft.Rest.SerializationException">
        /// Thrown when unable to deserialize the response
        /// </exception>
        System.Threading.Tasks.Task<Microsoft.Rest.Azure.AzureOperationResponse<SoftwareUpdateConfigurationMachineRun>> GetByIdWithHttpMessagesAsync(string resourceGroupName, string automationAccountName, System.Guid softwareUpdateConfigurationMachineRunId, string clientRequestId = default(string), System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>> customHeaders = null, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken));

        /// <summary>
        /// Return list of software update configuration machine runs
        /// </summary>
        /// <remarks>
        /// Return list of software update configuration machine runs
        /// </remarks>
        /// <param name='resourceGroupName'>
        /// Name of an Azure Resource group.
        /// </param>
        /// <param name='automationAccountName'>
        /// The name of the automation account.
        /// </param>
        /// <param name='clientRequestId'>
        /// Identifies this specific client request.
        /// </param>
        /// <param name='filter'>
        /// The filter to apply on the operation. You can use the following filters: &#39;properties/osType&#39;, &#39;properties/status&#39;, &#39;properties/startTime&#39;, and &#39;properties/softwareUpdateConfiguration/name&#39;
        /// </param>
        /// <param name='skip'>
        /// number of entries you skip before returning results
        /// </param>
        /// <param name='top'>
        /// Maximum number of entries returned in the results collection
        /// </param>
        /// <param name='customHeaders'>
        /// The headers that will be added to request.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        /// <exception cref="Microsoft.Rest.Azure.CloudException">
        /// Thrown when the operation returned an invalid status code
        /// </exception>
        /// <exception cref="Microsoft.Rest.SerializationException">
        /// Thrown when unable to deserialize the response
        /// </exception>
        System.Threading.Tasks.Task<Microsoft.Rest.Azure.AzureOperationResponse<SoftwareUpdateConfigurationMachineRunListResult>> ListWithHttpMessagesAsync(string resourceGroupName, string automationAccountName, string clientRequestId = default(string), string filter = default(string), string skip = default(string), string top = default(string), System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>> customHeaders = null, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken));

    }
}