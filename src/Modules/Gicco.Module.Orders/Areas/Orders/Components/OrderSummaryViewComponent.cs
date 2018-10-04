using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Web;
using Gicco.Module.Core.Extensions;
using Gicco.Module.ShoppingCart.Services;

namespace Gicco.Module.Orders.Components
{
    public class OrderSummaryViewComponent : ViewComponent
    {
        private readonly ICartService _cartService;
        private readonly IWorkContext _workContext;

        public OrderSummaryViewComponent(ICartService cartService, IWorkContext workContext)
        {
            _cartService = cartService;
            _workContext = workContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var curentUser = await _workContext.GetCurrentUser();
            var cart = await _cartService.GetCart(curentUser.Id);

            return View(this.GetViewPath(), cart);
        }
    }
}
