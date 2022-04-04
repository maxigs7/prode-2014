using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using MaxDev.Prode.Negocio;
using MaxDev.Prode.Web.Models;

namespace MaxDev.Prode.Web.Controllers
{
    [Authorize]
    [RoutePrefix("prode")]
    [Route("{action=index}")]
    public class ProdeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [Route("Fixture/{torneo}", Name = "ProdeFixture")]
        public ActionResult Fixture(string torneo)
        {
            return View();
        }
    }
}