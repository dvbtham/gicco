﻿using System;
using System.Collections.Generic;
using Gicco.Infrastructure.Models;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Comments.Models
{
    public class Comment : EntityBase
    {
        public Comment()
        {
            Status = CommentStatus.Approved;
            CreatedOn = DateTimeOffset.Now;
        }

        public long UserId { get; set; }

        public User User { get; set; }

        public string CommentText { get; set; }

        public string CommenterName { get; set; }

        public CommentStatus Status { get; set; }

        public DateTimeOffset CreatedOn { get; set; }

        public string EntityTypeId { get; set; }

        public long EntityId { get; set; }

        public long? ParentId { get; set; }

        public Comment Parent { get; set; }

        public IList<Comment> Replies { get; protected set; } = new List<Comment>();

    }
}
