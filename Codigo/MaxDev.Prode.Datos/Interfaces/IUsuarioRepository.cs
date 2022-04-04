using System.Collections.Generic;
using System.Threading.Tasks;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Datos.Interfaces
{
    public interface IUsuarioRepository
    {
        List<ApuestaFixtureCompleto> ApuestaUsuario(string userId, int torneoId, string torneoNombre,
            int? grupoId, string grupoNombre, int? fechaNumero);
        Task<bool> AsignarTorneo(string userName, string nombreTorneo);
    }
}