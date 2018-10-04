using System.Collections.Generic;

namespace Gicco.Module.Payments.ViewModels
{
    public class CheckoutPaymentForm
    {
        public IList<PaymentProviderVm> PaymentProviders { get; set; } = new List<PaymentProviderVm>();
    }
}
