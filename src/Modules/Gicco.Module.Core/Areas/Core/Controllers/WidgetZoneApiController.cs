﻿using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Core.Controllers
{
    [Area("Core")]
    [Authorize(Roles = "admin")]
    [Route("api/widget-zones")]
    public class WidgetZoneApiController : Controller
    {
        private readonly IRepository<WidgetZone> _widgetZoneRespository;

        public WidgetZoneApiController(IRepository<WidgetZone> widgetZoneRespository)
        {
            _widgetZoneRespository = widgetZoneRespository;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var widgetZones = await _widgetZoneRespository.Query().Select(x => new
            {
                Id = x.Id,
                Name = x.Name,
                Description = x.Description
            }).ToListAsync();

            return Json(widgetZones);
        }
    }
}
