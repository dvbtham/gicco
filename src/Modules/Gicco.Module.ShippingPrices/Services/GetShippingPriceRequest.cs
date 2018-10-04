using System.Collections.Generic;
using Gicco.Module.Core.Models;
using Gicco.Module.Shipping.Models;

namespace Gicco.Module.ShippingPrices.Services
{
    public class GetShippingPriceRequest
    {
        public Address ShippingAddress { get; set; }

        public Address WarehouseAddress { get; set; }

        public IList<ShippingItem> ShippingItem { get; set; } = new List<ShippingItem>();

        public decimal OrderAmount { get; set; }
    }
}
