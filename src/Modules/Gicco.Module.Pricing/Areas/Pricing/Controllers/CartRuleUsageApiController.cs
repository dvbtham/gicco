﻿using System;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Data;
using Gicco.Infrastructure.Web.SmartTable;
using Gicco.Module.Pricing.Models;

namespace Gicco.Module.Pricing.Controllers
{
    [Area("Pricing")]
    [Authorize(Roles = "admin")]
    [Route("api/cart-rule-usages")]
    public class CartRuleUsageApiController : Controller
    {
        private readonly IRepository<CartRuleUsage> _cartRuleUsageRepository;

        public CartRuleUsageApiController(IRepository<CartRuleUsage> cartRuleUsageRepository)
        {
            _cartRuleUsageRepository = cartRuleUsageRepository;
        }

        [HttpPost("grid")]
        public IActionResult List([FromBody] SmartTableParam param)
        {
            var query = _cartRuleUsageRepository
                .Query();

            if (param.Search.PredicateObject != null)
            {
                dynamic search = param.Search.PredicateObject;
                if (search.RuleName != null)
                {
                    string ruleName = search.RuleName;
                    query = query.Where(x => x.CartRule.Name.Contains(ruleName));
                }

                if (search.CouponCode != null)
                {
                    string couponCode = search.CouponCode;
                    query = query.Where(x => x.Coupon.Code.Contains(couponCode));
                }

                if (search.FullName != null)
                {
                    string fullName = search.FullName;
                    query = query.Where(x => x.User.FullName.Contains(fullName));
                }

                if (search.CreatedOn != null)
                {
                    if (search.CreatedOn.before != null)
                    {
                        DateTimeOffset before = search.CreatedOn.before;
                        query = query.Where(x => x.CreatedOn <= before);
                    }

                    if (search.CreatedOn.after != null)
                    {
                        DateTimeOffset after = search.CreatedOn.after;
                        query = query.Where(x => x.CreatedOn >= after);
                    }
                }
            }

            var cartRuleUsages = query.ToSmartTableResult(
                param,
                x => new
                {
                    x.Id,
                    x.CartRuleId,
                    CartRuleName = x.CartRule.Name,
                    x.UserId,
                    x.User.FullName,
                    CouponCode = x.Coupon.Code,
                    x.OrderId,
                    x.CreatedOn
                });

            return Json(cartRuleUsages);
        }
    }
}
