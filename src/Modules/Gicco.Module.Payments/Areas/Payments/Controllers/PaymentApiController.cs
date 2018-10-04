﻿using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Data;
using Gicco.Module.Payments.Models;

namespace Gicco.Module.Payments.Controllers
{
    [Area("Payments")]
    [Authorize(Roles = "admin")]
    [Route("api/payments")]
    public class PaymentApiController : Controller
    {
        private readonly IRepository<Payment> _paymentRepository;

        public PaymentApiController(IRepository<Payment> paymentRepository)
        {
            _paymentRepository = paymentRepository;
        }

        [HttpGet("/api/orders/{orderId}/payments")]
        public async Task<IActionResult> GetByOrder(long orderId)
        {
            var payments = await _paymentRepository.Query()
                .Where(x => x.OrderId == orderId)
                .Select(x => new
                {
                    x.Id,
                    x.Amount,
                    AmountString = x.Amount.ToString("C"),
                    x.PaymentFee,
                    PaymentFeeString = x.PaymentFee.ToString("C"),
                    x.OrderId,
                    x.GatewayTransactionId,
                    Status = x.Status.ToString(),
                    x.CreatedOn
                }).ToListAsync();

            return Ok(payments);
        }
    }
}
