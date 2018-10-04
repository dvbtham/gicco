using System;
using System.Collections.Generic;
using Gicco.Module.Orders.Models;

namespace Gicco.Module.Orders.ViewModels
{
    public class OrderHistoryListItem
    {
        public long Id { get; set; }

        public DateTimeOffset CreatedOn { get; set; }

        public decimal SubTotal { get; set; }

        public OrderStatus OrderStatus { get; set; }

        public IList<OrderHistoryProductVm> OrderItems { get; set; } = new List<OrderHistoryProductVm>();
    }
}
