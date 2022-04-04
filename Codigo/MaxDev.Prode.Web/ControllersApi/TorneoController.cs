using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Routing;
using MaxDev.Prode.Entidades.Filtros;
using MaxDev.Prode.Negocio;

namespace MaxDev.Prode.Web.ControllersApi
{
    [RoutePrefix("api/torneo")]
    public class TorneoController : ApiController
    {
        [HttpGet]
        [Route("buscar")]
        public IHttpActionResult Buscar([FromUri]TorneoFiltroModel filtros)
        {
            var listado = TorneoNegocio.Buscar(filtros);

            var dto = new
                      {
                          data = listado.Select(t => new
                                                     {
                                                         t.Nombre,
                                                         t.UrlAmigable,
                                                         t.Activo,
                                                         Url = Url.Route("ProdeFixture", new
                                                                                         {
                                                                                             action = "Fixture",
                                                                                             controller = "Prode",
                                                                                             torneo = t.UrlAmigable
                                                                                         })
                                                     }).ToArray(),
                          total = filtros.TotalRecords
                      };
            return Ok(dto);
        }
    }
}