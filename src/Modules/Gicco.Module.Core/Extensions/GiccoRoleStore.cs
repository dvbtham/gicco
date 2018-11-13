using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Gicco.Module.Core.Data;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Core.Extensions
{
    public class GiccoRoleStore: RoleStore<Role, GiccoDbContext, long, UserRole, IdentityRoleClaim<long>>
    {
        public GiccoRoleStore(GiccoDbContext context) : base(context)
        {
        }
    }
}
