using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaoDienTu.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Moi ban nhap email")]
        public string Email { set; get; }

        [Required(ErrorMessage = "Moi ban nhap password")]
        public string Password { set; get; }
        public bool RememberMe { set; get; }
    }
}