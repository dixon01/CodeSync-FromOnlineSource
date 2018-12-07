﻿// --------------------------------------------------------------------------------------------------------------------
// <copyright file="ClientServerNodeFactory.cs" company="Gorba AG">
//   Copyright © 2011-2015 Gorba AG. All rights reserved.
// </copyright>
// <summary>
//   Node factory that creates one server and one client that are connected to each other.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace Gorba.Common.Medi.IntegrationTests.Tests.Resources
{
    using System.Collections.Generic;

    using Gorba.Common.Medi.Core;
    using Gorba.Common.Medi.Core.Config;
    using Gorba.Common.Medi.Core.Resources;
    using Gorba.Common.Medi.Core.Transcoder.Bec;
    using Gorba.Common.Medi.IntegrationTests.Tests.Streams;

    /// <summary>
    /// Node factory that creates one server and one client that are connected to each other.
    /// </summary>
    public class ClientServerNodeFactory : INodeFactory
    {
        /// <summary>
        /// Creates all nodes, the first and last node will be used to send messages to each other.
        /// </summary>
        /// <returns>
        /// The list of nodes.
        /// </returns>
        List<MediNode> INodeFactory.CreateNodes()
        {
            const int PipeId = 1;

            var clientConfig = new MediConfig
                                   {
                                       InterceptLocalLogs = false,
                                       Peers =
                                           {
                                               new ClientPeerConfig
                                                   {
                                                       Transport = new PipeTransportClientConfig
                                                                       {
                                                                           ServerId = PipeId,
                                                                           ReconnectWait = 500,
                                                                           IdleKeepAliveWait = -1
                                                                       },
                                                       Codec = new BecCodecConfig()
                                                   }
                                           },
                                       Services =
                                           {
                                               new LocalResourceServiceConfig
                                                   {
                                                       ResourceDirectory = @"V:\Client\Resources"
                                                   }
                                           }
                                   };

            var serverConfig = new MediConfig
                                   {
                                       InterceptLocalLogs = false,
                                       Peers =
                                           {
                                               new ServerPeerConfig
                                                   {
                                                       Transport = new PipeTransportServerConfig
                                                                       {
                                                                           ServerId = PipeId,
                                                                           SessionDisconnectTimeout = 8000
                                                                       },
                                                       Codec = new BecCodecConfig()
                                                   }
                                           },
                                       Services =
                                           {
                                               new LocalResourceServiceConfig
                                                   {
                                                       ResourceDirectory = @"V:\Server\Resources"
                                                   }
                                           }
                                   };

            var client = new MediNode(new MediAddress("UC", "Client"));
            client.Configure(clientConfig);

            var server = new MediNode(new MediAddress("US", "Server"));
            server.Configure(serverConfig);

            return new List<MediNode> { server, client };
        }
    }
}