using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/deals")]
    public class DealApiController : Controller
    {
        private readonly IMediaService _mediaService;
        private readonly IRepository<Category> _categoryRepository;
        private readonly IRepository<Product> _productRepository;

        public DealApiController(
            IRepository<Product> productRepository,
            IMediaService mediaService,
            IRepository<Category> categoryRepository)
        {
            _productRepository = productRepository;
            _mediaService = mediaService;
            _categoryRepository = categoryRepository;
        }

        [HttpGet("flashdeal")]
        public IActionResult FlashDeal(int numberOfProducts = 10)
        {
            var queryResult = _productRepository
                    .Query()
                    .Include(x => x.ThumbnailImage)
                    .Where(x => x.SpecialPriceStart.HasValue && x.SpecialPriceEnd.HasValue)
                    .Where(x => x.SpecialPriceEnd.Value > DateTimeOffset.Now)
                    .Select(x => new
                    {
                        Id = x.Id,
                        Name = x.Name,
                        OldPrice = x.OldPrice,
                        Price = x.Price,
                        SpecialPrice = x.SpecialPrice,
                        SpecialPriceStart = x.SpecialPriceStart,                        
                        SpecialPriceEnd = x.SpecialPriceEnd,
                        ThumbnailImageUrl = _mediaService.GetThumbnailUrl(x.ThumbnailImage)
                    })
                    .Take(numberOfProducts);
            return Json(queryResult);
        }
    }
}
