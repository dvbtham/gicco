﻿using System;
using Gicco.Infrastructure.Models;

namespace Gicco.Module.Core.Models
{
    public class WidgetInstance : EntityBase
    {
        public WidgetInstance()
        {
            CreatedOn = DateTimeOffset.Now;
            UpdatedOn = DateTimeOffset.Now;
        }

        public string Name { get; set; }

        public DateTimeOffset CreatedOn { get; set; }

        public DateTimeOffset UpdatedOn { get; set; }

        public DateTimeOffset? PublishStart { get; set; }

        public DateTimeOffset? PublishEnd { get; set; }

        public string WidgetId { get; set; }

        public Widget Widget { get; set; }

        public long WidgetZoneId { get; set; }

        public WidgetZone WidgetZone { get; set; }

        public int DisplayOrder { get; set; }

        public string Data { get; set; }

        public string HtmlData { get; set; }

        /// <summary>
        /// This property cannot be used to filter again DB because it don't exist in database
        /// </summary>
        public bool IsPublished
        {
            get
            {
                return PublishStart.HasValue && PublishStart.Value < DateTimeOffset.Now && (!PublishEnd.HasValue || PublishEnd.Value > DateTimeOffset.Now);
            }
        }
    }
}
