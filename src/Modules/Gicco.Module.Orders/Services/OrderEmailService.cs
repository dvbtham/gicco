using System.Threading.Tasks;
using Gicco.Infrastructure.Web;
using Gicco.Module.Core.Models;
using Gicco.Module.Core.Services;
using Gicco.Module.Orders.Models;

namespace Gicco.Module.Orders.Services
{
    public class OrderEmailService : IOrderEmailService
    {
        private readonly IEmailSender _emailSender;
        private readonly IRazorViewRenderer _viewRender;
        public OrderEmailService(IEmailSender emailSender, IRazorViewRenderer viewRender)
        {
            _emailSender = emailSender;
            _viewRender = viewRender;
        }

        public async Task SendEmailToUser(User user, Order order)
        {
            var emailBody = await _viewRender.RenderViewToStringAsync("/Modules/Gicco.Module.Orders/Views/EmailTemplates/OrderEmailToCustomer.cshtml", order);
            var emailSubject = $"Order information #{order.Id}";
            await _emailSender.SendEmailAsync(user.Email, emailSubject, emailBody, true);
        }
    }
}
