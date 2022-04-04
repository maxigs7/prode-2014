using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using MaxDev.Prode.Datos.Repositorios;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Entidades.Filtros;

namespace MaxDev.Prode.Negocio
{
    public class TorneoNegocio : NegocioBase<TorneoRepository>
    {
        public static Task<List<Torneo>> ListadoAsync(params Expression<Func<Torneo, object>>[] includeProperties)
        {
            return Repository.ListadoAsync(includeProperties);
        }

        public static List<Torneo> ObtenerPorUsuario(string userName)
        {
            return Repository.ObtenerPorUsuario(userName);
        }

        public static List<EstadisticasEquipoCompleto> EstadisticaTorneos(int torneoId, string torneoNombre, short? grupoId, string grupo)
        {
            return Repository.EstadisticaTorneos(torneoId, torneoNombre, grupoId, grupo);
        }

        public static Torneo ObtenerCompleto(int torneoId)
        {
            return Repository.Obtener(t => t.TorneoId == torneoId,
                t => t.TipoTorneo,
                t => t.TorneoEquipos.Select(te => te.Equipo),
                t => t.TorneoGrupos.Select(tg => tg.Grupo),
                t => t.TorneoGrupos.Select(tg => tg.TorneoGrupoEquipo),
                t => t.Usuarios
                );
        }

        public static Torneo ObtenerUsuarios(int torneoId)
        {
            return Repository.Obtener(t => t.TorneoId == torneoId,
                t => t.Usuarios
                );
        }

        public static List<UsuariosPuntajeTorneo> UsuariosPuntajeFecha(int torneoId, string userName, int? fechaNumero)
        {
            return Repository.UsuariosPuntajeFecha(torneoId, userName, fechaNumero);
        }

        public static List<TorneoCompleto> Buscar(TorneoFiltroModel filtros)
        {
            return Repository.Buscar(filtros);
        }
    }
}