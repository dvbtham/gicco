using System.Threading.Tasks;
using Gicco.Module.News.Models;

namespace Gicco.Module.News.Services
{
    public interface INewsCategoryService
    {
        Task Create(NewsCategory category);

        Task Update(NewsCategory category);

        Task Delete(long id);

        Task Delete(NewsCategory category);
    }
}
