using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/products")]
    public class ProductApiController : Controller
    {
        private readonly IMediaService _mediaService;
        private readonly IRepository<Category> _categoryRepository;
        private readonly IRepository<Product> _productRepository;

        public ProductApiController(
            IRepository<Product> productRepository,
            IMediaService mediaService,
            IRepository<Category> categoryRepository)
        {
            _productRepository = productRepository;
            _mediaService = mediaService;
            _categoryRepository = categoryRepository;
        }

        [HttpGet("{id}")]
        public IActionResult Get(long id)
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
                        ThumbnailImageUrl = _mediaService.GetThumbnailUrl(x.ThumbnailImage),
                        BrandId = x.BrandId,
                        TaxClassId = x.TaxClassId,
                        StockTrackingIsEnabled = x.StockTrackingIsEnabled
                    })
                     .FirstOrDefault(x => x.Id == id);

            return Json(queryResult);
        }

        [HttpGet("cate/{id}")]
        public IActionResult GetByCategory(long id)
        {
            var category = _categoryRepository.Query().FirstOrDefault(x => x.Id == id);

            if (category == null)
            {
                return Json("Category cannot be found");
            }

            var query = _productRepository
                .Query()
                .Include(x => x.Categories)
                .Where(x => x.Categories.Any(c => c.CategoryId == category.Id) && x.IsPublished && x.IsVisibleIndividually)
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
                    ThumbnailImageUrl = _mediaService.GetThumbnailUrl(x.ThumbnailImage),
                    BrandId = x.BrandId,
                    TaxClassId = x.TaxClassId,
                    StockTrackingIsEnabled = x.StockTrackingIsEnabled
                })
                .ToList();

            return Json(query);
        }
    }
}
