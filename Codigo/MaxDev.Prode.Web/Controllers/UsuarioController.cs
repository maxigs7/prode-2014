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
    [RoutePrefix("usuario")]
    public class UsuarioController : Controller
    {
        [Route("{username}")]
        public ActionResult Index(string username)
        {
            var usuario = UsuarioNegocio.Obtener(username);
            return View(usuario);
        }

        [Route("{username}/{torneoId}")]
        public ActionResult Apuestas(string username, int torneoId)
        {
            var apuestaUsuario = UsuarioNegocio.ApuestaUsuario(username, torneoId, null, null, null, null);

            if (apuestaUsuario == null)
            {
                return new HttpNotFoundResult();
            }

            var model = new UsuarioVm()
            {
                TorneoId = torneoId,
                Fixture = apuestaUsuario,
                Habilitado = username == User.Identity.Name,
                UserName = username,
                Grupos = apuestaUsuario.Select(f => f.Grupo).Distinct().ToList()
            };

            return View(model);
        }

        [HttpPost]
        [Route("{username}/{torneoId}")]
        public ActionResult Apuestas(ApuestaVm apuestaVm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    foreach (var apuestaModel in apuestaVm.UsuarioApuestas.Where(m => m.EsValido))
                    {
                        var apuesta = apuestaModel.ToApuesta();
                        apuesta.UsuarioId = User.Identity.GetUserId();
                        ApuestaNegocio.Guardar(apuesta);
                    }

                    return RedirectToAction("Detalle", "Torneo", new { torneoId = apuestaVm.TorneoId });
                }
                catch (Exception)
                {
                    // TODO: LOG
                    ViewBag.Exito = false;
                }

            }

            var apuestaUsuario = UsuarioNegocio.ApuestaUsuario(User.Identity.Name, apuestaVm.TorneoId, null, null, null, null);

            if (apuestaUsuario == null)
            {
                return new HttpNotFoundResult();
            }

            var model = new UsuarioVm()
            {
                TorneoId = apuestaVm.TorneoId,
                Fixture = apuestaUsuario,
                Habilitado = true,
                UserName = User.Identity.Name,
                Grupos = apuestaUsuario.Select(f => f.Grupo).Distinct().ToList()
            };
            return View(model);
        }
    }
}