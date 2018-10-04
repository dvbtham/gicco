using Microsoft.EntityFrameworkCore;

namespace Gicco.Infrastructure.Data
{
    public interface ICustomModelBuilder
    {
        void Build(ModelBuilder modelBuilder);
    }
}
