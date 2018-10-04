using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Gicco.Infrastructure.Web;
using Gicco.Module.ProductRecentlyViewed.ViewModels;
using Gicco.Module.Core.Services;
using Gicco.Module.Core.ViewModels;

namespace Gicco.Module.ProductRecentlyViewed.Components
{
    public class RecentlyViewedWidgetViewComponent: ViewComponent
    {
        private IMediaService _mediaService;

        public RecentlyViewedWidgetViewComponent(IMediaService mediaService)
        {
            _mediaService = mediaService;
        }

        public IViewComponentResult Invoke(WidgetInstanceViewModel widgetInstance)
        {
            var model = new RecentlyViewedWidgetViewComponentVm
            {
                Id = widgetInstance.Id,
                ItemCount = JsonConvert.DeserializeObject<int>(widgetInstance.Data)
            };

            return View(this.GetViewPath(), model);
        }

    }
}
