using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Models;
using Gicco.Module.Tax.Models;

namespace Gicco.Module.Tax.Data
{
    public class TaxCustomModelBuilder : ICustomModelBuilder
    {
        public void Build(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TaxClass>().HasData(new TaxClass(1) { Name = "Standard VAT" });

            modelBuilder.Entity<AppSetting>().HasData(
                new AppSetting("Tax.DefaultTaxClassId") { Module = "Tax", IsVisibleInCommonSettingPage = true, Value = "1" }
            );
        }
    }
}
