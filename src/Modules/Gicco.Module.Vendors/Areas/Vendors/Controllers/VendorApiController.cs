﻿using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Web.SmartTable;
using Gicco.Module.Core.Models;
using Gicco.Module.Vendors.Services;
using Gicco.Module.Vendors.ViewModels;

namespace Gicco.Module.Vendors.Controllers
{
    [Area("Vendors")]
    [Authorize(Roles = "admin")]
    [Route("api/vendors")]
    public class VendorApiController : Controller
    {
        private readonly IRepository<Vendor> _vendorRepository;
        private readonly IVendorService _vendorService;

        public VendorApiController(IRepository<Vendor> vendorRepository, IVendorService vendorService)
        {
            _vendorRepository = vendorRepository;
            _vendorService = vendorService;
        }

        [HttpPost("grid")]
        public ActionResult List([FromBody] SmartTableParam param)
        {
            var query = _vendorRepository.Query()
                .Where(x => !x.IsDeleted);

            if (param.Search.PredicateObject != null)
            {
                dynamic search = param.Search.PredicateObject;

                if (search.Email != null)
                {
                    string email = search.Email;
                    query = query.Where(x => x.Email.Contains(email));
                }

                if (search.CreatedOn != null)
                {
                    if (search.CreatedOn.before != null)
                    {
                        DateTimeOffset before = search.CreatedOn.before;
                        query = query.Where(x => x.CreatedOn <= before);
                    }

                    if (search.CreatedOn.after != null)
                    {
                        DateTimeOffset after = search.CreatedOn.after;
                        query = query.Where(x => x.CreatedOn >= after);
                    }
                }
            }

            var vendors = query.ToSmartTableResult(
                param,
                x => new
                {
                    Id = x.Id,
                    Name = x.Name,
                    Email = x.Email,
                    IsActive = x.IsActive,
                    Slug = x.Slug,
                    CreatedOn = x.CreatedOn
                });

            return Json(vendors);
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var vendors = await _vendorRepository.Query().Select(x => new
            {
                Id = x.Id,
                Name = x.Name,
                Slug = x.Slug
            }).ToListAsync();

            return Json(vendors);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(long id)
        {
            var vendor = await _vendorRepository.Query().Include(x => x.Users).FirstOrDefaultAsync(x => x.Id == id);
            if(vendor == null)
            {
                return NotFound();
            }

            var model = new VendorForm
            {
                Id = vendor.Id,
                Name = vendor.Name,
                Slug = vendor.Slug,
                Email = vendor.Email,
                Description = vendor.Description,
                IsActive = vendor.IsActive,
                Managers = vendor.Users.Select(x => new VendorManager { UserId = x.Id, Email = x.Email }).ToList()
            };

            return Json(model);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] VendorForm model)
        {
            if (ModelState.IsValid)
            {
                var vendor = new Vendor
                {
                    Name = model.Name,
                    Slug = model.Slug,
                    Email = model.Email,
                    Description = model.Description,
                    IsActive = model.IsActive
                };

                await _vendorService.Create(vendor);
                return CreatedAtAction(nameof(Get), new { id = vendor.Id }, null);
            }
            return BadRequest(ModelState);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(long id, [FromBody] VendorForm model)
        {
            if (ModelState.IsValid)
            {
                var vendor = _vendorRepository.Query().FirstOrDefault(x => x.Id == id);
                vendor.Name = model.Name;
                vendor.Slug = model.Slug;
                vendor.Email = model.Email;
                vendor.Description = model.Description;
                vendor.IsActive = model.IsActive;
                vendor.UpdatedOn = DateTimeOffset.Now;

                await _vendorService.Update(vendor);
                return Accepted();
            }

            return BadRequest(ModelState);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(long id)
        {
            var vendor = await _vendorRepository.Query().FirstOrDefaultAsync(x => x.Id == id);
            if (vendor == null)
            {
                return NotFound();
            }

            await _vendorService.Delete(vendor);
            return NoContent();
        }
    }
}
