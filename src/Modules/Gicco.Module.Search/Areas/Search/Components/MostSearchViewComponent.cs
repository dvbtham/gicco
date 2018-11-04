using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Web;
using Gicco.Module.Search.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Gicco.Module.Search.Components
{
    public class MostSearchViewComponent : ViewComponent
    {
        private readonly IRepository<Query> _queryRepository;

        public MostSearchViewComponent(IRepository<Query> queryRepository)
        {
            _queryRepository = queryRepository;
        }

        public IViewComponentResult Invoke()
        {
            var model = _queryRepository.Query()
                .GroupBy(x => x.QueryText)
                .OrderByDescending(g => g.Count())
                .Select(g => new Query { QueryText = g.Key })
                .Take(10)
                .ToList();

            return View(this.GetViewPath(), model);
        }
    }
}
