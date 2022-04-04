IF NOT EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'TipoApuesta' 
				AND I.COLUMN_NAME = 'ApuestaGolesLocal')
BEGIN


CREATE TABLE dbo.Tmp_TipoApuesta
	(
	TipoApuestaId tinyint NOT NULL,
	ApuestaGolesLocal bit NOT NULL,
	ApuestaGolesVisitante bit NOT NULL,
	ApuestaGanador bit NOT NULL,
	PuntosGolesLocal tinyint NOT NULL,
	PuntosGolesVisitante tinyint NULL,
	PuntosGanador tinyint NOT NULL,
	PuntosBonus tinyint NOT NULL,
	TiempoLimite int NOT NULL
	)  ON [PRIMARY]

ALTER TABLE dbo.Apuesta
	DROP CONSTRAINT FK_Apuesta_TipoApuesta

DROP TABLE dbo.TipoApuesta

EXECUTE sp_rename N'dbo.Tmp_TipoApuesta', N'TipoApuesta', 'OBJECT' 

ALTER TABLE dbo.TipoApuesta ADD CONSTRAINT
	PK_TipoApuesta PRIMARY KEY CLUSTERED 
	(
	TipoApuestaId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

ALTER TABLE dbo.Apuesta 
	ADD CONSTRAINT FK_Apuesta_TipoApuesta 
		FOREIGN KEY(TipoApuestaId) 
		REFERENCES dbo.TipoApuesta(TipoApuestaId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 

END
GO

IF EXISTS(SELECT 1
		  FROM INFORMATION_SCHEMA.COLUMNS I
		  WHERE I.TABLE_NAME = 'TipoApuesta' 
				AND I.COLUMN_NAME = 'ApuestaGolesLocal') 
BEGIN

INSERT INTO dbo.TipoApuesta(TipoApuestaId,ApuestaGolesLocal,ApuestaGolesVisitante,ApuestaGanador,PuntosGolesLocal,PuntosGolesVisitante,PuntosGanador,PuntosBonus,TiempoLimite)
VALUES(1,0,0,1,0,0,1,0,60),(2,1,1,1,1,1,1,0,60)

END

