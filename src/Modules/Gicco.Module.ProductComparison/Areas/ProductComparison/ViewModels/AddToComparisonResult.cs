﻿using System;
using System.Collections.Generic;

namespace Gicco.Module.ProductComparison.ViewModels
{
    public class AddToComparisonResult
    {
        public String Message { get; set; }

        public IList<ComparingProductVm> ProductComparisons { get; set; } = new List<ComparingProductVm>();
    }
}
