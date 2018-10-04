﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Gicco.Infrastructure.Models;

namespace Gicco.Module.Pricing.Models
{
    public class CatalogRule : EntityBase
    {
        [Required]
        [StringLength(450)]
        public string Name { get; set; }

        public string Description { get; set; }

        public bool IsActive { get; set; }

        public DateTimeOffset? StartOn { get; set; }

        public DateTimeOffset? EndOn { get; set; }

        public string RuleToApply { get; set; }

        public decimal DiscountAmount { get; set; }

        public decimal? MaxDiscountAmount { get; set; }

        public IList<CatalogRuleCustomerGroup> CustomerGroups { get; set; } = new List<CatalogRuleCustomerGroup>();
    }
}
