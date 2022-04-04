IF EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'TorneoUsuario' 
				AND I.COLUMN_NAME = 'UsuarioId'
				AND I.DATA_TYPE = 'int')
BEGIN

ALTER TABLE dbo.TorneoUsuario
	DROP CONSTRAINT PK_TorneoUsuario

ALTER TABLE dbo.TorneoUsuario
	ALTER COLUMN UsuarioId NVARCHAR(128) NOT NULL

ALTER TABLE dbo.TorneoUsuario 
	ADD CONSTRAINT PK_TorneoUsuario 
		PRIMARY KEY CLUSTERED (TorneoId,UsuarioId)

ALTER TABLE dbo.TorneoUsuario 
	ADD CONSTRAINT FK_TorneoUsuario_Usuario 
		FOREIGN KEY	(UsuarioId) 
		REFERENCES membresia.Usuario(UserId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 

END
