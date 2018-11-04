using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Orders.Services;
using Gicco.Module.PaymentCoD.Models;
using Gicco.Module.Payments.Models;
using Gicco.Module.ShoppingCart.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/cod-checkout")]
    public class CoDCheckoutMobileApiController : Controller
    {
        private readonly IOrderService _orderService;
        private readonly IWorkContext _workContext;
        private readonly ICartService _cartService;
        private readonly IRepositoryWithTypedId<PaymentProvider, string> _paymentProviderRepository;
        private Lazy<CoDSetting> _setting;

        public CoDCheckoutMobileApiController(
            ICartService cartService,
            IOrderService orderService,
            IRepositoryWithTypedId<PaymentProvider, string> paymentProviderRepository,
            IWorkContext workContext)
        {
            _paymentProviderRepository = paymentProviderRepository;
            _cartService = cartService;
            _orderService = orderService;
            _workContext = workContext;
            _setting = new Lazy<CoDSetting>(GetSetting());
        }

        [HttpPost]
        public async Task<IActionResult> CoDCheckout()
        {
            if (!await ValidateCoD())
                return new BadRequestObjectResult("Payment Method is not eligible for this order.");

            var currentUser = await _workContext.GetCurrentUser();
            var calculatedFee = await CalculateFee();
            var orderCreateResult = await _orderService.CreateOrder(currentUser, "CashOnDelivery", calculatedFee);

            if (!orderCreateResult.Success)
                return new BadRequestObjectResult(orderCreateResult.Error);

            return Ok();
        }

        private CoDSetting GetSetting()
        {
            var coDProvider = _paymentProviderRepository.Query().FirstOrDefault(x => x.Id == PaymentProviderHelper.CODProviderId);
            if (string.IsNullOrEmpty(coDProvider.AdditionalSettings))
            {
                return new CoDSetting();
            }

            var coDSetting = JsonConvert.DeserializeObject<CoDSetting>(coDProvider.AdditionalSettings);
            return coDSetting;
        }

        private async Task<bool> ValidateCoD()
        {
            var currentUser = await _workContext.GetCurrentUser();
            var cart = await _cartService.GetCart(currentUser.Id);
            if (_setting.Value.MinOrderValue.HasValue && _setting.Value.MinOrderValue.Value > cart.OrderTotal)
            {
                return false;
            }

            if (_setting.Value.MaxOrderValue.HasValue && _setting.Value.MaxOrderValue.Value < cart.OrderTotal)
            {
                return false;
            }

            return true;
        }

        private async Task<decimal> CalculateFee()
        {
            var currentUser = await _workContext.GetCurrentUser();
            var cart = await _cartService.GetCart(currentUser.Id);
            var percent = _setting.Value.PaymentFee;

            return (cart.OrderTotal / 100) * percent;
        }
    }
}
