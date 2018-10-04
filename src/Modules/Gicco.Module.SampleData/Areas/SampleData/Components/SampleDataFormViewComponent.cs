using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure;
using Gicco.Infrastructure.Web;
using Gicco.Module.SampleData.ViewModels;

namespace Gicco.Module.SampleData.Components
{
    public class SampleDataFormViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var sampleContentFolder = Path.Combine(GlobalConfiguration.ContentRootPath, "Modules", "Gicco.Module.SampleData", "SampleContent");
            var directoryInfo = new DirectoryInfo(sampleContentFolder);
            var industries = directoryInfo.GetDirectories().Select(x => x.Name).ToList();
            var model = new SampleDataOption { AvailableIndustries = industries };
            return View(this.GetViewPath(), model);
        }
    }
}
