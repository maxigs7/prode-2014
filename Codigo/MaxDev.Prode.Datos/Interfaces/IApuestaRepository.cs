using System.Collections.Generic;
using System.Threading.Tasks;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Datos.Interfaces
{
    public interface IApuestaRepository
    {
        Apuesta Guardar(Apuesta apuesta);
    }
}