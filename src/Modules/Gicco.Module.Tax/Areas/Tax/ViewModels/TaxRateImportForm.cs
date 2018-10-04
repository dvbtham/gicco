using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Tax.ViewModels
{
    public class TaxRateImportForm
    {
        public bool IncludeHeader { get; set; }

        [Required]
        public string CsvDelimiter { get; set; }

        [Required]
        public IFormFile CsvFile { get; set; }
    }
}
