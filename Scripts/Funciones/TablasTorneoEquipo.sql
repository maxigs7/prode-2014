IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TablasTorneoEquipo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[TablasTorneoEquipo]
GO

/* 
	TEST
----------------------------------------
SELECT * FROM dbo.TablasTorneoEquipo(1,1, 'PG')

*/
CREATE FUNCTION dbo.TablasTorneoEquipo
(
	@TorneoId INT,
	@TorneoGrupoEquipoId INT,
	@TipoEstadistica CHAR(2)
)
RETURNS TABLE
AS
RETURN 
(
	SELECT 
		Estadistica = CASE 
						WHEN (@TipoEstadistica = 'GF') 
						THEN ISNULL(SUM(CASE 
										WHEN (P.TorneoGrupoEquipoLocalId = @TorneoGrupoEquipoId) THEN P.GolesLocal
										WHEN (P.TorneoGrupoEquipoVisitanteId = @TorneoGrupoEquipoId) THEN P.GolesVisitante
										ELSE 0
										END), 0)
						WHEN (@TipoEstadistica = 'GC') 
						THEN ISNULL(SUM(CASE 
										WHEN (P.TorneoGrupoEquipoLocalId = @TorneoGrupoEquipoId) THEN P.GolesVisitante
										WHEN (P.TorneoGrupoEquipoVisitanteId = @TorneoGrupoEquipoId) THEN P.GolesLocal
										ELSE 0
										END), 0)
						ELSE COUNT(P.PartidoId)
					END
	FROM dbo.Partido P
		INNER JOIN dbo.TorneoGrupoEquipo TGL
			ON P.TorneoGrupoEquipoLocalId = TGL.TorneoGrupoEquipoId
	WHERE TGL.TorneoId = @TorneoId
		  AND (P.TorneoGrupoEquipoLocalId = @TorneoGrupoEquipoId OR P.TorneoGrupoEquipoVisitanteId = @TorneoGrupoEquipoId)
		  AND (P.GolesLocal IS NOT NULL AND P.GolesVisitante IS NOT NULL)
		  AND ((@TipoEstadistica = 'GF' OR @TipoEstadistica = 'GC')
			    OR (@TipoEstadistica = 'PJ')
				OR (@TipoEstadistica = 'PG' AND
						((P.TorneoGrupoEquipoLocalId = @TorneoGrupoEquipoId AND P.GolesLocal > P.GolesVisitante) OR
						(P.TorneoGrupoEquipoVisitanteId = @TorneoGrupoEquipoId AND P.GolesVisitante > P.GolesLocal)))
				OR (@TipoEstadistica = 'PE' AND
						(P.GolesLocal = P.GolesVisitante))
				OR (@TipoEstadistica = 'PP' AND
						((P.TorneoGrupoEquipoLocalId = @TorneoGrupoEquipoId AND P.GolesLocal < P.GolesVisitante) OR
						(P.TorneoGrupoEquipoVisitanteId = @TorneoGrupoEquipoId AND P.GolesVisitante < P.GolesLocal)))
			   )
				
)