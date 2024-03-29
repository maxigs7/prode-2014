﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MaxDev.Prode.Entidades
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ProdeEntities : DbContext
    {
        public ProdeEntities()
            : base("name=ProdeEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Equipo> Equipos { get; set; }
        public virtual DbSet<Apuesta> Apuestas { get; set; }
        public virtual DbSet<Grupo> Grupos { get; set; }
        public virtual DbSet<Partido> Partidos { get; set; }
        public virtual DbSet<TipoApuesta> TiposApuesta { get; set; }
        public virtual DbSet<TipoTorneo> TiposTorneo { get; set; }
        public virtual DbSet<Torneo> Torneos { get; set; }
        public virtual DbSet<TorneoEquipo> TorneoEquipos { get; set; }
        public virtual DbSet<TorneoGrupo> TorneoGrupos { get; set; }
        public virtual DbSet<TorneoGrupoEquipo> TorneoGrupoEquipos { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }
    
        public virtual ObjectResult<ApuestaFixtureCompleto> ApuestaFixtureTorneo(string userId, Nullable<int> torneoId, string torneoNombre, Nullable<int> grupoId, string grupoNombre, Nullable<int> fechaNumero)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            var torneoIdParameter = torneoId.HasValue ?
                new ObjectParameter("TorneoId", torneoId) :
                new ObjectParameter("TorneoId", typeof(int));
    
            var torneoNombreParameter = torneoNombre != null ?
                new ObjectParameter("TorneoNombre", torneoNombre) :
                new ObjectParameter("TorneoNombre", typeof(string));
    
            var grupoIdParameter = grupoId.HasValue ?
                new ObjectParameter("GrupoId", grupoId) :
                new ObjectParameter("GrupoId", typeof(int));
    
            var grupoNombreParameter = grupoNombre != null ?
                new ObjectParameter("GrupoNombre", grupoNombre) :
                new ObjectParameter("GrupoNombre", typeof(string));
    
            var fechaNumeroParameter = fechaNumero.HasValue ?
                new ObjectParameter("FechaNumero", fechaNumero) :
                new ObjectParameter("FechaNumero", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ApuestaFixtureCompleto>("ApuestaFixtureTorneo", userIdParameter, torneoIdParameter, torneoNombreParameter, grupoIdParameter, grupoNombreParameter, fechaNumeroParameter);
        }
    
        public virtual ObjectResult<EstadisticasEquipoCompleto> EstadisticasEquipoTorneo(Nullable<int> torneoId, string torneoNombre, Nullable<short> grupoId, string grupoNombre)
        {
            var torneoIdParameter = torneoId.HasValue ?
                new ObjectParameter("TorneoId", torneoId) :
                new ObjectParameter("TorneoId", typeof(int));
    
            var torneoNombreParameter = torneoNombre != null ?
                new ObjectParameter("TorneoNombre", torneoNombre) :
                new ObjectParameter("TorneoNombre", typeof(string));
    
            var grupoIdParameter = grupoId.HasValue ?
                new ObjectParameter("GrupoId", grupoId) :
                new ObjectParameter("GrupoId", typeof(short));
    
            var grupoNombreParameter = grupoNombre != null ?
                new ObjectParameter("GrupoNombre", grupoNombre) :
                new ObjectParameter("GrupoNombre", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EstadisticasEquipoCompleto>("EstadisticasEquipoTorneo", torneoIdParameter, torneoNombreParameter, grupoIdParameter, grupoNombreParameter);
        }
    
        public virtual ObjectResult<FixtureGrupoCompleto> FixtureGrupoTorneo(Nullable<int> torneoId, string torneoNombre, Nullable<int> grupoId, string grupoNombre, Nullable<int> fechaNumero)
        {
            var torneoIdParameter = torneoId.HasValue ?
                new ObjectParameter("TorneoId", torneoId) :
                new ObjectParameter("TorneoId", typeof(int));
    
            var torneoNombreParameter = torneoNombre != null ?
                new ObjectParameter("TorneoNombre", torneoNombre) :
                new ObjectParameter("TorneoNombre", typeof(string));
    
            var grupoIdParameter = grupoId.HasValue ?
                new ObjectParameter("GrupoId", grupoId) :
                new ObjectParameter("GrupoId", typeof(int));
    
            var grupoNombreParameter = grupoNombre != null ?
                new ObjectParameter("GrupoNombre", grupoNombre) :
                new ObjectParameter("GrupoNombre", typeof(string));
    
            var fechaNumeroParameter = fechaNumero.HasValue ?
                new ObjectParameter("FechaNumero", fechaNumero) :
                new ObjectParameter("FechaNumero", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FixtureGrupoCompleto>("FixtureGrupoTorneo", torneoIdParameter, torneoNombreParameter, grupoIdParameter, grupoNombreParameter, fechaNumeroParameter);
        }
    
        [DbFunction("ProdeEntities", "UsuariosPuntajeFecha")]
        public virtual IQueryable<UsuariosPuntajeTorneo> UsuariosPuntajeFecha(string userName, Nullable<int> torneoId, Nullable<int> fechaNumero)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var torneoIdParameter = torneoId.HasValue ?
                new ObjectParameter("TorneoId", torneoId) :
                new ObjectParameter("TorneoId", typeof(int));
    
            var fechaNumeroParameter = fechaNumero.HasValue ?
                new ObjectParameter("FechaNumero", fechaNumero) :
                new ObjectParameter("FechaNumero", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<UsuariosPuntajeTorneo>("[ProdeEntities].[UsuariosPuntajeFecha](@UserName, @TorneoId, @FechaNumero)", userNameParameter, torneoIdParameter, fechaNumeroParameter);
        }
    
        public virtual ObjectResult<TorneoCompleto> TorneoBuscar(string palabraBuscar, Nullable<int> torneoId, string urlAmigable, Nullable<bool> activo, Nullable<int> pageIndex, Nullable<int> pageSize)
        {
            var palabraBuscarParameter = palabraBuscar != null ?
                new ObjectParameter("PalabraBuscar", palabraBuscar) :
                new ObjectParameter("PalabraBuscar", typeof(string));
    
            var torneoIdParameter = torneoId.HasValue ?
                new ObjectParameter("TorneoId", torneoId) :
                new ObjectParameter("TorneoId", typeof(int));
    
            var urlAmigableParameter = urlAmigable != null ?
                new ObjectParameter("UrlAmigable", urlAmigable) :
                new ObjectParameter("UrlAmigable", typeof(string));
    
            var activoParameter = activo.HasValue ?
                new ObjectParameter("Activo", activo) :
                new ObjectParameter("Activo", typeof(bool));
    
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("PageIndex", pageIndex) :
                new ObjectParameter("PageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("PageSize", pageSize) :
                new ObjectParameter("PageSize", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<TorneoCompleto>("TorneoBuscar", palabraBuscarParameter, torneoIdParameter, urlAmigableParameter, activoParameter, pageIndexParameter, pageSizeParameter);
        }
    }
}
