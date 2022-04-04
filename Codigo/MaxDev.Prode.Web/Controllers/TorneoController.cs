using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using MaxDev.Prode.Negocio;
using MaxDev.Prode.Web.Models;
using Microsoft.AspNet.Identity;

namespace MaxDev.Prode.Web.Controllers
{
    [Authorize]
    [RoutePrefix("torneo")]
    [Route("{action=index}")]
    public class TorneoController : Controller
    {
        public ActionResult Index()
        {
            var model = new TorneoVm {Torneos = TorneoNegocio.ObtenerPorUsuario(User.Identity.GetUserName())};
            return View(model);
        }

        [Route("{torneoId:int}")]
        public ActionResult Detalle(int torneoId)
        {
            var torneoActual = TorneoNegocio.UsuariosPuntajeFecha(torneoId, null, null);

            if (torneoActual == null)
            {
                return new HttpNotFoundResult();
            }

            var model = new TorneoVm
            {
                UsuariosPuntaje = torneoActual,
                TorneoId = torneoActual.Select(t => t.TorneoId).FirstOrDefault(),
                TorneoActual = torneoActual.Select(t => t.Torneo).FirstOrDefault(),
                Fechas = torneoActual.OrderBy(t => t.FechaNumero).Select(t => t.FechaNumero).Distinct().ToList()
            };
            return View(model);
        }

        [Route("{torneoId:int}/{grupo}")]
        public ActionResult Fixture(int torneoId, string grupo)
        {
            var grupoActual = GrupoNegocio.Obtener(torneoId, grupo);

            if (grupoActual == null)
            {
                return new HttpNotFoundResult();
            }

            var model = TorneoNegocio.EstadisticaTorneos(torneoId, null, null, grupo);
            return PartialView(model);
        }
    }
}