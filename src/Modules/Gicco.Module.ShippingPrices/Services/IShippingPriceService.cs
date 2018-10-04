using System.Collections.Generic;
using System.Threading.Tasks;

namespace Gicco.Module.ShippingPrices.Services
{
    public interface IShippingPriceService
    {
        Task<IList<ShippingPrice>> GetApplicableShippingPrices(GetShippingPriceRequest request);
    }
}
