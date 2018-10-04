using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Web;

namespace Gicco.Module.PaymentCoD.Components
{
    public class CoDLandingViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View(this.GetViewPath());
        }
    }
}
