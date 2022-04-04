INSERT INTO dbo.TorneoEquipo
SELECT
	TorneoId = T.TorneoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
WHERE T.Nombre = 'FIFA World Cup Brasil 2014'





