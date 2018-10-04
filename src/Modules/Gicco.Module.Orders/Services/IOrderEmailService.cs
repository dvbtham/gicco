using System.Threading.Tasks;
using Gicco.Module.Core.Models;
using Gicco.Module.Orders.Models;

namespace Gicco.Module.Orders.Services
{
    public interface IOrderEmailService
    {
        Task SendEmailToUser(User user, Order order);
    }
}
