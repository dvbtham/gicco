using System.Threading.Tasks;
using Gicco.Module.Catalog.Models;

namespace Gicco.Module.Catalog.Services
{
    public interface IProductService
    {
        void Create(Product product);

        void Update(Product product);

        Task Delete(Product product);
    }
}
