using System.Linq;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Core.Services
{
    public interface IWidgetInstanceService
    {
        IQueryable<WidgetInstance> GetPublished();
    }
}
