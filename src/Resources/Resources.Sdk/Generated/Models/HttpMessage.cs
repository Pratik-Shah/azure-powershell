// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Management.Resources.Models
{
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// HTTP message.
    /// </summary>
    public partial class HttpMessage
    {
        /// <summary>
        /// Initializes a new instance of the HttpMessage class.
        /// </summary>
        public HttpMessage()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the HttpMessage class.
        /// </summary>
        /// <param name="content">HTTP message content.</param>
        public HttpMessage(object content = default(object))
        {
            Content = content;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets HTTP message content.
        /// </summary>
        [JsonProperty(PropertyName = "content")]
        public object Content { get; set; }

    }
}
