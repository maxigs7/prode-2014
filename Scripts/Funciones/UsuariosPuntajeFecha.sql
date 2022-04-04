IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuariosPuntajeFecha]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[UsuariosPuntajeFecha]
GO

/* 
	TEST
----------------------------------------
SELECT Posicion = Orden, UserName, Puntos  FROM dbo.UsuariosPuntajeFecha(NULL, 1, 1)

*/
CREATE FUNCTION dbo.UsuariosPuntajeFecha
(
	@UserName NVARCHAR(MAX),
	@TorneoId INT,
	@FechaNumero INT
)
RETURNS TABLE
AS
RETURN 
(
	SELECT 
		T.TorneoId,
		Torneo = T.Nombre,
		U.UserName,
		Apuestas.FechaNumero,
		Puntos = ISNULL(SUM(Apuestas.Puntos),0),
		Orden = ROW_NUMBER() OVER(ORDER BY ISNULL(SUM(Apuestas.Puntos),0) DESC)
	FROM dbo.TorneoUsuario TU
		INNER JOIN dbo.Torneo T
			ON TU.TorneoId = T.TorneoId
		INNER JOIN membresia.Usuario U
			ON TU.UsuarioId = U.UserId
		CROSS APPLY dbo.ApuestaFixtureTorneo(U.UserName, T.TorneoId, NULL, NULL, NULL, @FechaNumero) Apuestas
	WHERE T.TorneoId = @TorneoId AND 
		  (@UserName IS NULL OR U.UserName = @UserName)
	GROUP BY T.TorneoId, T.Nombre, U.UserName, Apuestas.FechaNumero
				
)