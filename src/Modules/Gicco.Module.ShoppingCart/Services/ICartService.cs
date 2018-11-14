using System.Threading.Tasks;
using Gicco.Module.Pricing.Services;
using Gicco.Module.ShoppingCart.ViewModels;

namespace Gicco.Module.ShoppingCart.Services
{
    public interface ICartService
    {
        Task AddToCart(long userId, long productId, int quantity);

        Task<CartVm> GetCart(long userId);

        Task<CouponValidationResult> ApplyCoupon(long userId, string couponCode);

        Task RemoveCoupon(long userId);

        Task MigrateCart(long fromUserId, long toUserId);
    }
}
