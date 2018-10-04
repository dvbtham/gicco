using System.Collections.Generic;

namespace Gicco.Module.Catalog.ViewModels
{
    public class ProductDetailOption
    {
        public long OptionId { get; set; }

        public string OptionName { get; set; }

        public IList<string> Values { get; set; } = new List<string>();
    }
}
