using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Gicco.Module.Mobile.Areas.Mobile.Controllers
{
    [Area("Mobile")]
    [Route("api/mobile/search")]
    public class SearchApiController : Controller
    {
        private readonly IRepository<Product> _productRepository;

        public SearchApiController(IRepository<Product> productRepository)
        {
            _productRepository = productRepository;
        }
        /// <summary>
        /// For search products
        /// </summary>
        /// <param name="query">query</param>
        /// <returns>List of searched products</returns>
        [HttpGet("all")]        
        public IActionResult GetAll(string query)
        {
            if (!string.IsNullOrEmpty(query))
            {
                var queryResult = _productRepository.Query()
                    .Where(x => x.Name.ToLower().Contains(query.ToLower()))
                    .ToList();

                return Json(queryResult);
            }
            return Json(_productRepository.Query().ToList());
        }
    }
}
