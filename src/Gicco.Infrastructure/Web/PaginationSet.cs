using System.Collections.Generic;

namespace Gicco.Infrastructure.Web
{
    public class PaginationSet<T>
    {
        public List<T> Items { get; set; }
        public int Page { get; set; }
        public int TotalCount { get; set; }
        public int TotalPages { get; set; }
    }
}
