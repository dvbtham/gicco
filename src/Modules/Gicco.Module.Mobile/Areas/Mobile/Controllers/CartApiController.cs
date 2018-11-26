using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Core.Services;
using Gicco.Module.ShoppingCart.Models;
using Gicco.Module.ShoppingCart.Services;
using Gicco.Module.ShoppingCart.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/cart")]
    public class CartApiController : Controller
    {
        private readonly IRepository<CartItem> _cartItemRepository;
        private readonly IMediaService _mediaService;
        private readonly IWorkContext _workContext;
        private readonly ICartService _cartService;

        public CartApiController(
            IRepository<CartItem> cartItemRepository,
            ICartService cartService,
            IMediaService mediaService,
            IWorkContext workContext)
        {
            _cartItemRepository = cartItemRepository;
            _mediaService = mediaService;
            _workContext = workContext;
            _cartService = cartService;
        }

        [HttpPost("addtocart")]
        public async Task<IActionResult> AddToCart([FromBody] AddToCartModel model)
        {
            var currentUser = await _workContext.GetCurrentUser();
            await _cartService.AddToCart(currentUser.Id, model.ProductId, model.Quantity);

            return Json(new { productId = model.ProductId });
        }

        [HttpGet("list")]
        public async Task<IActionResult> List()
        {
            var currentUser = await _workContext.GetCurrentUser();
            var cart = await _cartService.GetCart(currentUser.Id);

            return Json(cart);
        }

        [HttpPost("update-quantity")]
        public async Task<IActionResult> UpdateQuantity([FromBody] CartQuantityUpdate model)
        {
            var cartItem = _cartItemRepository.Query().FirstOrDefault(x => x.Id == model.CartItemId);
            if (cartItem == null)
            {
                return NotFound();
            }

            cartItem.Quantity = model.Quantity;
            _cartItemRepository.SaveChanges();

            return await List();
        }

        [HttpPost("apply-coupon")]
        public async Task<ActionResult> ApplyCoupon([FromBody] ApplyCouponForm model)
        {
            var currentUser = await _workContext.GetCurrentUser();
            var validationResult = await _cartService.ApplyCoupon(currentUser.Id, model.CouponCode);
            if (validationResult.Succeeded)
            {
                var cart = await _cartService.GetCart(currentUser.Id);
                return Json(cart);
            }

            return Json(validationResult);
        }

        [HttpPost("remove")]
        public async Task<IActionResult> Remove([FromBody] CartDeleteVm model)
        {
            var cartItem = _cartItemRepository.Query().FirstOrDefault(x => x.Id == model.ItemId);
            if (cartItem == null)
            {
                return NotFound();
            }

            _cartItemRepository.Remove(cartItem);
            _cartItemRepository.SaveChanges();

            return await List();
        }
    }
}
