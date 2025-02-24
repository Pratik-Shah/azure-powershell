// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.Sql.Models
{
    using System.Linq;

    /// <summary>
    /// The location capability.
    /// </summary>
    public partial class LocationCapabilities
    {
        /// <summary>
        /// Initializes a new instance of the LocationCapabilities class.
        /// </summary>
        public LocationCapabilities()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the LocationCapabilities class.
        /// </summary>

        /// <param name="name">The location name.
        /// </param>

        /// <param name="supportedServerVersions">The list of supported server versions.
        /// </param>

        /// <param name="supportedManagedInstanceVersions">The list of supported managed instance versions.
        /// </param>

        /// <param name="status">The status of the capability.
        /// Possible values include: 'Visible', 'Available', 'Default', 'Disabled'</param>

        /// <param name="reason">The reason for the capability not being available.
        /// </param>
        public LocationCapabilities(string name = default(string), System.Collections.Generic.IList<ServerVersionCapability> supportedServerVersions = default(System.Collections.Generic.IList<ServerVersionCapability>), System.Collections.Generic.IList<ManagedInstanceVersionCapability> supportedManagedInstanceVersions = default(System.Collections.Generic.IList<ManagedInstanceVersionCapability>), CapabilityStatus? status = default(CapabilityStatus?), string reason = default(string))

        {
            this.Name = name;
            this.SupportedServerVersions = supportedServerVersions;
            this.SupportedManagedInstanceVersions = supportedManagedInstanceVersions;
            this.Status = status;
            this.Reason = reason;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();


        /// <summary>
        /// Gets the location name.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "name")]
        public string Name {get; private set; }

        /// <summary>
        /// Gets the list of supported server versions.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "supportedServerVersions")]
        public System.Collections.Generic.IList<ServerVersionCapability> SupportedServerVersions {get; private set; }

        /// <summary>
        /// Gets the list of supported managed instance versions.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "supportedManagedInstanceVersions")]
        public System.Collections.Generic.IList<ManagedInstanceVersionCapability> SupportedManagedInstanceVersions {get; private set; }

        /// <summary>
        /// Gets the status of the capability. Possible values include: &#39;Visible&#39;, &#39;Available&#39;, &#39;Default&#39;, &#39;Disabled&#39;
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "status")]
        public CapabilityStatus? Status {get; private set; }

        /// <summary>
        /// Gets or sets the reason for the capability not being available.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "reason")]
        public string Reason {get; set; }
    }
}