using System.Linq;
using Gicco.Infrastructure.Data;
using Gicco.Module.ActivityLog.Models;

namespace Gicco.Module.ActivityLog.Data
{
    public interface IActivityTypeRepository : IRepository<Activity>
    {
        IQueryable<MostViewEntityDto> List();
    }
}
