using Gicco.Infrastructure;
using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Localization;
using Gicco.Module.Localization.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Localization;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.Localization.Controllers
{
    [Area("Localization")]
    [Route("api/localization")]
    public class LocalizationApiController : Controller
    {
        private const string STANDARD_CULTURE_ID = "vi-VN";
        private readonly IStringLocalizer _localizer;
        private readonly IRepository<Resource> _resourceRepository;
        private readonly IRepositoryWithTypedId<Culture, string> _cultureRepository;

        public LocalizationApiController(IStringLocalizerFactory stringLocalizerFactory, IRepository<Resource> resourceRepository, IRepositoryWithTypedId<Culture, string> cultureRepository)
        {
            _localizer = stringLocalizerFactory.Create(null);
            _resourceRepository = resourceRepository;
            _cultureRepository = cultureRepository;
        }

        [HttpGet("get-translation")]
        public IActionResult GetTranslation()
        {
            var strings = _localizer.GetAllStrings().ToDictionary(x => x.Name, x => x.Value);
            return Json(strings);
        }

        [HttpGet("get-cultures")]
        public async Task<IActionResult> GetCultures()
        {
            var cultures = await _cultureRepository.Query().Where(x => x.Id != GlobalConfiguration.DefaultCulture).ToListAsync();
            return Ok(cultures);
        }

        [HttpGet("get-resources")]
        public async Task<IActionResult> GetResources(string cultureId, string query)
        {
            var resources = await _resourceRepository.Query()
                .Where(x => x.CultureId == cultureId)
                .Select(x => new ResourceItemVm
                {
                    Key = x.Key,
                    Value = x.Value,
                    CultureId = x.CultureId,
                    IsTranslated = true
                })
                .ToListAsync();

            if (!string.IsNullOrEmpty(query))
            {
                resources = resources
                    .Where(x => x.Value.ToLower().Contains(query.ToLower())
                        || x.Key.ToLower().Contains(query.ToLower()))
                    .ToList();
            }

            if (cultureId != STANDARD_CULTURE_ID)
            {
                var standardResources = await _resourceRepository.Query()
                .Where(x => x.CultureId == STANDARD_CULTURE_ID)
                .ToListAsync();

                if (!string.IsNullOrEmpty(query))
                {
                    standardResources = standardResources
                         .Where(x => x.Value.ToLower().Contains(query.ToLower())
                            || x.Key.ToLower().Contains(query.ToLower()))
                        .ToList();
                }

                foreach (var item in standardResources)
                {
                    if (resources.All(x => x.Key != item.Key))
                    {
                        resources.Add(new ResourceItemVm { Key = item.Key, CultureId = cultureId, Value = item.Value, IsTranslated = false });
                    }
                }
            }

            return Json(resources);
        }

        [HttpPost("update-resources")]
        [Authorize(Roles = "admin")]
        public async Task<IActionResult> UpdateResource(string cultureId, [FromBody] IList<ResourceItemVm> model)
        {
            var resources = await _resourceRepository.Query().Where(x => x.CultureId == cultureId).ToListAsync();

            foreach (var resourceItemForm in model)
            {
                var resource = resources.FirstOrDefault(x => x.Key == resourceItemForm.Key);

                if (resource != null)
                {
                    resource.Value = resourceItemForm.Value;
                }
                else if (resourceItemForm.Key != resourceItemForm.Value)
                {
                    _resourceRepository.Add(new Resource
                    {
                        CultureId = cultureId,
                        Key = resourceItemForm.Key,
                        Value = resourceItemForm.Value
                    });
                }
            }

            _resourceRepository.SaveChanges();
            return Accepted();
        }

        [HttpPost("create-resources")]
        [Authorize(Roles = "admin")]
        public async Task<IActionResult> CreateResource(string cultureId, [FromBody] ResourceItemVm model)
        {
            var resource = await _resourceRepository.Query()
            .FirstOrDefaultAsync(x => x.Key == model.Key);

            if (resource != null)
            {
                return BadRequest("This key has been added.");
            }
            else
            {
                _resourceRepository.Add(new Resource
                {
                    CultureId = cultureId,
                    Key = model.Key,
                    Value = model.Value
                });
            }

            _resourceRepository.SaveChanges();
            return Accepted();
        }

        [HttpPost("delete-resource")]
        [Authorize(Roles = "admin")]
        public async Task<IActionResult> DeleteResource(string cultureId, [FromBody] ResourceItemVm model)
        {
            Resource resource = null;
            resource = await _resourceRepository.Query()
            .FirstOrDefaultAsync(x => x.Key == model.Key);

            if (!string.IsNullOrEmpty(model.CultureId))
            {
                resource = await _resourceRepository.Query()
                            .FirstOrDefaultAsync(x => x.Key == model.Key && x.CultureId == model.CultureId);
            }

            if (resource == null)
                return NotFound("This key not found.");
            else
                _resourceRepository.Remove(resource);

            _resourceRepository.SaveChanges();
            return Accepted();
        }
    }
}
