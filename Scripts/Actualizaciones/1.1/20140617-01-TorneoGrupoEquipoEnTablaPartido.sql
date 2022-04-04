BEGIN TRANSACTION

ALTER TABLE dbo.Partido
	ADD TorneoGrupoEquipoLocalId INT NULL,
		TorneoGrupoEquipoVisitanteId INT NULL
GO

UPDATE P
SET
	TorneoGrupoEquipoLocalId = TGE1.TorneoGrupoEquipoId,
	TorneoGrupoEquipoVisitanteId = TGE2.TorneoGrupoEquipoId
FROM dbo.Partido P
	INNER JOIN dbo.TorneoGrupoEquipo TGE1
		ON TGE1.TorneoId = P.TorneoId AND TGE1.EquipoId = P.LocalId
	INNER JOIN dbo.TorneoGrupoEquipo TGE2
		ON TGE2.TorneoId = P.TorneoId AND TGE2.EquipoId = P.VisitanteId
WHERE P.FechaNumero <= 3 AND TGE1.GrupoId <= 8 AND TGE2.GrupoId <= 8
GO

ALTER TABLE dbo.Partido
	ALTER COLUMN TorneoGrupoEquipoLocalId INT NOT NULL
ALTER TABLE dbo.Partido
	ALTER COLUMN TorneoGrupoEquipoVisitanteId INT NOT NULL
GO

ALTER TABLE dbo.Partido
	DROP CONSTRAINT FK_Partido_TorneoEquipoLocal,
					FK_Partido_TorneoEquipoVisitante
GO

ALTER TABLE dbo.Partido
	DROP COLUMN TorneoId,
				LocalId,
				VisitanteId
GO

ALTER TABLE dbo.Partido 
	ADD CONSTRAINT FK_Partido_TorneoGrupoLocal
		FOREIGN KEY(TorneoGrupoEquipoLocalId)
		REFERENCES dbo.TorneoGrupoEquipo (TorneoGrupoEquipoId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 	
GO

ALTER TABLE dbo.Partido 
	ADD CONSTRAINT FK_Partido_TorneoGrupoVisitante
		FOREIGN KEY(TorneoGrupoEquipoVisitanteId)
		REFERENCES dbo.TorneoGrupoEquipo (TorneoGrupoEquipoId) 
			ON UPDATE  NO ACTION 
			ON DELETE  NO ACTION 	
GO
COMMIT TRANSACTION