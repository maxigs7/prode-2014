using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using MaxDev.Prode.Datos.Repositorios;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Negocio
{
    public class UsuarioNegocio : NegocioBase<UsuarioRepository>
    {
        public static List<ApuestaFixtureCompleto> ApuestaUsuario(string userName, int torneoId, string torneoNombre,
            int? grupoId, string grupoNombre, int? fechaNumero)
        {
            return Repository.ApuestaUsuario(userName, torneoId, torneoNombre, grupoId, grupoNombre, fechaNumero);
        }

        public static List<Usuario> Listado()
        {
            return Repository.Listado();
        }

        public static async Task<bool> AsignarTorneo(string userName, string nombreTorneo)
        {
            return await Repository.AsignarTorneo(userName, nombreTorneo);
        }

        public static Usuario Obtener(string username)
        {
            return Repository.Obtener(u => u.UserName == username, u => u.Torneos);
        }
    }
}