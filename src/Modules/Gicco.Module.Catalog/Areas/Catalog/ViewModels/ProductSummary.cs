using Gicco.Module.Catalog.Models;

namespace Gicco.Module.Catalog.ViewModels
{
    public class ProductSummary
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public string Slug { get; set; }

        public string Image { get; set; }

        public CalculatedProductPrice CalculatedProductPrice { get; set; }

        public double? RatingAverage { get; set; }
    }
}
