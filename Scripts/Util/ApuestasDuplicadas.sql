IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApuestasDuplicadas]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].ApuestasDuplicadas
GO

/*
Test
SELECT * 
FROM [dbo].[ApuestasDuplicadas]()
*/

CREATE FUNCTION [dbo].[ApuestasDuplicadas]()
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		A.UsuarioId,
		U.Username,
		A.PartidoId,
		Duplicados = COUNT(A.UsuarioId)
	FROM dbo.Apuesta A
		INNER JOIN membresia.Usuario U
			ON A.UsuarioId = U.UserId
	GROUP BY A.UsuarioId, A.PartidoId, U.Username
	HAVING COUNT(A.UsuarioId) > 1
)

