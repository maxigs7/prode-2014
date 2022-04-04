using System.Collections.Generic;
using System.Threading.Tasks;
using MaxDev.Prode.Entidades;
using MaxDev.Prode.Entidades.Filtros;

namespace MaxDev.Prode.Datos.Interfaces
{
    public interface ITorneoRepository
    {
        List<TorneoCompleto> Buscar(TorneoFiltroModel filtros);
        List<UsuariosPuntajeTorneo> UsuariosPuntajeFecha(int torneoId, string userName, int? fechaNumero);
        List<Torneo> ObtenerPorUsuario(string userName);

        List<EstadisticasEquipoCompleto> EstadisticaTorneos(int torneoId, string torneoNombre, short? grupoId,
            string grupo);
    }
}