﻿using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Tasks;
using Gicco.Module.Orders.Events;
using Gicco.Module.Orders.Models;

namespace Gicco.Module.Orders.Services
{
    public class OrderCancellationBackgroundService : BackgroundService
    {
        private readonly IMediator _mediator;
        private readonly IRepository<Order> _orderRepository;
        private readonly IOrderService _orderService;
        private readonly long SystemUserId = 2;

        public OrderCancellationBackgroundService(IMediator mediator, IRepository<Order> orderRepository, IOrderService orderService)
        {
            _mediator = mediator;
            _orderRepository = orderRepository;
            _orderService = orderService;
        }

        protected async override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                await CancelFailedPaymentOrders(stoppingToken);
                await Task.Delay(TimeSpan.FromSeconds(30), stoppingToken);
            }
        }

        private async Task CancelFailedPaymentOrders(CancellationToken stoppingToken)
        {
            var durationToCancel = DateTimeOffset.Now.AddMinutes(-5);
            var failedPaymentOrders = _orderRepository.Query().Where(x =>
                (x.OrderStatus == OrderStatus.PendingPayment || x.OrderStatus == OrderStatus.PaymentFailed) 
                && x.UpdatedOn < durationToCancel);

            foreach(var order in failedPaymentOrders)
            {
                _orderService.CancelOrder(order);
                var orderStatusChanged = new OrderChanged
                {
                    OrderId = order.Id,
                    OldStatus = OrderStatus.PendingPayment,
                    NewStatus = OrderStatus.Canceled,
                    UserId = SystemUserId,
                    Order = order,
                    Note = "System canceled"
                };

                await _mediator.Publish(orderStatusChanged, stoppingToken);
            }

            await _orderRepository.SaveChangesAsync();
        }
    }
}
