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
    
    public partial class TorneoEquipo
    {
        public TorneoEquipo()
        {
            this.TorneoGrupoEquipo = new HashSet<TorneoGrupoEquipo>();
        }
    
        public int TorneoId { get; set; }
        public int EquipoId { get; set; }
    
        public virtual Equipo Equipo { get; set; }
        public virtual Torneo Torneo { get; set; }
        public virtual ICollection<TorneoGrupoEquipo> TorneoGrupoEquipo { get; set; }
    }
}
