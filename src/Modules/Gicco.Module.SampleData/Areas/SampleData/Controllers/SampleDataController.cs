using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Gicco.Module.SampleData.Services;
using Gicco.Module.SampleData.ViewModels;

namespace Gicco.Module.SampleData.Controllers
{
    [Area("SampleData")]
    public class SampleDataController : Controller
    {
        private readonly ISampleDataService _sampleDataService;

        public SampleDataController(ISampleDataService sampleDataService)
        {
            _sampleDataService = sampleDataService;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ResetToSample(SampleDataOption model)
        {
            await _sampleDataService.ResetToSampleData(model);
            return Redirect("~/");
        }
    }
}
