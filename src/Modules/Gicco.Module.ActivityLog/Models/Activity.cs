﻿using System;
using System.ComponentModel.DataAnnotations;
using Gicco.Infrastructure.Models;

namespace Gicco.Module.ActivityLog.Models
{
    public class Activity : EntityBase
    {
        public long ActivityTypeId { get; set; }

        public ActivityType ActivityType { get; set; }

        public long UserId { get; set; }

        public DateTimeOffset CreatedOn { get; set; }

        public long EntityId { get; set; }

        [Required]
        [StringLength(450)]
        public string EntityTypeId { get; set; }
    }
}
