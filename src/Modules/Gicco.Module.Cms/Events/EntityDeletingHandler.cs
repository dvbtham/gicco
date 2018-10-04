using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Gicco.Infrastructure.Data;
using Gicco.Module.Cms.Models;
using Gicco.Module.Core.Events;

namespace Gicco.Module.Cms.Events
{
    public class EntityDeletingHandler : INotificationHandler<EntityDeleting>
    {
        private readonly IRepository<MenuItem> _menuItemRepository;

        public EntityDeletingHandler(IRepository<MenuItem> menuItemRepository)
        {
            _menuItemRepository = menuItemRepository;
        }

        public Task Handle(EntityDeleting notification, CancellationToken cancellationToken)
        {
            var items = _menuItemRepository.Query().Where(x => x.EntityId == notification.EntityId).ToList();
            foreach(var item in items)
            {
                _menuItemRepository.Remove(item);
            }

            return Task.CompletedTask;
        }
    }
}
