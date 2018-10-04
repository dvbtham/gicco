using System.Linq;
using Gicco.Infrastructure.Data;
using Gicco.Module.Comments.Models;

namespace Gicco.Module.Comments.Data
{
    public interface ICommentRepository : IRepository<Comment>
    {
        IQueryable<CommentListItemDto> List();
    }
}
