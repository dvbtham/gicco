using System.Threading.Tasks;
using System.Collections.Generic;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.ViewModels;

namespace Gicco.Module.Catalog.Services
{
    public interface ICategoryService
    {
        Task<IList<CategoryListItem>> GetAll();

        Task Create(Category category);

        Task Update(Category category);

        Task Delete(Category category);
    }
}
