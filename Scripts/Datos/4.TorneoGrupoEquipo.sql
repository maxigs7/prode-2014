-- GRUPO A
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo A' AND
	  E.Abreviatura IN('BRA','CRO','MEX','CMR')


-- GRUPO B
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo B' AND
	  E.Abreviatura IN('ESP','NED','CHI','AUS')

-- GRUPO C
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo C' AND
	  E.Abreviatura IN('COL','GRE','CIV','JPN')

-- GRUPO D
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo D' AND
	  E.Abreviatura IN('URU','CRC','ENG','ITA')

-- GRUPO E
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo E' AND
	  E.Abreviatura IN('SUI','ECU','FRA','HON')

-- GRUPO F
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo F' AND
	  E.Abreviatura IN('ARG','BIH','IRN','NGA')

-- GRUPO G
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo G' AND
	  E.Abreviatura IN('GER','POR','GHA','USA')

-- GRUPO H
-------------------------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT
	TorneoId = T.TorneoId,
	GrupoId = G.GrupoId,
	EquipoId = E.EquipoId
FROM dbo.Equipo E
	CROSS APPLY dbo.Torneo T
	CROSS APPLY dbo.Grupo G
WHERE T.Nombre = 'FIFA World Cup Brasil 2014' AND
	  G.Nombre = 'Grupo H' AND
	  E.Abreviatura IN('BEL','ALG','RUS','KOR')