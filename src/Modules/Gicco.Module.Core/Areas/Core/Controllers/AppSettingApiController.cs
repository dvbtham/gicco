﻿using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Web;
using Gicco.Module.Core.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.Core.Controllers
{
    [Area("Core")]
    [Authorize(Roles = "admin")]
    [Route("api/appsettings")]
    public class AppSettingApiController : Controller
    {
        private readonly IRepositoryWithTypedId<AppSetting, string> _appSettingRepository;
        private readonly IConfigurationRoot _configurationRoot;

        public AppSettingApiController(IRepositoryWithTypedId<AppSetting, string> appSettingRepository, IConfiguration configuration)
        {
            _appSettingRepository = appSettingRepository;
            _configurationRoot = (IConfigurationRoot)configuration;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var settings = await _appSettingRepository.Query()
                .Where(x => x.IsVisibleInCommonSettingPage)
                .ToListAsync();

            return Json(settings);
        }

        [HttpPut]
        public async Task<IActionResult> Put([FromBody] IList<AppSetting> model)
        {
            if (ModelState.IsValid)
            {
                var settings = await _appSettingRepository.Query().Where(x => x.IsVisibleInCommonSettingPage).ToListAsync();
                foreach (var item in settings)
                {
                    var vm = model.FirstOrDefault(x => x.Id == item.Id);
                    if (vm != null)
                    {
                        item.Value = vm.Value;
                    }
                }

                await _appSettingRepository.SaveChangesAsync();
                _configurationRoot.Reload();

                return Accepted();
            }

            return BadRequest(ModelState);
        }
    }
}
