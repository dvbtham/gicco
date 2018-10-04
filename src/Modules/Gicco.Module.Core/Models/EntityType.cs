﻿using Gicco.Infrastructure.Models;
using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Core.Models
{
    public class EntityType : EntityBaseWithTypedId<string>
    {
        public EntityType()
        {

        }

        public EntityType(string id)
        {
            Id = id;
        }

        [Required]
        [StringLength(450)]
        public string Name { get { return Id; } }

        public bool IsMenuable { get; set; }

        [StringLength(450)]
        public string AreaName { get; set; }

        [StringLength(450)]
        public string RoutingController { get; set; }

        [StringLength(450)]
        public string RoutingAction { get; set; }
    }
}
