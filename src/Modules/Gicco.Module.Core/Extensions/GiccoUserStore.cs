using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Gicco.Module.Core.Data;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Core.Extensions
{
    public class GiccoUserStore : UserStore<User, Role, GiccoDbContext, long, IdentityUserClaim<long>, UserRole,
        IdentityUserLogin<long>,IdentityUserToken<long>, IdentityRoleClaim<long>>
    {
        public GiccoUserStore(GiccoDbContext context, IdentityErrorDescriber describer) : base(context, describer)
        {
        }
    }
}
