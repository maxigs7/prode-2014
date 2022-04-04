using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using MaxDev.Prode.Datos.Interfaces;
using MaxDev.Prode.Entidades;

namespace MaxDev.Prode.Datos.Repositorios
{
    public class GenericRepository<T> : IDisposable, IGenericRepository<T> where T : class
    {
        #region Properties

        private ProdeEntities _context;
        protected ProdeEntities Context
        {
            get
            {
                HttpContext httpContext = HttpContext.Current;

                if (_context == null)
                {
                    _context = new ProdeEntities();
                    _context.Configuration.ValidateOnSaveEnabled = false;
                    _context.Configuration.ProxyCreationEnabled = false;
                }

                if (httpContext == null)
                {
                    return _context;
                }

                if (!httpContext.Items.Contains("Contexto"))
                {
                    httpContext.Items["Contexto"] = _context;
                }

                return (ProdeEntities)httpContext.Items["Contexto"];
            }
        }

        private DbSet<T> _dbSet;
        protected DbSet<T> DbSet
        {
            get { return _dbSet ?? (_dbSet = Context.Set<T>()); }
        }

        #endregion

        #region GetAsync

        public virtual Task<List<T>> ListadoAsync(params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> query = DbSet;
            query = Includes(query, includeProperties);
            return query.ToListAsync();
        }

        public virtual Task<List<T>> BuscarAsync(Expression<Func<T, bool>> predicate,
            params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> query = DbSet.Where(predicate);
            query = Includes(query, includeProperties);
            return query.ToListAsync();
        }

        public virtual Task<T> ObtenerAsync(Expression<Func<T, bool>> predicate,
            params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> query = DbSet.Where(predicate);
            query = Includes(query, includeProperties);
            return query.FirstOrDefaultAsync();
        }

        #endregion

        #region Get

        public virtual List<T> Listado(params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> query = DbSet;
            query = Includes(query, includeProperties);
            return query.ToList();
        }

        public virtual List<T> Buscar(Expression<Func<T, bool>> predicate,
            params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> query = DbSet.Where(predicate);
            query = Includes(query, includeProperties);
            return query.ToList();
        }

        public virtual T Obtener(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> query = DbSet.Where(predicate);
            query = Includes(query, includeProperties);
            return query.FirstOrDefault();
        }

        #endregion

        #region CRUD

        public virtual T Crear(T entity)
        {
            return DbSet.Add(entity);
        }

        public virtual void Eliminar(T entity)
        {
            Context.Entry(entity).State = EntityState.Deleted;
        }

        public virtual T Editar(T entity)
        {
            Context.Entry(entity).State = EntityState.Modified;
            return entity;
        }

        #endregion

        #region Entity Framework Util

        public virtual bool GuardarCambios()
        {
            return Context.SaveChanges() > 0;
        }

        public virtual Task<int> GuardarCambiosAsync()
        {
            return Context.SaveChangesAsync();
        }

        protected IQueryable<T> Includes(IQueryable<T> query, params Expression<Func<T, object>>[] includeProperties)
        {
            foreach (var includeProperty in includeProperties)
            {
                query = query.Include(includeProperty);
            }

            return query;
        }

        #endregion

        #region Dispose

        private bool _disposed;

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    if (_context != null)
                    {
                        _context.Dispose();
                        _context = null;
                    }
                }
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        ~GenericRepository()
        {
            Dispose(true);
        }

        #endregion
    }
}