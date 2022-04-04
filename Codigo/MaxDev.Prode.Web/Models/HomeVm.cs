using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Web.Models
{
    public class HomeVm
    {
        public List<Usuario> Usuarios { get; set; }
    }
}
