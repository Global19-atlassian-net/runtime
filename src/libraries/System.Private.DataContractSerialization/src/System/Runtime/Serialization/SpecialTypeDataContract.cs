// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System.Xml;

namespace System.Runtime.Serialization
{
    internal sealed class SpecialTypeDataContract : DataContract
    {
        private readonly SpecialTypeDataContractCriticalHelper _helper;

        public SpecialTypeDataContract(Type type, XmlDictionaryString name, XmlDictionaryString ns) : base(new SpecialTypeDataContractCriticalHelper(type, name, ns))
        {
            _helper = base.Helper as SpecialTypeDataContractCriticalHelper;
        }

        public override bool IsBuiltInDataContract => true;

        private class SpecialTypeDataContractCriticalHelper : DataContract.DataContractCriticalHelper
        {
            internal SpecialTypeDataContractCriticalHelper(Type type, XmlDictionaryString name, XmlDictionaryString ns) : base(type)
            {
                SetDataContractName(name, ns);
            }
        }
    }
}
