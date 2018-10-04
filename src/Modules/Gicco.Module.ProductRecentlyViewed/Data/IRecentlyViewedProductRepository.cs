using System.Linq;
using Gicco.Module.Catalog.Models;

namespace Gicco.Module.ProductRecentlyViewed.Data
{
    public interface IRecentlyViewedProductRepository
    {
        IQueryable<Product> GetRecentlyViewedProduct(long userId);
    }
}
