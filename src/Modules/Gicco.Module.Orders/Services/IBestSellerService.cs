using Gicco.Module.Catalog.ViewModels;
using System.Collections.Generic;

namespace Gicco.Module.Orders.Services
{
    public interface IBestSellerService
    {
        List<ProductSummary> BestSelling();
    }
}
