using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MaxDev.Prode.Negocio;
using MaxDev.Prode.Web.Models;

namespace MaxDev.Prode.Web.Controllers
{
    public class LayoutController : Controller
    {
        public ActionResult Navbar()
        {
            return PartialView();
        }

        public ActionResult Footer()
        {
            return PartialView();
        }

    }
}