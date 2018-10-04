﻿using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Core.Controllers
{
    [Area("Core")]
    [Authorize(Roles = "admin")]
    [Route("api/entities")]
    public class EntityApiController : Controller
    {
        private IRepository<Entity> _entityRepository;

        public EntityApiController(IRepository<Entity> entityRepository)
        {
            _entityRepository = entityRepository;
        }

        [HttpGet]
        public IActionResult Get(string entityTypeId, string name)
        {
            var query = _entityRepository.Query().Where(x => x.EntityType.IsMenuable);
            if (!string.IsNullOrWhiteSpace(entityTypeId))
            {
                query = query.Where(x => x.EntityTypeId == entityTypeId);
            }

            if (!string.IsNullOrWhiteSpace(name))
            {
                query = query.Where(x => x.Name.Contains(name));
            }

            var entities = query.Select(x => new
            {
                Id = x.Id,
                Name = x.Name,
                Slug = x.Slug,
                EntityTypeId = x.EntityTypeId,
                EntityTypeName = x.EntityType.Name
            });

            return Ok(entities);
        }
    }
}
