using Microsoft.AspNetCore.Identity;
using Gicco.Infrastructure.Models;
using System.Collections.Generic;

namespace Gicco.Module.Core.Models
{
    public class Role : IdentityRole<long>, IEntityWithTypedId<long>
    {
        public IList<UserRole> Users { get; set; } = new List<UserRole>();
    }
}
