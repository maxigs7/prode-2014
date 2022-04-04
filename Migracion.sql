SELECT 
	Nombre = E.Nombre,
	Codigo = E.Abreviatura,
	EsSeleccion = E.EsSeleccion,
	UrlEscudo = E.UrlEscudo
FROM [MaxDev.Prode.Deploy].dbo.Equipo E

SELECT 
	Nombre = T.Nombre,
	UrlAmigable = NULL,
	TipoTorneoId = T.TipoTorneoId,
	Fecha = CONVERT(DATETIME, '20140612')
FROM [MaxDev.Prode.Deploy].dbo.Torneo T


SELECT 
	Nombre = T.Nombre,
	UrlAmigable = NULL,
	TipoTorneoId = T.TipoTorneoId,
	Fecha = CONVERT(DATETIME, '20140612')
FROM [MaxDev.Prode.Deploy].dbo.Torneo T



