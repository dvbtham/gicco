using System.Threading.Tasks;
using Gicco.Module.Cms.Models;

namespace Gicco.Module.Cms.Services
{
    public interface IPageService
    {
        Task Create(Page page);

        Task Update(Page page);

        Task Delete(Page page);
    }
}
