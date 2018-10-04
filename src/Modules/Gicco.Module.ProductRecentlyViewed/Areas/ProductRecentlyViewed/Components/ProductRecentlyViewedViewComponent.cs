﻿using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Web;
using Gicco.Module.Catalog.Services;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Services;
using Gicco.Module.Core.Extensions;
using Gicco.Module.ProductRecentlyViewed.Data;
using Gicco.Module.Catalog.Models;

namespace Gicco.Module.ProductRecentlyViewed.Components
{
    public class ProductRecentlyViewedViewComponent : ViewComponent
    {
        private readonly IRecentlyViewedProductRepository _productRepository;
        private readonly IMediaService _mediaService;
        private readonly IProductPricingService _productPricingService;
        private readonly IWorkContext _workContext;

        public ProductRecentlyViewedViewComponent(IRecentlyViewedProductRepository productRepository, IMediaService mediaService, IProductPricingService productPricingService, IWorkContext workContext)
        {
            _productRepository = productRepository;
            _mediaService = mediaService;
            _productPricingService = productPricingService;
            _workContext = workContext;
        }

        // TODO Number of items to config
        public IViewComponentResult Invoke(long? productId, int itemCount = 5)
        {
            var user = _workContext.GetCurrentUser().Result;
            IQueryable<Product> query = _productRepository.GetRecentlyViewedProduct(user.Id)
                .Include(x => x.ThumbnailImage);
            if (productId.HasValue)
            {
                query = query.Where(x => x.Id != productId.Value);
            }
            
            var model = query.Take(itemCount)
                .Select(x => ProductThumbnail.FromProduct(x)).ToList();

            foreach (var product in model)
            {
                product.ThumbnailUrl = _mediaService.GetThumbnailUrl(product.ThumbnailImage);
                product.CalculatedProductPrice = _productPricingService.CalculateProductPrice(product);
            }

            return View(this.GetViewPath(), model);
        }
    }
}
