using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using MaxDev.Prode.Datos.Interfaces;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Datos.Repositorios
{
    public class UsuarioRepository: GenericRepository<Usuario>, IUsuarioRepository
    {
        public List<ApuestaFixtureCompleto> ApuestaUsuario(string userName, int torneoId, string torneoNombre,
            int? grupoId, string grupoNombre, int? fechaNumero)
        {
            return Context.ApuestaFixtureTorneo(userName, torneoId, torneoNombre, grupoId, grupoNombre, fechaNumero).ToList();
        }


        public async Task<bool> AsignarTorneo(string userName, string nombreTorneo)
        {
            var torneo = await Context.Torneos.FirstOrDefaultAsync(t => t.Nombre == nombreTorneo);
            var usuario = await Context.Usuarios.FirstOrDefaultAsync(u => u.UserName == userName);
            
            if (torneo == null || usuario == null) return false;

            usuario.Torneos.Add(torneo);
            try
            {
                Editar(usuario);
                await Context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}