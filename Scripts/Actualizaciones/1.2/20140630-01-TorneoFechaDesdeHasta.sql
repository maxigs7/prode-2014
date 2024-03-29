IF NOT EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'Torneo' 
				AND I.COLUMN_NAME = 'FechaFin')
BEGIN

ALTER TABLE dbo.Torneo
	ADD FechaFin DATETIME NULL

PRINT 'Se agregó la columna FechaFin en dbo.Torneo'
END
GO

IF EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'Torneo' 
				AND I.COLUMN_NAME = 'FechaFin')
BEGIN

UPDATE dbo.Torneo
SET FechaFin = '20140713 23:59'
WHERE TorneoId = 1

ALTER TABLE dbo.Torneo
	ALTER COLUMN FechaFin DATETIME NOT NULL

PRINT 'Se actualizo la FechaFin FIFA World Cup'

END
GO

