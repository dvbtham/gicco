﻿using Gicco.Module.Inventory.Models;

namespace Gicco.Module.Inventory.Services
{
    public class StockUpdateRequest
    {
        public long UserId { get; set; }

        public long ProductId { get; set; }

        public long WarehouseId { get; set; }

        public int AdjustedQuantity { get; set; }

        public string Note { get; set; }
    }
}
