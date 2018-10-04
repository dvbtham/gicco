using System;
using System.Globalization;
using Gicco.Infrastructure.Localization;

namespace Gicco.Module.Localization.Extensions
{
    public static class CultureInfoExtensions
    {
        public static LanguageDirection GetLanguageDirection(this CultureInfo cultureInfo)
        {
            if (cultureInfo == null)
            {
                throw new ArgumentNullException(nameof(cultureInfo));
            }

            return cultureInfo.TextInfo.IsRightToLeft ? LanguageDirection.RTL : LanguageDirection.LTR;
        }
    }
}
