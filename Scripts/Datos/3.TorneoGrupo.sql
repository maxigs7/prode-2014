INSERT INTO dbo.TorneoGrupo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId
FROM dbo.Grupo G
	CROSS APPLY dbo.Torneo T
WHERE T.Nombre = 'FIFA World Cup Brasil 2014'


