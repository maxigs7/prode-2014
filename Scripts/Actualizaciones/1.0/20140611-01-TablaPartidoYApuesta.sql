IF NOT EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'Partido' 
				AND I.COLUMN_NAME = 'TipoApuestaId')
BEGIN

ALTER TABLE dbo.Partido 
	ADD TipoApuestaId TINYINT NULL

ALTER TABLE dbo.Partido 
	ADD CONSTRAINT FK_Partido_TipoApuesta 
		FOREIGN KEY(TipoApuestaId) 
		REFERENCES dbo.TipoApuesta(TipoApuestaId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 

ALTER TABLE dbo.Apuesta
	DROP CONSTRAINT FK_Apuesta_TipoApuesta

ALTER TABLE dbo.Apuesta
	DROP COLUMN TipoApuestaId

END
GO

IF EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'Partido' 
				AND I.COLUMN_NAME = 'TipoApuestaId')
BEGIN

UPDATE P
SET TipoApuestaId = 1
FROM dbo.Partido P

ALTER TABLE dbo.Partido 
	ALTER COLUMN TipoApuestaId TINYINT NOT NULL

END
GO