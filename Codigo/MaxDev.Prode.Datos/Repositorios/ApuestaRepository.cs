using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using MaxDev.Prode.Datos.Interfaces;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Datos.Repositorios
{
    public class ApuestaRepository : GenericRepository<Apuesta>, IApuestaRepository
    {
        public Apuesta Guardar(Apuesta apuesta)
        {
            if (apuesta.ApuestaId == 0)
            {
                apuesta.FechaApuesta = DateTime.Now;
                //Crear(apuesta);
            }
            else
            {
                var original = Obtener(m => m.ApuestaId == apuesta.ApuestaId);
                apuesta.FechaApuesta = original.FechaApuesta;
                apuesta.FechaModificacion = DateTime.Now;
                //Context.Entry(apuesta).State = EntityState.Modified;
            }
            
            Context.Apuestas.AddOrUpdate(apuesta);
            return apuesta;
        }
    }
}