using Gicco.Infrastructure.Data;
using Gicco.Module.Reviews.Models;
using System.Linq;

namespace Gicco.Module.Reviews.Data
{
    public interface IReplyRepository : IRepository<Reply>
    {
        IQueryable<ReplyListItemDto> List();
    }
}
