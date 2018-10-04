using System.Collections.Generic;
using Gicco.Module.Core.ViewModels;

namespace Gicco.Module.Cms.ViewModels
{
    public class SpaceBarWidgetForm : WidgetFormBase
    {
        public IList<SpaceBarWidgetSetting> Items = new List<SpaceBarWidgetSetting>();
    }
}
