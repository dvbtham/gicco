﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Core.Models;
using Gicco.Module.Core.Services;
using Gicco.Module.ProductComparison.Models;
using Gicco.Module.ProductComparison.Services;
using Gicco.Module.ProductComparison.ViewModels;
using Gicco.Module.Catalog.Services;

namespace Gicco.Module.ProductComparison.Controllers
{
    [Area("ProductComparison")]
    public class ComparingProductController : Controller
    {
        private readonly IRepository<ComparingProduct> _comparingProductRepository;
        private readonly IComparingProductService _comparingProductService;
        private readonly IProductPricingService _productPricingService;
        private readonly IMediaService _mediaService;
        private readonly IWorkContext _workContext;

        public ComparingProductController(
            UserManager<User> userManager,
            IRepository<ComparingProduct> comparingProductRepository,
            IComparingProductService comparingProductService,
            IProductPricingService productPricingService,
            IMediaService mediaService,
            IWorkContext workContext)
        {
            _comparingProductRepository = comparingProductRepository;
            _comparingProductService = comparingProductService;
            _productPricingService = productPricingService;
            _mediaService = mediaService;
            _workContext = workContext;
        }

        [HttpPost("comparing-product/addto-comparison")]
        public async Task<IActionResult> AddToComparison([FromBody] AddToComparisonModel model)
        {
            var currentUser = await _workContext.GetCurrentUser();
            var returnModel = new AddToComparisonResult();

            try
            {
                _comparingProductService.AddToComparison(currentUser.Id, model.ProductId);
                returnModel.Message = "The product has been added to comparison items";
            }
            catch (TooManyComparingProductException ex)
            {
                returnModel.Message = $"Can not add to comparison items. Can only comparison {ex.MaxNumComparingProduct} items";
            }

            var comparingProducts = _comparingProductRepository.Query()
                .Where(x => x.UserId == currentUser.Id)
                .Select(x => new ComparingProductVm()
                {
                    ProductName = x.Product.Name,
                    ProductImage = _mediaService.GetThumbnailUrl(x.Product.ThumbnailImage),
                    CalculatedProductPrice = _productPricingService.CalculateProductPrice(x.Product),
                    ProductId = x.ProductId
                }
                ).ToList();

            returnModel.ProductComparisons = comparingProducts;

            return PartialView("AddToComparisonResult", returnModel);
        }

        [HttpDelete("comparing-product/remove")]
        public async Task<IActionResult> Remove(long id)
        {
            var currentUser = await _workContext.GetCurrentUser();
            var productComparison = _comparingProductRepository.Query().FirstOrDefault(x => x.UserId == currentUser.Id && x.ProductId == id);

            if (productComparison == null)
            {
                return NotFound();
            }

            _comparingProductRepository.Remove(productComparison);
            _comparingProductRepository.SaveChanges();

            return Ok();
        }

        [HttpGet("compare-products")]
        public async Task<IActionResult> Index()
        {
            var currentUser = await _workContext.GetCurrentUser();
            var comparingProducts = _comparingProductRepository.Query()
                .Include(x => x.Product).ThenInclude(p => p.ThumbnailImage)
                .Include(x => x.Product).ThenInclude(p => p.AttributeValues).ThenInclude(a => a.Attribute)
                .Where(x => x.UserId == currentUser.Id).ToList();

            var allAttributes = new List<ProductAttribute>();
            foreach (var item in comparingProducts)
            {
                allAttributes.AddRange(item.Product.AttributeValues.Select(x => x.Attribute));
            }

            var model = new ProductComparisonVm();
            model.Attributes = allAttributes.Distinct().Select(x => new AttributeVm { AttributeId = x.Id, Name = x.Name }).ToList();
            model.Products = comparingProducts.Select(x => new ComparingProductVm
            {
                ProductName = x.Product.Name,
                ProductImage = _mediaService.GetThumbnailUrl(x.Product.ThumbnailImage),
                CalculatedProductPrice = _productPricingService.CalculateProductPrice(x.Product),
                ProductId = x.ProductId,
                AttributeValues = x.Product.AttributeValues.Select(a => new AttributeValueVm { AttributeId = a.AttributeId, Value = a.Value }).ToList()
            }).ToList();

            return View(model);
        }
    }
}
