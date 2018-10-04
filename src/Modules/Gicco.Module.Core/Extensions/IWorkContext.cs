using System.Threading.Tasks;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Core.Extensions
{
    public interface IWorkContext
    {
        Task<User> GetCurrentUser();
    }
}
