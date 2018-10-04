using Gicco.Module.Catalog.Models;

namespace Gicco.Module.Pricing.Models
{
    public class CartRuleProduct
    {
        public long ProductId { get; set; }

        public Product Product { get; set; }

        public long CartRuleId { get; set; }

        public CartRule CartRule { get; set; }
    }
}
