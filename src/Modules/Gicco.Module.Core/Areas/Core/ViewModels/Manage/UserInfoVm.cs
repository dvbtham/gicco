using System.ComponentModel.DataAnnotations;

namespace Gicco.Module.Core.ViewModels.Manage
{
    public class UserInfoVm
    {
        [Required]
        public string FullName { get; set; }

        [Required]
        public string Email { get; set; }
    }
}
