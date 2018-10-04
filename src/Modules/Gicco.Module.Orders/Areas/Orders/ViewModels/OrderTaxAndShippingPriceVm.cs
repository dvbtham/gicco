using System.Collections.Generic;
using Gicco.Module.ShippingPrices.Services;
using Gicco.Module.ShoppingCart.ViewModels;

namespace Gicco.Module.Orders.ViewModels
{
    public class OrderTaxAndShippingPriceVm
    {
        public bool IsProductPriceIncludedTax { get; set; }

        public IList<ShippingPrice> ShippingPrices { get; set; }

        public string SelectedShippingMethodName { get; set; }

        public CartVm Cart { get; set; }
    }
}
