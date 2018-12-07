﻿namespace Luminator.PeripheralProtocol.Core.Interfaces
{
    using System.IO;

    using Luminator.PeripheralProtocol.Core.Models;
    using Luminator.PeripheralProtocol.Core.Types;

    public interface IPeripheralState
    {
        byte[] SerialBuffer { get; }
        int BufferSize { get; }

        byte[] MemoryStreamBytes { get; }
        bool IsPartialMessagesInStream { get; }
        long MemoryStreamPosition { get; }
        PeripheralMessageType LastMessageType { get; set; }
        PeripheralContext PeripheralContext { get; }
        bool Running { get; set; }
        long StreamLength { get; }

        long AppendStream(byte[] buffer);
        void EmptyStream();
        bool LockStream(int timeout = -1);
     
        void RemoveBytesFromStream(int bytesToRemove);
        void RewindStream();
        void UnLockStream();
        long WriteStream(byte[] buffer, int position = 0);
    }
}