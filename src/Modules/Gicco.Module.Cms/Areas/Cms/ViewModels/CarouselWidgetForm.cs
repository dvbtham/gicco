using System.Collections.Generic;
using Gicco.Module.Core.ViewModels;

namespace Gicco.Module.Cms.ViewModels
{
    public class CarouselWidgetForm : WidgetFormBase
    {
        public IList<CarouselWidgetItemForm> Items = new List<CarouselWidgetItemForm>();
    }
}
