using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Gicco.Module.Core.Controllers
{
    [Area("Core")]
    [Authorize(Roles = "admin, vendor")]    
    public class DashboardController : Controller
    {
        [Route("admin/dashboard-tpl")]
        [HttpGet]
        public IActionResult HomeTemplate()
        {
            return View();
        }
    }
}
