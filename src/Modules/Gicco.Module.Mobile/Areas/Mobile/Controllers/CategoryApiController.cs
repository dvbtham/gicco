using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Models;
using Gicco.Module.Core.Services;
using Gicco.Module.Core.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/categories")]
    public class CategoryApiController : Controller
    {
        private readonly IMediaService _mediaService;
        private readonly IRepository<Category> _cateRepository;
        private readonly IRepository<WidgetInstance> _widgetInstanceRepository;

        public CategoryApiController(
            IRepository<Category> cateRepository,
            IRepository<WidgetInstance> widgetInstanceRepository,
            IMediaService mediaService)
        {
            _cateRepository = cateRepository;
            _mediaService = mediaService;
            _widgetInstanceRepository = widgetInstanceRepository;
        }

        [HttpGet("tree")]
        public IActionResult List()
        {
            var categories = _cateRepository.Query().Where(x => !x.IsDeleted && x.IncludeInMenu).ToList();

            var categoryMenuItems = new List<CategoryMenuItem>();

            var topCategories = categories.Where(x => !x.ParentId.HasValue).OrderByDescending(x => x.DisplayOrder);
            foreach (var category in topCategories)
            {
                var categoryMenuItem = Map(category);
                categoryMenuItems.Add(categoryMenuItem);
            }

            return Json(categoryMenuItems);
        }

        [HttpGet("group")]
        public IActionResult Categories()
        {
            var widgetInstances = _widgetInstanceRepository.Query()
                .Where(x => x.WidgetId == WidgetIds.CategoryWidget)
                .OrderBy(x => x.DisplayOrder)
                .Select(x => new 
                {
                    Id = x.Id,
                    WidgetName = x.Name,
                    Setting = JsonConvert.DeserializeObject<CategoryWidgetSettings>(x.Data)
                })
                .ToList();

            var categoryWidgets = new List<CategoryWidgetComponentVm>();

            foreach (var item in widgetInstances)
            {
                var category = _cateRepository.Query()
                     .Include(c => c.ThumbnailImage)
                     .FirstOrDefault(c => c.Id == item.Setting.CategoryId);

                var model = new CategoryWidgetComponentVm()
                {
                    Id = item.Id,
                    WidgetName = item.WidgetName,
                    Category = new CategoryThumbnail()
                    {
                        Id = category.Id,
                        Description = category.Description,
                        Name = category.Name,
                        Slug = category.Slug,
                        ThumbnailImage = category.ThumbnailImage,
                        ThumbnailUrl = _mediaService.GetThumbnailUrl(category.ThumbnailImage)
                    }
                };
                categoryWidgets.Add(model);
            }
           
            return Json(categoryWidgets);
        }

        [HttpGet]
        public IActionResult SimpleList()
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

        private CategoryMenuItem Map(Category category)
        {
            var categoryMenuItem = new CategoryMenuItem
            {
                Id = category.Id,
                Name = category.Name,
                Slug = category.Slug
            };

            var childCategories = category.Children;
            foreach (var childCategory in childCategories.OrderByDescending(x => x.DisplayOrder))
            {
                var childCategoryMenuItem = Map(childCategory);
                categoryMenuItem.AddChildItem(childCategoryMenuItem);
            }

            return categoryMenuItem;
        }
    }
}
