using System.ComponentModel.DataAnnotations;

namespace MaxDev.Prode.Web.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [StringLength(20, ErrorMessage = "El {0} no puede tener mas de {1} caracteres. Minimo: {2}", MinimumLength = 3)]
        [Display(Name = "Nombre de Usuario")]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string Action { get; set; }
        public string ReturnUrl { get; set; }
    }

    public class ManageUserViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña actual")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "La {0} debe tener {2} caracteres como minimo.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Nueva contraseña")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar nueva contraseña")]
        [Compare("NewPassword", ErrorMessage = "La confirmación no corresponde con la nueva contraseña")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Nombre de Usuario")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [Display(Name = "Recordar?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [StringLength(50, ErrorMessage = "El {0} no puede tener mas de {1} caracteres.")]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "El {0} no puede tener mas de {1} caracteres.")]
        [Display(Name = "Apellido")]
        public string Apellido { get; set; }

        [Required]
        [StringLength(20, ErrorMessage = "El {0} no puede tener mas de {1} caracteres. Minimo: {2}", MinimumLength = 3)]
        [Display(Name = "Nombre de Usuario")]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar contraseña")]
        [Compare("Password", ErrorMessage = "La confirmación no corresponde con la contraseña")]
        public string ConfirmPassword { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [Required]
        [Display(Name = "Nombre de Usuario")]
        public string UserName { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "La {0} debe tener {2} caracteres como minimo.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "La confirmación no corresponde con la contraseña")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [Display(Name = "Nomde de Usuario")]
        public string UserName { get; set; }
    }
}
