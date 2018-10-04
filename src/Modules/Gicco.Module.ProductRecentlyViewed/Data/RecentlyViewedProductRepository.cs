using System.Linq;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Core.Data;
using Gicco.Module.ProductRecentlyViewed.Models;

namespace Gicco.Module.ProductRecentlyViewed.Data
{
    public class RecentlyViewedProductRepository: Repository<Product>, IRecentlyViewedProductRepository
    {
        private const long EntityViewedActivityTypeId = 1;
        private const long ProductEntityTypeId = 3;

        public RecentlyViewedProductRepository(GiccoDbContext context) : base(context)
        {
        }

        public IQueryable<Product> GetRecentlyViewedProduct(long userId)
        {
            return from product in DbSet
                join e in Context.Set<RecentlyViewedProduct>() on product.Id equals e.ProductId
                   where e.UserId == userId
                   orderby e.LatestViewedOn descending
                select product;
        }
    }
}
