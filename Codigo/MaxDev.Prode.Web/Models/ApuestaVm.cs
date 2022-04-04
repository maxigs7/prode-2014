using System.Collections.Generic;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Entidades.Models;

namespace MaxDev.Prode.Web.Models
{
    public class ApuestaVm
    {
        public int FechaNumero { get; set; }

        public int TorneoId { get; set; }

        public List<ApuestaModel> UsuarioApuestas { get; set; }
    }
}
