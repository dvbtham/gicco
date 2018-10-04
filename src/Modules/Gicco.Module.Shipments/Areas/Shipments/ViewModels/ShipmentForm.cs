using System.Collections.Generic;
using Gicco.Module.Shipments.Services;

namespace Gicco.Module.Shipments.ViewModels
{
    public class ShipmentForm
    {
        public long OrderId { get; set; }

        public long WarehouseId { get; set; }

        public string TrackingNumber { get; set; }

        public IList<ShipmentItemVm> Items { get; set; } = new List<ShipmentItemVm>();
    }
}
