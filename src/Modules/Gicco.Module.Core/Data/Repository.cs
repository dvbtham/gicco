using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Models;

namespace Gicco.Module.Core.Data
{
    public class Repository<T> : RepositoryWithTypedId<T, long>, IRepository<T>
       where T : class, IEntityWithTypedId<long>
    {
        public Repository(GiccoDbContext context) : base(context)
        {
        }
    }
}
