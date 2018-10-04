﻿using System.Threading.Tasks;
using Gicco.Infrastructure;
using Gicco.Module.Core.Models;
using Gicco.Module.Orders.Models;

namespace Gicco.Module.Orders.Services
{
    public interface IOrderService
    {
        /// <summary>
        /// Create order for user from active cart
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        Task<Result<Order>> CreateOrder(User user, string paymentMethod, decimal paymentFeeAmount, OrderStatus orderStatus = OrderStatus.New);

        Task<Result<Order>> CreateOrder(User user, string paymentMethod, decimal paymentFeeAmount, string shippingMethod, Address billingAddress, Address shippingAddress, OrderStatus orderStatus = OrderStatus.New);

        void CancelOrder(Order order);

        Task<decimal> GetTax(long cartOwnerUserId, string countryId, long stateOrProvinceId, string zipCode);
    }
}
