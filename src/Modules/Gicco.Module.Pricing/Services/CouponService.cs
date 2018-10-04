﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Pricing.Models;
using Gicco.Module.Catalog.Models;

namespace Gicco.Module.Pricing.Services
{
    public class CouponService : ICouponService
    {
        private readonly IRepository<Coupon> _couponRepository;
        private readonly IRepository<CartRuleUsage> _cartRuleUsageRepository;
        private readonly IRepository<Product> _productRepository;
        private readonly IWorkContext _workContext;

        public CouponService(IRepository<Coupon> couponRepository, IRepository<CartRuleUsage> cartRuleUsageRepository, IRepository<Product> productRespository, IWorkContext workContext)
        {
            _couponRepository = couponRepository;
            _cartRuleUsageRepository = cartRuleUsageRepository;
            _productRepository = productRespository;
            _workContext = workContext;
        }

        public async Task<CouponValidationResult> Validate(string couponCode, CartInfoForCoupon cart)
        {
            var coupon = _couponRepository.Query()
                .Include(x => x.CartRule).ThenInclude(c => c.Products)
                .Include(x => x.CartRule).ThenInclude(c => c.Categories)
                .FirstOrDefault(x => x.Code == couponCode);
            var validationResult = new CouponValidationResult { Succeeded = false };

            if(coupon == null || !coupon.CartRule.IsActive)
            {
                validationResult.ErrorMessage = $"The coupon {couponCode} is not exist.";
                return validationResult;
            }

            if (coupon.CartRule.StartOn.HasValue && coupon.CartRule.StartOn > DateTimeOffset.Now)
            {
                validationResult.ErrorMessage = $"The coupon {couponCode} should be used after {coupon.CartRule.StartOn}.";
                return validationResult;
            }

            if (coupon.CartRule.EndOn.HasValue && coupon.CartRule.EndOn <= DateTimeOffset.Now)
            {
                validationResult.ErrorMessage = $"The coupon {couponCode} is expired.";
                return validationResult;
            }

            var couponUsageCount = _cartRuleUsageRepository.Query().Count(x => x.CouponId == coupon.Id);
            if(coupon.CartRule.UsageLimitPerCoupon.HasValue && couponUsageCount >= coupon.CartRule.UsageLimitPerCoupon)
            {
                validationResult.ErrorMessage = $"The coupon {couponCode} is all used.";
                return validationResult;
            }

            var currentCustomer = await _workContext.GetCurrentUser();
            var couponUsageByCustomerCount = _cartRuleUsageRepository.Query().Count(x => x.CouponId == coupon.Id && x.UserId == currentCustomer.Id);
            if (coupon.CartRule.UsageLimitPerCustomer.HasValue && couponUsageByCustomerCount >= coupon.CartRule.UsageLimitPerCustomer)
            {
                validationResult.ErrorMessage = $"You can use the coupon {couponCode} only {coupon.CartRule.UsageLimitPerCustomer} times";
                return validationResult;
            }

            IList<DiscountableProduct> discountableProducts = new List<DiscountableProduct>();
            if(!coupon.CartRule.Products.Any() && !coupon.CartRule.Categories.Any())
            {
                var productIds = cart.Items.Select(x => x.ProductId);
                discountableProducts = _productRepository.Query()
                   .Where(x => productIds.Contains(x.Id))
                   .Select(x => new DiscountableProduct { Id = x.Id, Name = x.Name, Price = x.Price }).ToList();
            }
            else
            {
                discountableProducts = GetDiscountableProduct(coupon.CartRule.Products, coupon.CartRule.Categories);
            }

            foreach (var item in cart.Items)
            {
                if ((coupon.CartRule.UsageLimitPerCoupon.HasValue && couponUsageCount >= coupon.CartRule.UsageLimitPerCoupon) ||
                    (coupon.CartRule.UsageLimitPerCustomer.HasValue && couponUsageByCustomerCount >= coupon.CartRule.UsageLimitPerCustomer))
                {
                    break;
                }

                var discountableProduct = discountableProducts.FirstOrDefault(x => x.Id == item.ProductId);
                if (discountableProduct != null)
                {
                    var discountedProduct = new DiscountedProduct { Id = discountableProduct.Id, Name = discountableProduct.Name, Price = discountableProduct.Price, Quantity = 1 };
                    couponUsageCount = couponUsageCount + 1;
                    couponUsageByCustomerCount = couponUsageByCustomerCount + 1;
                    for (var i = 1; i < item.Quantity; i++)
                    {
                        if ((coupon.CartRule.UsageLimitPerCoupon.HasValue && couponUsageCount >= coupon.CartRule.UsageLimitPerCoupon) ||
                            (coupon.CartRule.UsageLimitPerCustomer.HasValue && couponUsageByCustomerCount >= coupon.CartRule.UsageLimitPerCustomer))
                        {
                            break;
                        }

                        discountedProduct.Quantity = discountedProduct.Quantity + 1;
                        couponUsageCount = couponUsageCount + 1;
                        couponUsageByCustomerCount = couponUsageByCustomerCount + 1;
                    }

                    validationResult.DiscountedProducts.Add(discountedProduct);
                }
            }

            if (!validationResult.DiscountedProducts.Any())
            {
                validationResult.ErrorMessage = $"The coupon {couponCode} doesn't apply to any products in your cart";
                return validationResult;
            }

            validationResult.Succeeded = true;
            validationResult.CouponId = coupon.Id;
            validationResult.CouponCode = coupon.Code;
            validationResult.CouponRuleName = coupon.CartRule.Name;
            validationResult.CartRule = coupon.CartRule;

            switch (coupon.CartRule.RuleToApply)
            {
                case "cart_fixed":
                    validationResult.DiscountAmount = coupon.CartRule.DiscountAmount;
                    return validationResult;

                case "by_percent":
                    foreach(var item in validationResult.DiscountedProducts)
                    {
                        item.DiscountAmount = (item.Price * coupon.CartRule.DiscountAmount / 100) * item.Quantity;
                    }

                    validationResult.DiscountAmount = validationResult.DiscountedProducts.Sum(x => x.DiscountAmount);
                    return validationResult;

                default:
                    throw new InvalidOperationException($"{coupon.CartRule.RuleToApply} is not supported");
            }
        }

