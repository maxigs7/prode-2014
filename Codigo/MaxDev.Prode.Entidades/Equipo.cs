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
    
    public partial class Equipo
    {
        public Equipo()
        {
            this.TorneosEquipo = new HashSet<TorneoEquipo>();
        }
    
        public int EquipoId { get; set; }
        public string Nombre { get; set; }
        public string Abreviatura { get; set; }
        public string UrlEscudo { get; set; }
        public Nullable<bool> EsSeleccion { get; set; }
    
        public virtual ICollection<TorneoEquipo> TorneosEquipo { get; set; }
    }
}
