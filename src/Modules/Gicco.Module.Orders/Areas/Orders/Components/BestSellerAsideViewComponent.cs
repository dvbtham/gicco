using Gicco.Infrastructure.Web;
using Gicco.Module.Orders.Services;
using Microsoft.AspNetCore.Mvc;

namespace Gicco.Module.Catalog.Areas.Catalog.Components
{
    public class BestSellerAsideViewComponent : ViewComponent
    {
        private readonly IBestSellerService _bestSellerService;

        public BestSellerAsideViewComponent(IBestSellerService bestSellerService)
        {
            _bestSellerService = bestSellerService;
        }

        public IViewComponentResult Invoke()
        {
            var query = _bestSellerService.BestSelling();
            return View(this.GetViewPath(), query);
        }
    }
}
