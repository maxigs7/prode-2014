IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Torneo_Buscar') AND type in (N'P', N'PC'))
DROP PROCEDURE dbo.Torneo_Buscar
GO

/* 
	TEST
----------------------------------------
DECLARE @TotalRecords INT
EXEC dbo.Torneo_Buscar 
	NULL,--@PalabraBuscar varchar(50) = NULL,
	NULL,--@TorneoId int = NULL,
	NULL,--@UrlAmigable varchar(100) = NULL,
	NULL,--@Activo bit = NULL,
	1,--@PageIndex int,
	10,--@PageSize int,
	@TotalRecords --int out

*/
CREATE PROCEDURE dbo.Torneo_Buscar
	@PalabraBuscar varchar(50) = NULL,
	@TorneoId int = NULL,
	@UrlAmigable varchar(100) = NULL,
	@Activo bit = NULL,

	@PageIndex int,
	@PageSize int
AS

DECLARE	@PrimerRegistro int,
		@UltimoRegistro int
BEGIN

	SET NOCOUNT ON;	

	--Seleccionando el primer y ultimo registro de la pagina, dependiendo del tamaño de pagina
	SELECT	@PrimerRegistro = (@PageIndex - 1) * @PageSize + 1,
			@UltimoRegistro = (@PageIndex - 1) * @PageSize + @PageSize;

	SELECT T.*
	FROM dbo.TorneoBuscar(
						@PalabraBuscar,
						@TorneoId,
						@UrlAmigable,
						@Activo,
						@PrimerRegistro-1,
						@PageSize) T
	WHERE T.Fila BETWEEN @PrimerRegistro AND @UltimoRegistro

END