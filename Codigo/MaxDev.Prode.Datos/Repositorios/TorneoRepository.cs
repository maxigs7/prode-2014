using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using MaxDev.Prode.Datos.Interfaces;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Entidades.Filtros;

namespace MaxDev.Prode.Datos.Repositorios
{
    public class TorneoRepository: GenericRepository<Torneo>, ITorneoRepository
    {
        public List<TorneoCompleto> Buscar(TorneoFiltroModel filtros)
        {
            var listado = Context.TorneoBuscar(filtros.PalabrasBuscar,
                                               filtros.TorneoId,
                                               filtros.UrlAmigable,
                                               filtros.Activo,
                                               filtros.PageIndex,
                                               filtros.PageSize)
                                 .ToList();
            filtros.TotalRecords = listado.Any()? listado.First().TotalFilas.GetValueOrDefault() : 0;
            return listado;
        }

        public List<UsuariosPuntajeTorneo> UsuariosPuntajeFecha(int torneoId, string userName, int? fechaNumero)
        {
            var puntajes = Context.UsuariosPuntajeFecha(userName, torneoId, fechaNumero).ToList();
            return puntajes;
        }

        public List<Torneo> ObtenerPorUsuario(string userName)
        {
            var torneos = (from t in Context.Torneos
                           where t.Usuarios.Any(u => u.UserName == userName)
                           select t);

            return torneos.ToList();
        }

        public List<EstadisticasEquipoCompleto> EstadisticaTorneos(int torneoId, string torneoNombre, short? grupoId, string grupo)
        {
            return Context.EstadisticasEquipoTorneo(torneoId, torneoNombre, grupoId, grupo).ToList();
        }
    }
}