using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Negocio;

namespace MaxDev.Prode.Web.Models
{
    public class ProdeVm
    {
        public List<Torneo> Torneos { get; set; }
        
    }
}
