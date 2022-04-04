INSERT INTO dbo.Grupo(GrupoId,Nombre)
VALUES(9,'Octavos de Final')

INSERT INTO dbo.TorneoGrupo(TorneoId, GrupoId)
VALUES(1,9)

 -- FECHA 4 GRUPO A y B
 ---------------------------------

INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 9, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('BRA','MEX','NED','CHI')

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140628 13:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'BRA' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'CHI' AND TGE.GrupoId = 9)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140629 13:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'NED' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'MEX' AND TGE.GrupoId = 9)
		,2)

-- FECHA 4 GRUPO C y D
 ---------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 9, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('COL','GRE','CRC','URU')
 
INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140628 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'COL' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'URU' AND TGE.GrupoId = 9)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140629 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'CRC' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'GRE' AND TGE.GrupoId = 9)
		,2)

-- FECHA 4 GRUPO E y F
 ---------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 9, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('FRA','SUI','ARG','NGA')
 
INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140630 13:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'FRA' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'NGA' AND TGE.GrupoId = 9)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140701 13:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'ARG' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'SUI' AND TGE.GrupoId = 9)
		,2)

-- FECHA 4 GRUPO G y H
 ---------------------------------
INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 9, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('GER','USA','BEL','ALG')
 
INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140630 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'GER' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'ALG' AND TGE.GrupoId = 9)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(4,'20140701 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'BEL' AND TGE.GrupoId = 9),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'USA' AND TGE.GrupoId = 9)
		,2)
