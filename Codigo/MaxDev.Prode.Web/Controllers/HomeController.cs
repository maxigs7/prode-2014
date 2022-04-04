using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MaxDev.Prode.Negocio;
using MaxDev.Prode.Web.Models;

namespace MaxDev.Prode.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var model = new HomeVm()
            {
                Usuarios = UsuarioNegocio.Listado()
            };
            return View(model);
        }

        public ActionResult Reglas(bool isPopup = false)
        {
            if(isPopup)
                return PartialView(true);

            return View(false);
        }
    }
}