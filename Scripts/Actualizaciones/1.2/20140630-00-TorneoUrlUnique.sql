IF NOT EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'Torneo' 
				AND I.COLUMN_NAME = 'UrlAmigable')
BEGIN

ALTER TABLE dbo.Torneo
	ADD UrlAmigable VARCHAR(100) NULL

PRINT 'Se agregó la columna UrlAmigable en dbo.Torneo'
END
GO

IF EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'Torneo' 
				AND I.COLUMN_NAME = 'UrlAmigable')
BEGIN

UPDATE dbo.Torneo
SET UrlAmigable = '2014-FIFA-World-Cup'
WHERE TorneoId = 1

ALTER TABLE dbo.Torneo
	ALTER COLUMN UrlAmigable VARCHAR(100) NOT NULL

PRINT 'Se actualizo la url del torneo FIFA World Cup'

END
GO

IF NOT EXISTS(SELECT 1
			  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			  WHERE CONSTRAINT_NAME ='AK_TorneoUrl')
BEGIN

ALTER TABLE dbo.Torneo 
	ADD CONSTRAINT AK_TorneoUrl
		UNIQUE (UrlAmigable) 

PRINT 'Se agregó clave unica para la UrlAmigable'

END
GO
