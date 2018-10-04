using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Gicco.Module.Core.Controllers
{
    [Area("Core")]
    [Authorize(Roles = "admin, vendor")]
    public class HomeAdminController : Controller
    {
        [Route("admin")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
    }
}
