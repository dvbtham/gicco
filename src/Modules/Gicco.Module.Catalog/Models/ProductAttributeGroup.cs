﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Gicco.Infrastructure.Models;

namespace Gicco.Module.Catalog.Models
{
    public class ProductAttributeGroup : EntityBase
    {
        [Required]
        [StringLength(450)]
        public string Name { get; set; }

        public IList<ProductAttribute> Attributes { get; set; } = new List<ProductAttribute>();
    }
}
