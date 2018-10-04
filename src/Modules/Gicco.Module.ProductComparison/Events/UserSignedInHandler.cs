using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Gicco.Module.Core.Events;
using Gicco.Module.Core.Extensions;
using Gicco.Module.ProductComparison.Services;

namespace Gicco.Module.ProductComparison.Events
{
    public class UserSignedInHandler : INotificationHandler<UserSignedIn>
    {
        private readonly IWorkContext _workContext;
        private readonly IComparingProductService _comparingService;

        public UserSignedInHandler(IWorkContext workContext, IComparingProductService comparingService)
        {
            _workContext = workContext;
            _comparingService = comparingService;
        }

        public Task Handle(UserSignedIn user, CancellationToken cancellationToken)
        {
            var guestUser = _workContext.GetCurrentUser().Result;
            _comparingService.MigrateComparingProduct(guestUser.Id, user.UserId);
            return Task.CompletedTask;
        }
    }
}
