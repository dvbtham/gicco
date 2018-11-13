using Microsoft.AspNetCore.Razor.TagHelpers;
using System;

namespace Gicco.Module.Core.Extensions.TagHelpers
{
    [HtmlTargetElement(RatingStarAttributeName)]
    public class RatingStarTagHelper : TagHelper
    {
        private const string RatingStarAttributeName = "gicco-rating-star";

        [HtmlAttributeName("rating-avg")]
        public double? RatingAverage { get; set; } = double.MinValue;

        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            if (RatingAverage == null)
            {
                for (int i = 1; i <= 5; i++)
                {
                    output.Content.AppendHtml("<i class='fa fa-star-o'></i>");
                }
                return;
            }

            int unstared = 5;

            for (int i = 1; i <= Math.Round(RatingAverage.Value); i++)
            {
                output.Content.AppendHtml("<i class='fa fa-star'></i>");
                unstared -= 1;
            }

            for (int i = 1; i <= unstared; i++)
            {
                output.Content.AppendHtml("<i class='fa fa-star-o'></i>");
            }
        }
    }
}
