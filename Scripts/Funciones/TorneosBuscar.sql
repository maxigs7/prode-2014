IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TorneoBuscar]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[TorneoBuscar]
GO

/*
Test
SELECT * 
FROM [dbo].[TorneoBuscar](1, NULL)
*/

CREATE FUNCTION [dbo].[TorneoBuscar](
	@PalabraBuscar varchar(50) = NULL,
	@TorneoId int = NULL,
	@UrlAmigable varchar(100) = NULL,
	@Activo bit = NULL,
	-- PAGINADO
	@PaginadoFilaDesde int = 0,			--> Esto para el OFFSET, es desde donde comienza a “no tener en cuenta”
	@PaginadoFilaCantidad int = 10		--> Para el FETCH es la cantidad que tomara después del OFFSET
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		TorneoId = T.TorneoId,
		Nombre = T.Nombre,
		UrlAmigable = T.UrlAmigable,
		Activo = CASE WHEN T.FechaFin >= dbo.Getdate() THEN CONVERT(BIT, 1) ELSE CONVERT(BIT, 0) END,
		TotalFilas = COUNT(T.TorneoId) OVER(),
		Fila = ROW_NUMBER() OVER (ORDER BY T.Nombre ASC, T.FechaFin DESC)
	FROM dbo.Torneo T
	WHERE (@TorneoId IS NULL OR T.TorneoId = @TorneoId) AND
		  (@UrlAmigable IS NULL OR T.UrlAmigable = @UrlAmigable) AND
		  (@PalabraBuscar IS NULL OR 
				(T.Nombre LIKE '%'+@PalabraBuscar+'%'))
	ORDER BY Fila
	OFFSET @PaginadoFilaDesde ROWS
	FETCH NEXT @PaginadoFilaCantidad ROWS ONLY
)

