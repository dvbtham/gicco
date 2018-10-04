using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Data;
using Gicco.Module.Cms.Models;

namespace Gicco.Module.Cms.Controllers
{
    [Area("Cms")]
    public class PageController : Controller
    {
        private readonly IRepository<Page> _pageRepository;

        public PageController(IRepository<Page> pageRepository)
        {
            _pageRepository = pageRepository;
        }

        [HttpGet]
        public IActionResult PageDetail(long id)
        {
            var page = _pageRepository.Query().FirstOrDefault(x => x.Id == id);

            return View(page);
        }
    }
}
