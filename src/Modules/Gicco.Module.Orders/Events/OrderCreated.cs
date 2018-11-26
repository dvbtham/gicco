using Gicco.Module.Orders.Models;
using MediatR;

namespace Gicco.Module.Orders.Events
{
    public class OrderCreated : INotification
    {
        public long OrderId { get; set; }

        public Order Order { get; set; }

        public long UserId { get; set; }

        public string Note { get; set; }
    }
}
