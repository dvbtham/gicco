using Gicco.Infrastructure.Models;
using Gicco.Module.Core.Models;
using System;
using System.Collections.Generic;

namespace Gicco.Module.Reviews.Models
{
    public class Review : EntityBase
    {
        public Review()
        {
            Status = ReviewStatus.Pending;
            CreatedOn = DateTimeOffset.Now;
        }

        public long UserId { get; set; }

        public User User { get; set; }

        public string Title { get; set; }

        public string Comment { get; set; }

        public int Rating { get; set; }

        public string ReviewerName { get; set; }

        public ReviewStatus Status { get; set; }

        public DateTimeOffset CreatedOn { get; set; }

        public string EntityTypeId { get; set; }

        public long EntityId { get; set; }

        public IList<Reply> Replies { get; protected set; } = new List<Reply>();

    }
}
