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
    public class PartidoNegocio : NegocioBase<PartidoRepository>
    {
        public static Partido Obtener(int partidoId)
        {
            return Repository.Obtener(p => p.PartidoId == partidoId, p => p.TipoApuesta);
        }

    }
}