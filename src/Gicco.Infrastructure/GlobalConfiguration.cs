using System.Collections.Generic;
using Gicco.Infrastructure.Localization;
using Gicco.Infrastructure.Modules;

namespace Gicco.Infrastructure
{
    public static class GlobalConfiguration
    {
        public static IList<ModuleInfo> Modules { get; set; } = new List<ModuleInfo>();

        public static IList<Culture> Cultures { get; set; } = new List<Culture>();

        public static string DefaultCulture => "vi-VN";

        public static string WebRootPath { get; set; }

        public static string ContentRootPath { get; set; }
    }
}
