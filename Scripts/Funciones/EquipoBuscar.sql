IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipoBuscar]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[EquipoBuscar]
GO

/*
Test
SELECT * 
FROM [dbo].[EquipoBuscar](1, NULL)
*/

CREATE FUNCTION [dbo].[EquipoBuscar](
	@EquipoId int = NULL
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		EquipoId = E.EquipoId,
		Nombre = E.Nombre,
		Abreviatura = E.Abreviatura,
		UrlEscudo = E.UrlEscudo,
		EsSeleccion = E.EsSeleccion
	FROM dbo.Equipo E
	WHERE (@EquipoId IS NULL OR E.EquipoId = @EquipoId)
)

