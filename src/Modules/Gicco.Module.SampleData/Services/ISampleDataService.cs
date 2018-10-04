using System.Threading.Tasks;
using Gicco.Module.SampleData.ViewModels;

namespace Gicco.Module.SampleData.Services
{
    public interface ISampleDataService
    {
        Task ResetToSampleData(SampleDataOption model);
    }
}
