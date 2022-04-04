IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApuestaFixtureTorneo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ApuestaFixtureTorneo]
GO

/*
Test
SELECT * 
FROM [dbo].[ApuestaFixtureTorneo]('maxigs7',1, NULL, NULL, NULL, NULL)
*/

CREATE FUNCTION [dbo].[ApuestaFixtureTorneo](
	@UserName NVARCHAR(MAX),
	@TorneoId INT,
	@TorneoNombre VARCHAR(50),
	@GrupoId INT,
	@GrupoNombre VARCHAR(20), 
	@FechaNumero INT
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		TorneoId = T.TorneoId,
		ApuestaId = A.ApuestaId,
		FechaApuesta = A.FechaApuesta,
		FechaModificacion = A.FechaModificacion,
		ApuestaGolesLocal = A.GolesLocal,
		ApuestaGolesVisitante = A.GolesVisitante,
		PartidoId = FGT.PartidoId,
		GrupoId = FGT.GrupoId,
		Grupo = FGT.Grupo,
		FechaNumero = FGT.FechaNumero,
		FechaReal = FGT.FechaReal,
		Local = FGT.Local,
		EscudoLocal = FGT.EscudoLocal,
		Visitante = FGT.Visitante,
		EscudoVisitante = FGT.EscudoVisitante,
		GolesLocal = FGT.GolesLocal,
		GolesVisitante = FGT.GolesVisitante,
		PermiteApuesta = FGT.PermiteApuesta,
		ApuestaLocal = RA.ApuestaLocal,
		ApuestaVisitante = RA.ApuestaVisitante,
		ApuestaEmpate = RA.ApuestaEmpate,
		EvaluarGanador = FGT.EvaluarGanador,
		EvaluarLocal = FGT.EvaluarLocal,
		EvaluarVisitante = FGT.EvaluarVisitante,
		AcertoGanador = RA.AcertoGanador,
		AcertoLocal = RA.AcertoLocal,
		AcertoVisitante = RA.AcertoVisitante,
		Puntos = CASE WHEN RA.AcertoGanador = 1 THEN FGT.PuntosGanador ELSE 0 END + 
				 CASE WHEN RA.AcertoLocal = 1 THEN FGT.PuntosLocal ELSE 0 END +
				 CASE WHEN RA.AcertoVisitante = 1 THEN + FGT.PuntosVisitante ELSE 0 END,
		Orden = ROW_NUMBER() OVER(ORDER BY FGT.Fila ASC)
	FROM dbo.TorneoUsuario TU
		INNER JOIN dbo.Torneo T
			ON TU.TorneoId = T.TorneoId
		INNER JOIN membresia.Usuario U
			ON TU.UsuarioId = U.UserId
		CROSS APPLY dbo.FixtureGrupoTorneo(@TorneoId, @TorneoNombre, @GrupoId, @GrupoNombre, @FechaNumero) FGT
		LEFT JOIN dbo.Apuesta A
			ON FGT.PartidoId = A.PartidoId AND A.UsuarioId = U.UserId
		OUTER APPLY dbo.ResultadoApuesta(A.GolesLocal, A.GolesVisitante, 
										 FGT.GolesLocal, FGT.GolesVisitante, 
										 FGT.EvaluarGanador, FGT.EvaluarLocal, FGT.EvaluarVisitante) RA
	WHERE T.TorneoId = @TorneoId AND
		  (@UserName IS NULL OR U.UserName = @UserName)
)

