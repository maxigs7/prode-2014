IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FixtureGrupoTorneo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[FixtureGrupoTorneo]
GO

/*
Test
SELECT * 
FROM [dbo].[FixtureGrupoTorneo](1, NULL, 9, NULL, NULL)
*/

CREATE FUNCTION [dbo].[FixtureGrupoTorneo](
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
		Torneo = T.Nombre,
		PartidoId = P.PartidoId,
		GrupoId = G.GrupoId,
		Grupo = G.Nombre,
		FechaNumero = P.FechaNumero,
		FechaReal = P.FechaReal,
		Local = Local.Nombre,
		EscudoLocal = Local.UrlEscudo,
		Visitante = Visitante.Nombre,
		EscudoVisitante = Visitante.UrlEscudo,
		GolesLocal = P.GolesLocal,
		GolesVisitante = P.GolesVisitante,
		PermiteApuesta = (CASE 
							WHEN DATEADD(MINUTE, -(TA.TiempoLimite), FechaReal) > dbo.GETDATE()
							THEN CONVERT(BIT, 1) 
							ELSE  CONVERT(BIT,0) 
						  END),
		EvaluarGanador = TA.ApuestaGanador,
		EvaluarLocal = TA.ApuestaGolesLocal,
		EvaluarVisitante = TA.ApuestaGolesVisitante,
		PuntosGanador = TA.PuntosGanador,
		PuntosLocal = TA.PuntosGolesLocal,
		PuntosVisitante = TA.PuntosGolesVisitante,
		TiempoLimite = TA.TiempoLimite,
		Fila =  ROW_NUMBER() OVER (ORDER BY G.Nombre ASC, P.FechaNumero ASC, P.FechaReal ASC)
	FROM dbo.Partido P
		INNER JOIN dbo.TorneoGrupoEquipo TGL
			ON P.TorneoGrupoEquipoLocalId = TGL.TorneoGrupoEquipoId
		INNER JOIN dbo.TorneoGrupoEquipo TGV
			ON P.TorneoGrupoEquipoVisitanteId = TGV.TorneoGrupoEquipoId

		INNER JOIN dbo.Torneo T
			ON TGL.TorneoId = T.TorneoId
		INNER JOIN dbo.TipoTorneo TT
			ON T.TipoTorneoId = TT.TipoTorneoId

		INNER JOIN Grupo G
			ON TGL.GrupoId = G.GrupoId
		
		CROSS APPLY dbo.EquipoBuscar(TGL.EquipoId) Local
		CROSS APPLY dbo.EquipoBuscar(TGV.EquipoId) Visitante
		
		INNER JOIN dbo.TipoApuesta TA
			ON P.TipoApuestaId = TA.TipoApuestaId
		
	WHERE T.TorneoId = @TorneoId
		  AND (@TorneoNombre IS NULL OR T.Nombre = @TorneoNombre)
		  AND (@GrupoId IS NULL OR G.GrupoId = @GrupoId)
		  AND (@FechaNumero IS NULL OR P.FechaNumero = @FechaNumero)
)

