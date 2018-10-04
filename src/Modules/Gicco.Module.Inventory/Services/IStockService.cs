using Gicco.Module.Inventory.Models;
using System.Threading.Tasks;

namespace Gicco.Module.Inventory.Services
{
    public interface IStockService
    {
        Task AddAllProduct(Warehouse warehouse);

        Task UpdateStock(StockUpdateRequest stockUpdateRequest);
    }
}
