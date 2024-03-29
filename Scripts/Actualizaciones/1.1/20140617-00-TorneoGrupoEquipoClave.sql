BEGIN TRANSACTION

ALTER TABLE dbo.TorneoGrupoEquipo
	DROP CONSTRAINT FK_TorneoGrupoEquipo_TorneoGrupo
GO

ALTER TABLE dbo.TorneoGrupoEquipo
	DROP CONSTRAINT FK_TorneoGrupoEquipo_TorneoEquipo
GO

CREATE TABLE dbo.Tmp_TorneoGrupoEquipo
	(
	TorneoGrupoEquipoId int NOT NULL IDENTITY (1, 1),
	TorneoId int NOT NULL,
	GrupoId smallint NOT NULL,
	EquipoId int NOT NULL
	)  ON [PRIMARY]
GO

SET IDENTITY_INSERT dbo.Tmp_TorneoGrupoEquipo OFF
GO

IF EXISTS(SELECT * FROM dbo.TorneoGrupoEquipo)
	 EXEC('INSERT INTO dbo.Tmp_TorneoGrupoEquipo (TorneoId, GrupoId, EquipoId)
		SELECT TorneoId, GrupoId, EquipoId FROM dbo.TorneoGrupoEquipo WITH (HOLDLOCK TABLOCKX)')
GO

DROP TABLE dbo.TorneoGrupoEquipo
GO

EXECUTE sp_rename N'dbo.Tmp_TorneoGrupoEquipo', N'TorneoGrupoEquipo', 'OBJECT' 
GO

ALTER TABLE dbo.TorneoGrupoEquipo 
	ADD CONSTRAINT PK_TorneoGrupoEquipo 
		PRIMARY KEY CLUSTERED (TorneoGrupoEquipoId) 
	WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE dbo.TorneoGrupoEquipo 
	ADD CONSTRAINT FK_TorneoGrupoEquipo_TorneoEquipo 
		FOREIGN KEY(TorneoId, EquipoId) 
		REFERENCES dbo.TorneoEquipo (TorneoId, EquipoId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 
GO

ALTER TABLE dbo.TorneoGrupoEquipo 
	ADD CONSTRAINT FK_TorneoGrupoEquipo_TorneoGrupo 
		FOREIGN KEY(TorneoId, GrupoId)
		REFERENCES dbo.TorneoGrupo (TorneoId, GrupoId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 	
GO

COMMIT TRANSACTION