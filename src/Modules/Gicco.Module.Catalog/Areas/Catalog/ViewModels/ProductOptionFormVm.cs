using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Catalog.ViewModels
{
    public class ProductOptionFormVm
    {
        public long Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
