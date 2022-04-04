IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Usuario_Eliminar') AND type in (N'P', N'PC'))
DROP PROCEDURE dbo.Usuario_Eliminar
GO

/*
 *	TEST
 *********************************
 EXEC dbo.Usuario_Eliminar 'fernandezja'
 */

CREATE PROCEDURE dbo.Usuario_Eliminar
	@UserName NVARCHAR(MAX)
AS
BEGIN
	SET XACT_ABORT ON

	BEGIN TRY

		BEGIN TRANSACTION

		DECLARE @UserId NVARCHAR(128) = (SELECT TOP 1 U.UserId FROM membresia.Usuario U WHERE U.UserName = @UserName)

		DELETE A
		FROM Apuesta A 
		WHERE A.UsuarioId = @UserId

		DELETE TU
		FROM TorneoUsuario TU
		WHERE TU.UsuarioId = @UserId

		DELETE UL
		FROM membresia.UsuarioLogin UL
		WHERE UL.UserId = @UserId

		DELETE UR
		FROM membresia.UsuarioRol UR
		WHERE UR.UserId = @UserId

		DELETE UR
		FROM membresia.UsuarioReclamo UR
		WHERE UR.UserId = @UserId

		DELETE U
		FROM membresia.Usuario U
		WHERE U.UserId = @UserId

		PRINT 'El usuario ' + @UserName + ' se ha eliminado correctamente'

		COMMIT TRANSACTION

		SELECT (CONVERT(BIT, 1))	
		
	END TRY

	BEGIN CATCH

		-- Obtener info del error
	    --EXECUTE Error_Info

		-- Grabar en variables
		-- Despues del ROLLBACK Escribir en una tabla de track de Errores
		
		-- Test XACT_STATE:
			-- If  1, the transaction is committable.
			-- If -1, the transaction is uncommittable and should be rolled back.
			-- If  0, there is no transaction and a commit or rollback operation would generate an error.

		IF (XACT_STATE()) = -1
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'Ha ocurrido un error al intentar eliminar el usuario ' + @UserName
		END

	    IF (XACT_STATE()) = 1
		BEGIN
			COMMIT TRANSACTION
			PRINT 'El usuario ' + @UserName + ' se ha eliminado correctamente'
		END
		
		SELECT (CONVERT(BIT, 0))	
		
	END CATCH
END
GO