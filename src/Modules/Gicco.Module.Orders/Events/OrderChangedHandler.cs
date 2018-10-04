﻿using System;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Newtonsoft.Json;
using Gicco.Infrastructure.Data;
using Gicco.Module.Orders.Events;
using Gicco.Module.Orders.Models;

namespace Gicco.Module.Orders.Data
{
    public class OrderChangedHandler : INotificationHandler<OrderChanged>
    {
        private readonly IRepository<OrderHistory> _orderHistoryRepository;

        public OrderChangedHandler(IRepository<OrderHistory> orderHistoryRepository)
        {
            _orderHistoryRepository = orderHistoryRepository;
        }

        public async Task Handle(OrderChanged notification, CancellationToken cancellationToken)
        {
            var orderHistory = new OrderHistory
            {
                OrderId = notification.OrderId,
                CreatedOn = DateTimeOffset.Now,
                CreatedById = notification.UserId,
                OldStatus = notification.OldStatus,
                NewStatus = notification.NewStatus,
                Note = notification.Note,
            };

            if(notification.Order != null)
            {
                orderHistory.OrderSnapshot = JsonConvert.SerializeObject(notification.Order);
            }

            _orderHistoryRepository.Add(orderHistory);
            await _orderHistoryRepository.SaveChangesAsync();
        }
    }
}
