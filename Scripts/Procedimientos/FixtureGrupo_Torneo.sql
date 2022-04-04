IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.FixtureGrupo_Torneo') AND type in (N'P', N'PC'))
DROP PROCEDURE dbo.FixtureGrupo_Torneo
GO

/* 
	TEST
----------------------------------------
EXEC dbo.FixtureGrupo_Torneo 
	1, --@TorneoId
	NULL, --@TorneoNombre
	NULL, --@GrupoId
	NULL, --@GrupoNombre
	NULL  --@FechaNumero

*/
CREATE PROCEDURE dbo.FixtureGrupo_Torneo
	@TorneoId INT = NULL,
	@TorneoNombre VARCHAR(50) = NULL,
	@GrupoId INT = NULL,
	@GrupoNombre VARCHAR(20) = NULL, 
	@FechaNumero INT = NULL
AS
BEGIN

	SELECT FGT.*		
	FROM dbo.[FixtureGrupoTorneo](
		@TorneoId,
		@TorneoNombre,
		@GrupoId,
		@GrupoNombre,
		@FechaNumero
	) FGT

END