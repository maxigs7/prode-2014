IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ApuestaFixture_Torneo') AND type in (N'P', N'PC'))
DROP PROCEDURE dbo.ApuestaFixture_Torneo
GO

/* 
	TEST
----------------------------------------
EXEC dbo.ApuestaFixture_Torneo 
	'd4c2adef-5c06-4aab-861b-03636a85b42f', --@UserId NVARCHAR(128),
	1, --@TorneoId INT,
	NULL, --@TorneoNombre VARCHAR(50),
	NULL, --@GrupoId INT,
	NULL, --@GrupoNombre VARCHAR(20), 
	NULL --@FechaNumero INT

*/
CREATE PROCEDURE dbo.ApuestaFixture_Torneo
	@UserId NVARCHAR(128),
	@TorneoId INT,
	@TorneoNombre VARCHAR(50),
	@GrupoId INT,
	@GrupoNombre VARCHAR(20), 
	@FechaNumero INT
AS
BEGIN

	SELECT AFT.*		
	FROM dbo.ApuestaFixtureTorneo(
		@UserId,
		@TorneoId,
		@TorneoNombre,
		@GrupoId,
		@GrupoNombre,
		@FechaNumero 
	) AFT

END