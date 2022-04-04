using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MaxDev.Prode.Entidades.Filtros
{
    public class TorneoFiltroModel : FiltroBase
    {
        public int? TorneoId { get; set; }
        public string UrlAmigable { get; set; }
        public bool? Activo { get; set; }
    }
}
