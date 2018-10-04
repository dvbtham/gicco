using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Core.Models;

namespace Gicco.Module.Localization.Controllers
{
    [Area("Localization")]
    public class LocalizationController : Controller
    {
        private readonly IRepositoryWithTypedId<User, long> _userRepository;
        private readonly IWorkContext _workContext;

        public LocalizationController(IRepositoryWithTypedId<User, long> userRepository, IWorkContext workContext)
        {
            _userRepository = userRepository;
            _workContext = workContext;
        }

        [HttpPost]
        public IActionResult SetLanguage(string culture, string returnUrl)
        {
            var currentUser = _userRepository.Query()
                .Single(u => u.Email == _workContext.GetCurrentUser().Result.Email);
            currentUser.Culture = culture;
            _userRepository.SaveChanges();

            return LocalRedirect(returnUrl);
        }
    }
}
