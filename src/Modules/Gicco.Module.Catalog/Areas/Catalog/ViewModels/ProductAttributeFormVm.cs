﻿using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Catalog.ViewModels
{
    public class ProductAttributeFormVm
    {
        public long Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "The Attribute Group field is required.")]
        public long GroupId { get; set; }
    }
}
