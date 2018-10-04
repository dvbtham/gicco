using System;
using Gicco.Infrastructure.Models;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Core.Models;

namespace Gicco.Module.ProductComparison.Models
{
    public class ComparingProduct : EntityBase
    {
        public DateTimeOffset CreatedOn { get; set; }

        public long UserId { get; set; }

        public User User { get; set; }

        public long ProductId { get; set; }

        public Product Product { get; set; }
    }
}
