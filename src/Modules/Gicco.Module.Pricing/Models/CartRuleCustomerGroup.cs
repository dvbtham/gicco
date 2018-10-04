using Gicco.Module.Core.Models;

namespace Gicco.Module.Pricing.Models
{
    public class CartRuleCustomerGroup
    {
        public long CartRuleId { get; set; }

        public CartRule CartRule { get; set; }

        public long CustomerGroupId { get; set; }

        public CustomerGroup CustomerGroup { get; set; }
    }
}
