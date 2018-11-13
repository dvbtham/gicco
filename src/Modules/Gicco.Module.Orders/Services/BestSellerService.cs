using Gicco.Infrastructure.Data;
using Gicco.Module.Catalog.Models;
using Gicco.Module.Catalog.Services;
using Gicco.Module.Catalog.ViewModels;
using Gicco.Module.Core.Services;
using Gicco.Module.Orders.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace Gicco.Module.Orders.Services
{
    public class BestSellerService : IBestSellerService
    {
        private readonly IRepository<OrderItem> _orderItemRepository;
        private readonly IRepository<Product> _productRepository;
        private readonly IMediaService _mediaService;
        private readonly IRepository<Order> _orderRepository;
        private readonly IProductPricingService _productPricingService;

        public BestSellerService(IRepository<OrderItem> orderItemRepository,
            IRepository<Product> productRepository,
            IMediaService mediaService,
            IRepository<Order> orderRepository,
            IProductPricingService productPricingService)
        {
            _orderItemRepository = orderItemRepository;
            _productRepository = productRepository;
            _mediaService = mediaService;
            _orderRepository = orderRepository;
            _productPricingService = productPricingService;
        }

        public List<ProductSummary> BestSelling()
        {
            var query = _orderRepository.Query()
                  .Where(x => x.OrderStatus == OrderStatus.Complete)
                  .Join(_orderItemRepository.Query().Include(x => x.Order),
                  o => o.Id,
                  oi => oi.Order.Id,
                  (order, orderItem) => new
                  {
                      orderItem.ProductId,
                      orderItem.Quantity
                  })
                  .Join(_productRepository.Query()
                    .Include(x => x.ThumbnailImage)
                    .Where(x => x.IsVisibleIndividually && !x.IsDeleted),
                  o => o.ProductId,
                  p => p.Id,
                  (order, product) => new
                  {
                      Product = product,
                      order.Quantity
                  })
                  .GroupBy(x => new
                  {
                      ProductId = x.Product.Id,
                      ProductName = x.Product.Name,
                      Slug = x.Product.Slug,
                      CalculatedProductPrice = _productPricingService.CalculateProductPrice(x.Product),
                      RatingAverage = x.Product.RatingAverage,
                      Image = _mediaService.GetThumbnailUrl(x.Product.ThumbnailImage)
                  })
                  .Select(g => new ProductSummary
                  {
                      Id = g.Key.ProductId,
                      Name = g.Key.ProductName,
                      Slug = g.Key.Slug,
                      CalculatedProductPrice = g.Key.CalculatedProductPrice,
                      RatingAverage = g.Key.RatingAverage,
                      Image = g.Key.Image
                  })
                  .ToList();

            return query;
        }
    }
}
