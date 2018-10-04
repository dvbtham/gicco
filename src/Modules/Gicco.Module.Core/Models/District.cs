using Gicco.Infrastructure.Models;
using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Core.Models
{
    public class District : EntityBase
    {
        public District() { }

        public District(long id)
        {
            Id = id;
        }

        public long StateOrProvinceId { get; set; }

        public StateOrProvince StateOrProvince { get; set; }

        [Required]
        [StringLength(450)]
        public string Name { get; set; }

        public string Type { get; set; }

        public string Location { get; set; }
    }
}
