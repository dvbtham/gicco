using Gicco.Module.Catalog.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Gicco.Module.Catalog.Services
{
    public interface IProductService
    {
        void Create(Product product);

        void Update(Product product);

        Task Delete(Product product);

        Task<IList<Product>> BestSellerAsync();
    }
}
