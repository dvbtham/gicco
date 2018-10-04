﻿using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Core.Models;
using Gicco.Module.Orders.Services;
using Gicco.Module.Orders.ViewModels;
using Gicco.Module.ShippingPrices.Services;
using Gicco.Module.ShoppingCart.Models;
using Gicco.Module.ShoppingCart.Services;

namespace Gicco.Module.Orders.Controllers
{
    [Area("Orders")]
    [Authorize]
    [Route("checkout")]
    public class CheckoutController : Controller
    {
        private readonly IOrderService _orderService;
        private readonly IRepositoryWithTypedId<Country, string> _countryRepository;
        private readonly IRepository<StateOrProvince> _stateOrProvinceRepository;
        private readonly IRepository<UserAddress> _userAddressRepository;
        private readonly IShippingPriceService _shippingPriceService;
        private readonly ICartService _cartService;
        private readonly IWorkContext _workContext;
        private readonly IRepository<Cart> _cartRepository;

        public CheckoutController(
            IRepository<StateOrProvince> stateOrProvinceRepository,
            IRepositoryWithTypedId<Country, string> countryRepository,
            IRepository<UserAddress> userAddressRepository,
            IShippingPriceService shippingPriceService,
            IOrderService orderService,
            ICartService cartService,
            IWorkContext workContext,
            IRepository<Cart> cartRepository)
        {
            _stateOrProvinceRepository = stateOrProvinceRepository;
            _countryRepository = countryRepository;
            _userAddressRepository = userAddressRepository;
            _shippingPriceService = shippingPriceService;
            _orderService = orderService;
            _cartService = cartService;
            _workContext = workContext;
            _cartRepository = cartRepository;
        }

        [HttpGet("shipping")]
        public async Task<IActionResult> Shipping()
        {
            var model = new DeliveryInformationVm();

            var currentUser = await _workContext.GetCurrentUser();
            PopulateShippingForm(model, currentUser);

            return View(model);
        }

        [HttpPost("shipping")]
        public async Task<IActionResult> Shipping(DeliveryInformationVm model)
        {
            var currentUser = await _workContext.GetCurrentUser();
            // TODO Handle error messages
            if (!ModelState.IsValid && (model.ShippingAddressId == 0))
            {
                PopulateShippingForm(model, currentUser);
                return View(model);
            }

            var cart = await _cartRepository
               .Query()
               .Where(x => x.UserId == currentUser.Id && x.IsActive).FirstOrDefaultAsync();

            if (cart == null)
            {
                throw new ApplicationException($"Cart of user {currentUser.Id} cannot be found");
            }

            cart.ShippingData = JsonConvert.SerializeObject(model);
            await _cartRepository.SaveChangesAsync();
            return Redirect("~/checkout/payment");
        }

        [HttpPost("update-tax-and-shipping-prices")]
        public async Task<IActionResult> UpdateTaxAndShippingPrices([FromBody] TaxAndShippingPriceRequestVm model)
        {
            var currentUser = await _workContext.GetCurrentUser();
            Address address;
            if (model.ExistingShippingAddressId != 0)
            {
                address = await _userAddressRepository.Query().Where(x => x.Id == model.ExistingShippingAddressId).Select(x => x.Address).FirstOrDefaultAsync();
                if (address == null)
                {
                    return NotFound();
                }
            }
            else
            {
                address = new Address
                {
                    CountryId = model.NewShippingAddress.CountryId,
                    StateOrProvinceId = model.NewShippingAddress.StateOrProvinceId,
                    DistrictId = model.NewShippingAddress.DistrictId,
                    ZipCode = model.NewShippingAddress.ZipCode,
                    AddressLine1 = model.NewShippingAddress.AddressLine1,
                };
            }

            var orderTaxAndShippingPrice = new OrderTaxAndShippingPriceVm
            {
                Cart = await _cartService.GetCart(currentUser.Id)
            };

            var cart = await _cartRepository.Query().Where(x => x.Id == orderTaxAndShippingPrice.Cart.Id).FirstOrDefaultAsync();
            cart.TaxAmount = orderTaxAndShippingPrice.Cart.TaxAmount = await _orderService.GetTax(currentUser.Id, address.CountryId, address.StateOrProvinceId, address.ZipCode);

            var request = new GetShippingPriceRequest
            {
                OrderAmount = orderTaxAndShippingPrice.Cart.OrderTotal,
                ShippingAddress = address
            };

            orderTaxAndShippingPrice.ShippingPrices = await _shippingPriceService.GetApplicableShippingPrices(request);
            var selectedShippingMethod = string.IsNullOrWhiteSpace(model.SelectedShippingMethodName) 
                ? orderTaxAndShippingPrice.ShippingPrices.FirstOrDefault() 
                : orderTaxAndShippingPrice.ShippingPrices.FirstOrDefault(x => x.Name == model.SelectedShippingMethodName);
            if(selectedShippingMethod != null)
            {
                cart.ShippingAmount = orderTaxAndShippingPrice.Cart.ShippingAmount = selectedShippingMethod.Price;
                cart.ShippingMethod = orderTaxAndShippingPrice.SelectedShippingMethodName = selectedShippingMethod.Name;
            }

            await _cartRepository.SaveChangesAsync();
            return Ok(orderTaxAndShippingPrice);
        }

        [HttpGet("congratulation")]
        public IActionResult OrderConfirmation()
        {
            return View();
        }

        private void PopulateShippingForm(DeliveryInformationVm model, User currentUser)
        {
            model.ExistingShippingAddresses = _userAddressRepository
                .Query()
                .Where(x => (x.AddressType == AddressType.Shipping) && (x.UserId == currentUser.Id))
                .Select(x => new ShippingAddressVm
                {
                    UserAddressId = x.Id,
                    ContactName = x.Address.ContactName,
                    Phone = x.Address.Phone,
                    AddressLine1 = x.Address.AddressLine1,
                    AddressLine2 = x.Address.AddressLine1,
                    DistrictName = x.Address.District.Name,
                    StateOrProvinceName = x.Address.StateOrProvince.Name,
                    CountryName = x.Address.Country.Name,
                    IsCityEnabled = x.Address.Country.IsCityEnabled,
                    IsZipCodeEnabled = x.Address.Country.IsZipCodeEnabled,
                    IsDistrictEnabled = x.Address.Country.IsDistrictEnabled
                }).ToList();

            model.ShippingAddressId = currentUser.DefaultShippingAddressId ?? 0;

            model.NewAddressForm.ShipableContries = _countryRepository.Query()
                .Where(x => x.IsShippingEnabled)
                .OrderBy(x => x.Name)
                .Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                }).ToList();

            if (model.NewAddressForm.ShipableContries.Count == 1)
            {
                var onlyShipableCountryId = model.NewAddressForm.ShipableContries.First().Value;

                model.NewAddressForm.StateOrProvinces = _stateOrProvinceRepository
                .Query()
                .Where(x => x.CountryId == onlyShipableCountryId)
                .OrderBy(x => x.Name)
                .Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.Id.ToString()
                }).ToList();
            }
        }
    }
}
