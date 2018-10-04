using System.Threading.Tasks;
using Newtonsoft.Json;
using Gicco.Module.ShippingPrices.Services;
using Gicco.Module.ShippingFree.Models;
using Gicco.Module.Shipping.Models;

namespace Gicco.Module.ShippingFree.Services
{
    public class FreeShippingServiceProvider : IShippingPriceServiceProvider
    {
        public Task<GetShippingPriceResponse> GetShippingPrices(GetShippingPriceRequest request, ShippingProvider provider)
        {
            var response = new GetShippingPriceResponse { IsSuccess = true };

            var freeShippingSetting = JsonConvert.DeserializeObject<FreeShippingSetting>(provider.AdditionalSettings);

            if (request.OrderAmount < freeShippingSetting.MinimumOrderAmount)
            {
                return Task.FromResult(response);
            }

            response.ApplicablePrices.Add(new ShippingPrice
            {
                Name = "Free",
                Price = 0
            });

            return Task.FromResult(response);
        }
    }
}
