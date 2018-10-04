﻿using System.Collections.Generic;

namespace Gicco.Module.Catalog.ViewModels
{
    public class ProductOptionVm
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public string DisplayType { get; set; }

        public IList<ProductOptionValueVm> Values { get; set; } = new List<ProductOptionValueVm>();
    }
}
