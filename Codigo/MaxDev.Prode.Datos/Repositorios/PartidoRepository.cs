using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using MaxDev.Prode.Datos.Interfaces;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Datos.Repositorios
{
    public class PartidoRepository : GenericRepository<Partido>, IPartidoRepository
    {
        //public List<PartidoFechaCompleto> Obtener(int torneoId, int fechaNumero)
        //{
        //    var partidos = Context.PartidosPorFecha(torneoId, fechaNumero);

        //    return partidos.ToList();
        //}
    }
}