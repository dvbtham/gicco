using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/search")]
    public class SearchApiController : Controller
    {
        private readonly IRepository<Product> _productRepository;
        private readonly IMediaService mediaService;

        public SearchApiController(IRepository<Product> productRepository, IMediaService mediaService)
        {
            _productRepository = productRepository;
            this.mediaService = mediaService;
        }
        /// <summary>
        /// For search products
        /// </summary>
        /// <param name="query">query</param>
        /// <returns>List of searched products</returns>
        [HttpGet("all")]
        public IActionResult GetAll(string query)
        {
            var queryResult = _productRepository.Query()
                    .Include(x => x.ThumbnailImage)
                    .Select(x => new 
                    {
                        Id = x.Id,
                        Name = x.Name,
                        Slug = x.Slug,
                        Sku = x.Sku,
                        Gtin = x.Gtin,
                        ShortDescription = x.ShortDescription,
                        Description = x.Description,
                        Specification = x.Specification,
                        OldPrice = x.OldPrice,
                        Price = x.Price,
                        SpecialPrice = x.SpecialPrice,
                        SpecialPriceStart = x.SpecialPriceStart,
                        SpecialPriceEnd = x.SpecialPriceEnd,
                        IsFeatured = x.IsFeatured,
                        IsPublished = x.IsPublished,
                        IsCallForPricing = x.IsCallForPricing,
                        IsAllowToOrder = x.IsAllowToOrder,
                        CategoryIds = x.Categories.Select(c => c.CategoryId).ToList(),
                        ThumbnailImageUrl = mediaService.GetThumbnailUrl(x.ThumbnailImage),
                        BrandId = x.BrandId,
                        TaxClassId = x.TaxClassId,
                        StockTrackingIsEnabled = x.StockTrackingIsEnabled
                    })
                    .ToList();

            if (!string.IsNullOrEmpty(query))

                queryResult = queryResult
                    .Where(x => x.Name.ToLower().Contains(query.ToLower()))
                    .ToList();

            return Json(queryResult);
        }
    }
}
