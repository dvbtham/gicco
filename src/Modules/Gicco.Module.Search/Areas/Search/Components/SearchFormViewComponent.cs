using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Web;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Search.ViewModels;

namespace Gicco.Module.Search.Components
{
    public class SearchFormViewComponent : ViewComponent
    {
        private IRepository<Category> _categoryRepository;

        public SearchFormViewComponent(IRepository<Category> categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        public IViewComponentResult Invoke()
        {
            var model = new SearchForm
            {
                AvailableCategories = _categoryRepository
                .Query()
                .Where(x => x.IsPublished && x.Parent == null)
                .Select(x => new SelectListItem
                {
                    Value = x.Slug,
                    Text = x.Name
                }).ToList(),

                Query = Request.Query["query"],
                Category = Request.Query["category"]
            };

            return View(this.GetViewPath(), model);
        }
    }
}
