using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Gicco.Module.Catalog.ViewModels
{
    public class ProductWidgetSetting
    {
        public int NumberOfProducts { get; set; }

        public long? CategoryId { get; set; }

        [JsonConverter(typeof(StringEnumConverter))]
        public ProductWidgetOrderBy OrderBy { get; set; }

        public bool FeaturedOnly { get; set; }

        public long? FeaturedProduct { get; set; }

        public string Image { get; set; }

        public string ImageUrl { get; set; }

        [JsonIgnore]
        public IFormFile UploadImage { get; set; }
    }
}
