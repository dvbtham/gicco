using System.Collections.Generic;
using System.Threading.Tasks;
using Gicco.Infrastructure;
using Gicco.Module.Shipments.Models;

namespace Gicco.Module.Shipments.Services
{
    public interface IShipmentService
    {
        Task<IList<ShipmentItemVm>> GetShipmentItem(long orderId);

        Task<IList<ShipmentItemVm>> GetItemToShip(long orderId, long warehouseId);

        Task<Result> CreateShipment(Shipment shipment);
    }
}
