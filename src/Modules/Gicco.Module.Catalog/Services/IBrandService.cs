using System.Threading.Tasks;
using Gicco.Module.Catalog.Models;

namespace Gicco.Module.Catalog.Services
{
    public interface IBrandService
    {
        Task Create(Brand brand);

        Task Update(Brand brand);

        Task Delete(long id);

        Task Delete(Brand brand);
    }
}
