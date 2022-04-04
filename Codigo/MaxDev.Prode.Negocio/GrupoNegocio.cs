using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using MaxDev.Prode.Datos.Repositorios;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Negocio
{
    public class GrupoNegocio : NegocioBase<GenericRepository<Grupo>>
    {
        public static Grupo Obtener(int torneoId, string nombre)
        {
            return Repository.Obtener(g => g.Nombre == nombre && g.TorneosGrupo.Any(tg => tg.TorneoId == torneoId));
        }
    }
}