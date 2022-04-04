using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Negocio;

namespace MaxDev.Prode.Web.Models
{
    public class TorneoVm
    {
        public List<Torneo> Torneos { get; set; }

        public int TorneoId { get; set; }
        public string TorneoActual { get; set; }
        public List<int> Fechas { get; set; }
        public List<UsuariosPuntajeTorneo> UsuariosPuntaje { get; set; }
    }
}
