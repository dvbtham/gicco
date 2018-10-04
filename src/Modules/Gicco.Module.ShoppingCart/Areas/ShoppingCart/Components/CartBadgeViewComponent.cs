using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Web;
using Gicco.Module.Core.Extensions;
using Gicco.Module.ShoppingCart.Services;

namespace Gicco.Module.ShoppingCart.Components
{
    public class CartBadgeViewComponent : ViewComponent
    {
        private ICartService _cartService;
        private IWorkContext _workContext;

        public CartBadgeViewComponent(ICartService cartService, IWorkContext workContext)
        {
            _cartService = cartService;
            _workContext = workContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var currentUser = await _workContext.GetCurrentUser();
            var cart = await _cartService.GetCart(currentUser.Id);
            
            return View(this.GetViewPath(), cart.Items.Count);
        }
    }
}
