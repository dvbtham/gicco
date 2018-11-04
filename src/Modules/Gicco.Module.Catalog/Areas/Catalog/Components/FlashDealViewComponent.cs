using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Web;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.Services;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace Gicco.Module.Catalog.Areas.Catalog.Components
{
    public class FlashDealViewComponent : ViewComponent
    {
        private readonly IRepository<Product> _productRepository;
        private readonly IMediaService _mediaService;
        private readonly IProductPricingService _productPricingService;

        public FlashDealViewComponent(IRepository<Product> productRepository, IMediaService mediaService, IProductPricingService productPricingService)
        {
            _productRepository = productRepository;
            _mediaService = mediaService;
            _productPricingService = productPricingService;
        }

        public IViewComponentResult Invoke()
        {
            var products = _productRepository.Query()
                .Include(x => x.ThumbnailImage)
                .Where(x => x.IsPublished && x.IsVisibleIndividually)
                .Where(x => x.SpecialPriceStart.HasValue && x.SpecialPriceEnd.HasValue)
                .Where(x => x.SpecialPriceEnd.Value > DateTimeOffset.Now)
                .OrderByDescending(x => x.CreatedOn)              
                .Select(x => ProductThumbnail.FromProduct(x))
                .ToList();

            foreach (var product in products)
            {
                product.ThumbnailUrl = _mediaService.GetThumbnailUrl(product.ThumbnailImage);
                product.CalculatedProductPrice = _productPricingService.CalculateProductPrice(product);
            }

            return View(this.GetViewPath(), products);
        }
    }
}
