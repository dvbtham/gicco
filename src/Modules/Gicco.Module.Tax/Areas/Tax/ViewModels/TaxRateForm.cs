﻿using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Tax.ViewModels
{
    public class TaxRateForm
    {
        public long Id { get; set; }

        [Range(1, long.MaxValue, ErrorMessage = "Tax Class is required")]
        public long TaxClassId { get; set; }

        [Required]
        public string CountryId { get; set; }

        [Required]
        public decimal Rate { get; set; }

        public long? StateOrProvinceId { get; set; }

        public string ZipCode { get; set; }
    }
}
