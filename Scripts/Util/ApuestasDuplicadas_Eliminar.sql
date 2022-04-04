IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ApuestasDuplicadas_Eliminar') AND type in (N'P', N'PC'))
DROP PROCEDURE dbo.ApuestasDuplicadas_Eliminar
GO

/*
 *	TEST
 *********************************
 EXEC dbo.ApuestasDuplicadas_Eliminar
 */

CREATE PROCEDURE dbo.ApuestasDuplicadas_Eliminar
AS
BEGIN
	
	DELETE A
	FROM Apuesta A
	WHERE A.ApuestaId NOT IN (
				SELECT MAX(A2.ApuestaId)
				FROM dbo.Apuesta A2
				GROUP BY A2.PartidoId, A2.UsuarioId)
		
END
GO