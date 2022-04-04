using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MaxDev.Prode.Datos.Interfaces
{
    public interface IGenericRepository<T> where T : class
    {
        Task<List<T>> ListadoAsync(params Expression<Func<T, object>>[] includeProperties);
        Task<List<T>> BuscarAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);
        Task<T> ObtenerAsync(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);

        List<T> Listado(params Expression<Func<T, object>>[] includeProperties);
        List<T> Buscar(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);
        T Obtener(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties);

        T Crear(T entity);
        void Eliminar(T entity);
        T Editar(T entity);

        Task<int> GuardarCambiosAsync();
        bool GuardarCambios();
    }
}