        private IList<DiscountableProduct> GetDiscountableProduct(IList<CartRuleProduct> cartRuleProducts, IList<CartRuleCategory> cartRuleCategorys)
        {
            IList<DiscountableProduct> discountedProducts = new List<DiscountableProduct>();
            if (cartRuleProducts.Any())
            {
                var productIds = cartRuleProducts.Select(x => x.ProductId);
                discountedProducts = _productRepository.Query()
                    .Where(x => productIds.Contains(x.Id))
                    .Select(x => new DiscountableProduct { Id = x.Id, Name = x.Name, Price = x.Price }).ToList();
            }

            if (cartRuleCategorys.Any())
            {
                var categoryIds = cartRuleCategorys.Select(x => x.CategoryId);
                var discountedProductByCategories = _productRepository.Query()
                    .Where(x => x.Categories.Any(c => categoryIds.Contains(c.Id)))
                    .Select(x => new DiscountableProduct { Id = x.Id, Name = x.Name, Price = x.Price }).ToList();
                discountedProducts = discountedProducts.Concat(discountedProductByCategories).ToList();
            }

            return discountedProducts;
        }

        public void AddCouponUsage(long userId, long orderId, CouponValidationResult couponValidationResult)
        {
            if (!couponValidationResult.Succeeded || couponValidationResult.CartRule == null)
            {
                return;
            }

            CartRuleUsage couponUsage;
            switch (couponValidationResult.CartRule.RuleToApply)
            {
                case "cart_fixed":
                    couponUsage = new CartRuleUsage
                    {
                        UserId = userId,
                        OrderId = orderId,
                        CouponId = couponValidationResult.CouponId,
                        CartRuleId = couponValidationResult.CartRule.Id
                    };

                    _cartRuleUsageRepository.Add(couponUsage);
                    break;

                case "by_percent":
                    foreach (var item in couponValidationResult.DiscountedProducts)
                    {
                        for (var i = 0; i < item.Quantity; i++)
                        {
                            couponUsage = new CartRuleUsage
                            {
                                UserId = userId,
                                OrderId = orderId,
                                CouponId = couponValidationResult.CouponId,
                                CartRuleId = couponValidationResult.CartRule.Id
                            };

                            _cartRuleUsageRepository.Add(couponUsage);
                        }
                    }

                    break;

                default:
                    throw new InvalidOperationException($"{couponValidationResult.CartRule.RuleToApply} is not supported");
            }
        }
    }
}
