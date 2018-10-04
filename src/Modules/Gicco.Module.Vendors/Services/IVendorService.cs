using System.Threading.Tasks;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Vendors.Services
{
    public interface IVendorService
    {
        Task Create(Vendor brand);

        Task Update(Vendor brand);

        Task Delete(long id);

        Task Delete(Vendor brand);
    }
}
