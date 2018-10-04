using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Events;
using Gicco.Module.Core.Extensions;
using Gicco.Module.ProductRecentlyViewed.Models;

namespace Gicco.Module.ActivityLog.Events
{
    public class EntityViewedHandler : INotificationHandler<EntityViewed>
    {
        private const string ProductEntityTypeId = "Product";
        private readonly IRepository<RecentlyViewedProduct> _recentlyViewedProductRepository;
        private readonly IWorkContext _workContext;

        public EntityViewedHandler(IRepository<RecentlyViewedProduct> recentlyViewedProductRepository, IWorkContext workcontext)
        {
            _recentlyViewedProductRepository = recentlyViewedProductRepository;
            _workContext = workcontext;
        }

        public async Task Handle(EntityViewed notification, CancellationToken cancellationToken)
        {
            if (notification.EntityTypeId == ProductEntityTypeId)
            {
                var user = await _workContext.GetCurrentUser();
                var recentlyViewedProduct = _recentlyViewedProductRepository.Query().FirstOrDefault(x =>
                    x.ProductId == notification.EntityId
                    && x.UserId == user.Id);

                if(recentlyViewedProduct == null)
                {
                    recentlyViewedProduct = new RecentlyViewedProduct
                    {
                        UserId = user.Id,
                        ProductId = notification.EntityId,
                        LatestViewedOn = DateTimeOffset.Now
                    };

                    _recentlyViewedProductRepository.Add(recentlyViewedProduct);
                }

                recentlyViewedProduct.LatestViewedOn = DateTimeOffset.Now;
                _recentlyViewedProductRepository.SaveChanges();
            }
        }
    }
}
