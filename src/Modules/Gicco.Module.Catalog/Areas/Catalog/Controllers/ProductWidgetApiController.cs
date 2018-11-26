using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Helpers;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Models;
using Gicco.Module.Core.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Net.Http.Headers;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.Catalog.Controllers
{
    [Area("Catalog")]
    [Authorize(Roles = "admin")]
    [Route("api/product-widgets")]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class ProductWidgetApiController : Controller
    {
        private readonly IRepository<WidgetInstance> _widgetInstanceRepository;
        private readonly IMediaService _mediaService;

        public ProductWidgetApiController(IRepository<WidgetInstance> widgetInstanceRepository,
            IMediaService mediaService)
        {
            _widgetInstanceRepository = widgetInstanceRepository;
            _mediaService = mediaService;
        }

        [HttpGet("{id}")]
        public IActionResult Get(long id)
        {
            var widgetInstance = _widgetInstanceRepository.Query().FirstOrDefault(x => x.Id == id);
            var model = new ProductWidgetForm
            {
                Id = widgetInstance.Id,
                Name = widgetInstance.Name,
                WidgetZoneId = widgetInstance.WidgetZoneId,
                PublishStart = widgetInstance.PublishStart,
                PublishEnd = widgetInstance.PublishEnd,
                DisplayOrder = widgetInstance.DisplayOrder,
                Setting = JsonConvert.DeserializeObject<ProductWidgetSetting>(widgetInstance.Data)
            };

            model.Setting.ImageUrl = _mediaService.GetMediaUrl(model.Setting.Image);

            var enumMetaData = MetadataProvider.GetMetadataForType(typeof(ProductWidgetOrderBy));
            return Json(model);
        }

        [HttpPost]
        public async Task<IActionResult> Post(IFormCollection formCollection)
        {
            var model = ToProductWidgetFormModel(formCollection);

            if (ModelState.IsValid)
            {
                if (model.Setting.UploadImage != null)
                    model.Setting.Image = await SaveFile(model.Setting.UploadImage);

                var widgetInstance = new WidgetInstance
                {
                    Name = model.Name,
                    WidgetId = "ProductWidget",
                    WidgetZoneId = model.WidgetZoneId,
                    PublishStart = model.PublishStart,
                    PublishEnd = model.PublishEnd,
                    DisplayOrder = model.DisplayOrder,
                    Data = JsonConvert.SerializeObject(model.Setting)
                };

                _widgetInstanceRepository.Add(widgetInstance);
                _widgetInstanceRepository.SaveChanges();
                return CreatedAtAction(nameof(Get), new { id = widgetInstance.Id }, null);
            }

            return BadRequest(ModelState);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(long id, IFormCollection formCollection)
        {
            var model = ToProductWidgetFormModel(formCollection);

            if (model.Setting.UploadImage != null)
            {
                if (!string.IsNullOrWhiteSpace(model.Setting.Image))
                {
                    await _mediaService.DeleteMediaAsync(model.Setting.Image);
                }
                model.Setting.Image = await SaveFile(model.Setting.UploadImage);
            }

            if (ModelState.IsValid)
            {
                var widgetInstance = _widgetInstanceRepository.Query().FirstOrDefault(x => x.Id == id);
                widgetInstance.Name = model.Name;
                widgetInstance.WidgetZoneId = model.WidgetZoneId;
                widgetInstance.PublishStart = model.PublishStart;
                widgetInstance.PublishEnd = model.PublishEnd;
                widgetInstance.DisplayOrder = model.DisplayOrder;
                widgetInstance.Data = JsonConvert.SerializeObject(model.Setting);

                _widgetInstanceRepository.SaveChanges();
                return Accepted();
            }

            return BadRequest(ModelState);
        }

        [HttpGet("available-orderby")]
        public IActionResult GetAvailableOrderBy()
        {
            var model = EnumHelper.ToDictionary(typeof(ProductWidgetOrderBy)).Select(x => new { Id = x.Key.ToString(), Name = x.Value });
            return Json(model);
        }

        private ProductWidgetForm ToProductWidgetFormModel(IFormCollection formCollection)
        {
            var model = new ProductWidgetForm
            {
                Name = formCollection["name"],
                WidgetZoneId = int.Parse(formCollection["widgetZoneId"]),
                Setting = new ProductWidgetSetting()
            };

            int.TryParse(formCollection["displayOrder"], out int displayOrder);
            model.DisplayOrder = displayOrder;

            if (DateTimeOffset.TryParse(formCollection["publishStart"], out DateTimeOffset publishStart))
            {
                model.PublishStart = publishStart;
            }

            if (DateTimeOffset.TryParse(formCollection["publishEnd"], out DateTimeOffset publishEnd))
            {
                model.PublishEnd = publishEnd;
            }

            int numberOfProducts = int.Parse(formCollection["setting[numberOfProducts]"]);

            model.Setting.NumberOfProducts = numberOfProducts;
            model.Setting.Image = formCollection["setting[image]"];
            model.Setting.UploadImage = formCollection.Files["setting[uploadImage]"];

            return model;
        }

        private async Task<string> SaveFile(IFormFile file)
        {
            var originalFileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Value.Trim('"');
            var fileName = $"{Guid.NewGuid()}{Path.GetExtension(originalFileName)}";
            await _mediaService.SaveMediaAsync(file.OpenReadStream(), fileName, file.ContentType);
            return fileName;
        }
    }
}
