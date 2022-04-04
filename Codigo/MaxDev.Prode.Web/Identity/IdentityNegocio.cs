using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MaxDev.Prode.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace MaxDev.Prode.Web.Identity
{
    public class IdentityNegocio
    {
        public static ApplicationUser GetUsuario(string userName)
        {
            var manager =
                new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            return manager.FindByName(userName);
        }
    }
}