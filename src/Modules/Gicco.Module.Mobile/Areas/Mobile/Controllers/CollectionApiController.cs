using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.Services;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Models;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/collection")]
    public class CollectionApiController : Controller
    {
        private readonly IMediaService _mediaService;
        private readonly IRepository<Category> _cateRepository;
        private readonly IRepository<WidgetInstance> _widgetInstanceRepository;
        private readonly IRepository<Product> _productRepository;
        private readonly IProductPricingService _productPricingService;

        public CollectionApiController(
            IRepository<Category> cateRepository,
            IRepository<WidgetInstance> widgetInstanceRepository,
            IRepository<Product> productRepository,
            IProductPricingService productPricingService,
            IMediaService mediaService)
        {
            _cateRepository = cateRepository;
            _mediaService = mediaService;
            _widgetInstanceRepository = widgetInstanceRepository;
            _productRepository = productRepository;
            _productPricingService = productPricingService;
        }

        [HttpGet]
        public IActionResult Collection()
        {
            var widgetInstances = _widgetInstanceRepository.Query()
                   .Where(x => x.WidgetId == WidgetIds.ProductWidget)
                   .OrderBy(x => x.DisplayOrder)
                   .Select(x => new
                   {
                       Id = x.Id,
                       WidgetName = x.Name,
                       Setting = JsonConvert.DeserializeObject<ProductWidgetSetting>(x.Data)
                   })
                   .ToList();

            var productWidgets = new List<ProductWidgetComponentVm>();

            foreach (var item in widgetInstances)
            {
                var model = new ProductWidgetComponentVm
                {
                    Id = item.Id,
                    WidgetName = item.WidgetName,
                    Setting = item.Setting
                };

                var query = _productRepository.Query()
                  .Where(x => x.IsPublished && x.IsVisibleIndividually);

                if (model.Setting.CategoryId.HasValue && model.Setting.CategoryId.Value > 0)
                {
                    query = query.Where(x => x.Categories.Any(c => c.CategoryId == model.Setting.CategoryId.Value));
                }

                if (model.Setting.FeaturedOnly)
                {
                    query = query.Where(x => x.IsFeatured);
                }

                model.Products = query
                  .Include(x => x.ThumbnailImage)
                  .OrderByDescending(x => x.CreatedOn)
                  .Take(model.Setting.NumberOfProducts)
                  .Select(x => ProductThumbnail.FromProduct(x)).ToList();

                foreach (var product in model.Products)
                {
                    product.ThumbnailUrl = _mediaService.GetThumbnailUrl(product.ThumbnailImage);
                    product.CalculatedProductPrice = _productPricingService.CalculateProductPrice(product);
                }

                productWidgets.Add(model);
            };
            return Json(productWidgets);
        }
    }
}
