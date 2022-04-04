IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadisticasEquipoTorneo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[EstadisticasEquipoTorneo]
GO

/* 
	TEST
----------------------------------------
SELECT * FROM dbo.EstadisticasEquipoTorneo(1, NULL, NULL, NULL)

*/
CREATE FUNCTION dbo.EstadisticasEquipoTorneo
(
	@TorneoId INT,
	@TorneoNombre VARCHAR(50),
	@GrupoId SMALLINT,
	@GrupoNombre VARCHAR(20)
)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		Posicion = ROW_NUMBER() OVER(PARTITION BY G.GrupoId 
									 ORDER BY G.GrupoId DESC, PTS.Valor DESC, PP.Estadistica ASC, GF.Estadistica DESC, GC.Estadistica ASC),
		TorneoGrupoEquipoId = TGE.TorneoGrupoEquipoId,
		TorneoId = T.TorneoId,
		GrupoId = G.GrupoId,
		Grupo = G.Nombre,
		EquipoId = E.EquipoId,
		Escudo = E.UrlEscudo,
		Equipo = E.Nombre,
		Abreviatura = E.Abreviatura,
		PartidosJugados = PJ.Estadistica,
		PartidosGanados = PG.Estadistica,
		PartidosEmpatados = PE.Estadistica,
		PartidosPerdidos = PP.Estadistica,
		GolesFavor = GF.Estadistica,
		GolesContra = GC.Estadistica,
		Puntos = (PG.Estadistica * 3 + PE.Estadistica)
		
	FROM dbo.Torneo T
		INNER JOIN dbo.TorneoGrupoEquipo TGE
			ON T.TorneoId = TGE.TorneoId
		INNER JOIN dbo.Equipo E
			ON TGE.EquipoId = E.EquipoId
		INNER JOIN dbo.Grupo G
			ON TGE.GrupoId = G.GrupoId
		CROSS APPLY dbo.TablasTorneoEquipo(T.TorneoId, TGE.TorneoGrupoEquipoId, 'PJ') PJ
		CROSS APPLY dbo.TablasTorneoEquipo(T.TorneoId, TGE.TorneoGrupoEquipoId, 'PG') PG
		CROSS APPLY dbo.TablasTorneoEquipo(T.TorneoId, TGE.TorneoGrupoEquipoId, 'PE') PE
		CROSS APPLY dbo.TablasTorneoEquipo(T.TorneoId, TGE.TorneoGrupoEquipoId, 'PP') PP
		CROSS APPLY dbo.TablasTorneoEquipo(T.TorneoId, TGE.TorneoGrupoEquipoId, 'GF') GF
		CROSS APPLY dbo.TablasTorneoEquipo(T.TorneoId, TGE.TorneoGrupoEquipoId, 'GC') GC
		CROSS APPLY(SELECT Valor = (PG.Estadistica * 3 + PE.Estadistica)) PTS			
	WHERE (@TorneoId IS NULL OR T.TorneoId = @TorneoId)
		  AND (@TorneoNombre IS NULL OR T.Nombre = @TorneoNombre)
		  AND (@GrupoId IS NULL OR G.GrupoId = @GrupoId)
		  AND (@GrupoNombre IS NULL OR G.Nombre = @GrupoNombre)
)