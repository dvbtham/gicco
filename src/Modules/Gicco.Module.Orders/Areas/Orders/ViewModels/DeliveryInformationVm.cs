using Gicco.Module.Core.Areas.Core.ViewModels;
using System.Collections.Generic;

namespace Gicco.Module.Orders.ViewModels
{
    public class DeliveryInformationVm
    {
        public DeliveryInformationVm()
        {
            NewAddressForm = new AddressFormVm();
        }

        public IList<ShippingAddressVm> ExistingShippingAddresses { get; set; } =
            new List<ShippingAddressVm>();

        public long ShippingAddressId { get; set; }

        public string ShippingMethod { get; set; }

        public IList<KeyValuePairVm<string>> ShippingMethods { get; set; } =
            new List<KeyValuePairVm<string>>
            {
                new KeyValuePairVm<string>
                {
                    Key = "Free",
                    Value = "Free"
                },
                new KeyValuePairVm<string>
                {
                    Key = "Standard",
                    Value = "Standard"
                },

            };

        public AddressFormVm NewAddressForm { get; set; }
    }
}
