//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Partido
    {
        public Partido()
        {
            this.Apuestas = new HashSet<Apuesta>();
        }
    
        public int PartidoId { get; set; }
        public int FechaNumero { get; set; }
        public System.DateTime FechaReal { get; set; }
        public Nullable<int> GolesLocal { get; set; }
        public Nullable<int> GolesVisitante { get; set; }
        public byte TipoApuestaId { get; set; }
        public int TorneoGrupoEquipoLocalId { get; set; }
        public int TorneoGrupoEquipoVisitanteId { get; set; }
    
        public virtual ICollection<Apuesta> Apuestas { get; set; }
        public virtual TipoApuesta TipoApuesta { get; set; }
        public virtual TorneoGrupoEquipo TorneoGrupoLocal { get; set; }
        public virtual TorneoGrupoEquipo TorneoGrupoVisitante { get; set; }
    }
}
