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
    
    public partial class TipoTorneo
    {
        public TipoTorneo()
        {
            this.Torneos = new HashSet<Torneo>();
        }
    
        public short TipoTorneoId { get; set; }
        public string Nombre { get; set; }
        public bool TieneGrupos { get; set; }
        public bool PartidoUnicoPorGrupo { get; set; }
        public bool PartidoUnicoRonda { get; set; }
        public byte CantidadEquipos { get; set; }
        public Nullable<byte> CantidadGrupos { get; set; }
    
        public virtual ICollection<Torneo> Torneos { get; set; }
    }
}