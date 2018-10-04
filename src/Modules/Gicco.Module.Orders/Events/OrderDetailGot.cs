using MediatR;
using Gicco.Module.Orders.ViewModels;

namespace Gicco.Module.Orders.Events
{
    public class OrderDetailGot : INotification
    {
        public OrderDetailVm OrderDetailVm { get; set; }
    }
}
