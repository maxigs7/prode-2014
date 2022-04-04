using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Negocio;

namespace MaxDev.Prode.Web.Models
{
    public class UsuarioVm
    {
        public bool Habilitado { get; set; }

        public int TorneoId { get; set; }

        public string UserName { get; set; }

        public List<string> Grupos { get; set; }
        public List<ApuestaFixtureCompleto> Fixture { get; set; }
    }
}
