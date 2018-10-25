using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/categories")]
    public class CategoryApiController : Controller
    {
        private readonly IMediaService _mediaService;
        private readonly IRepository<Category> _cateRepository;

        public CategoryApiController(
            IRepository<Category> cateRepository,
            IMediaService mediaService)
        {
            _cateRepository = cateRepository;
            _mediaService = mediaService;
        }

        [HttpGet]
        public IActionResult List()
        {
            var query = _cateRepository.Query()
                .Where(x => !x.IsDeleted && x.IsPublished)
                .OrderBy(x => x.DisplayOrder)
                .Select(x => new { x.Id, x.Name })
                .ToList();

            return Json(query);
        }

        [HttpGet("{id}")]
        public IActionResult Get(long id)
        {
            var query = _cateRepository.Query()
                .Where(x => !x.IsDeleted && x.IsPublished)
                .OrderBy(x => x.DisplayOrder)
                .Select(x => new { x.Id, x.Name, x.Description })
                .FirstOrDefault(x => x.Id == id);

            return Json(query);
        }
    }
}
