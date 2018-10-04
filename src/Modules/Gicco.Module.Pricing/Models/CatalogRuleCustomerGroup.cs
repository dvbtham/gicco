using Gicco.Module.Core.Models;

namespace Gicco.Module.Pricing.Models
{
    public class CatalogRuleCustomerGroup
    {
        public long CatalogRuleId { get; set; }

        public CatalogRule CatalogRule { get; set; }

        public long CustomerGroupId { get; set; }

        public CustomerGroup CustomerGroup { get; set; }
    }
}
