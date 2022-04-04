using System;

namespace MaxDev.Prode.Entidades.Models
{
    
    public class ApuestaModel
    {
        public int PartidoId { get; set; }

        public int? ApuestaId { get; set; }

        public string UsuarioId { get; set; }

        public DateTime? FechaApuesta { get; set; }

        public DateTime? FechaModificacion { get; set; }

        public int? Resultado { get; set; }

        public byte? GolesLocal { get; set; }

        public byte? GolesVisitante { get; set; }

        public bool EsValido
        {
            get
            {
                return Resultado.HasValue || (GolesLocal.HasValue && GolesVisitante.HasValue);
            }
        }

        public Apuesta ToApuesta()
        {
            if (!EsValido)
                return null;

            var apuesta = new Apuesta()
            {
                ApuestaId = ApuestaId.GetValueOrDefault(),
                PartidoId = PartidoId,
            };

            if (GolesLocal.HasValue && GolesVisitante.HasValue)
            {
                apuesta.GolesLocal = GolesLocal.GetValueOrDefault();
                apuesta.GolesVisitante = GolesVisitante.GetValueOrDefault();
            }
            else if (Resultado >= 1)
            {
                apuesta.GolesLocal = 1;
                apuesta.GolesVisitante = 0;
            }
            else if (Resultado <= -1)
            {
                apuesta.GolesLocal = 0;
                apuesta.GolesVisitante = 1;
            }
            else if (Resultado == 0)
            {
                apuesta.GolesLocal = 0;
                apuesta.GolesVisitante = 0;
            }

            return apuesta;
        }
    }
}
