using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Helpers;
using Gicco.Infrastructure.Web;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.Services;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Services;
using Gicco.Module.Core.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.Catalog.Components
{
    public class ProductWidgetViewComponent : ViewComponent
    {
        private readonly IRepository<Product> _productRepository;
        private readonly IMediaService _mediaService;
        private readonly IProductPricingService _productPricingService;

        public ProductWidgetViewComponent(IRepository<Product> productRepository,
            IMediaService mediaService,
            IProductPricingService productPricingService)
        {
            _productRepository = productRepository;
            _mediaService = mediaService;
            _productPricingService = productPricingService;
        }

        public IViewComponentResult Invoke(WidgetInstanceViewModel widgetInstance)
        {
            var model = new ProductWidgetComponentVm
            {
                Id = widgetInstance.Id,
                WidgetName = widgetInstance.Name,
                Setting = JsonConvert.DeserializeObject<ProductWidgetSetting>(widgetInstance.Data)
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

            if (model.Setting.OrderBy == ProductWidgetOrderBy.Newest)
            {
                query = query.OrderByDescending(x => x.CreatedOn);
            }

            if (model.Setting.OrderBy == ProductWidgetOrderBy.Discount)
            {
                query = query.Where(x => x.SpecialPriceEnd.HasValue && x.SpecialPriceStart.HasValue)
                    .OrderByDescending(x => x.SpecialPriceStart);
            }

            if (!string.IsNullOrEmpty(model.Setting.Image))
            {
                model.Setting.ImageUrl = _mediaService.GetMediaUrl(model.Setting.Image);
            }
            
            model.Products = query
              .Include(x => x.ThumbnailImage)
              .Take(model.Setting.NumberOfProducts)
              .Select(x => ProductThumbnail.FromProduct(x))
              .ToList();

            foreach (var product in model.Products)
            {
                product.ThumbnailUrl = _mediaService.GetThumbnailUrl(product.ThumbnailImage);
                product.CalculatedProductPrice = _productPricingService.CalculateProductPrice(product);
            }
            return View(this.GetViewPath(), model);
        }
    }
}
