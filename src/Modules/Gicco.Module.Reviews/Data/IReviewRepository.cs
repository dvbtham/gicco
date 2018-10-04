using Gicco.Infrastructure.Data;
using Gicco.Module.Reviews.Models;
using System.Linq;

namespace Gicco.Module.Reviews.Data
{
    public interface IReviewRepository : IRepository<Review>
    {
        IQueryable<ReviewListItemDto> List();
    }
}
