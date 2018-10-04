using System.Threading.Tasks;
using Gicco.Module.Shipping.Models;

namespace Gicco.Module.ShippingPrices.Services
{
    public interface IShippingPriceServiceProvider
    {
        Task<GetShippingPriceResponse> GetShippingPrices(GetShippingPriceRequest request, ShippingProvider provider);
    }
}
