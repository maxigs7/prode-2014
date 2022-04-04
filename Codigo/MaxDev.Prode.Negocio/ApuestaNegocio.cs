using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Transactions;
using System.Web;
using MaxDev.Prode.Datos.Repositorios;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Entidades.Models;

namespace MaxDev.Prode.Negocio
{
    public class ApuestaNegocio : NegocioBase<ApuestaRepository>
    {
        public static Apuesta Obtener(int id)
        {
            return Repository.Obtener(a => a.ApuestaId == id);
        }

        public static bool Guardar(Apuesta apuesta)
        {
            var partido = PartidoNegocio.Obtener(apuesta.PartidoId);
            var limite = DateTime.UtcNow.AddHours(-3).AddHours(-partido.TipoApuesta.TiempoLimite);
            if (partido.FechaReal > limite)
            {
                Repository.Guardar(apuesta);
                Repository.GuardarCambios();
                return true;
            }
            return false;
        }
    }
}