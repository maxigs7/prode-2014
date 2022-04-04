IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.EstadisticasEquipo_Torneo') AND type in (N'P', N'PC'))
DROP PROCEDURE dbo.EstadisticasEquipo_Torneo
GO

/* 
	TEST
----------------------------------------
EXEC dbo.EstadisticasEquipo_Torneo 
	1, --@TorneoId
	NULL, --@TorneoNombre
	NULL, --@GrupoId
	NULL  --@GrupoNombre

*/
CREATE PROCEDURE dbo.EstadisticasEquipo_Torneo
	@TorneoId INT = NULL,
	@TorneoNombre VARCHAR(50) = NULL,
	@GrupoId SMALLINT = NULL,
	@GrupoNombre VARCHAR(20) = NULL
AS
BEGIN

	SELECT EET.*		
	FROM dbo.EstadisticasEquipoTorneo(
		@TorneoId,
		@TorneoNombre,
		@GrupoId,
		@GrupoNombre
	) EET

END