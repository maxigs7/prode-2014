INSERT INTO dbo.Grupo(GrupoId,Nombre)
VALUES(10,'Cuartos de Final')

INSERT INTO dbo.TorneoGrupo(TorneoId, GrupoId)
VALUES(1,10)

 -- FECHA 5
 ---------------------------------

INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 10, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('BRA','COL','NED','CRC')

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140704 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'BRA' AND TGE.GrupoId = 10),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'COL' AND TGE.GrupoId = 10)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140705 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'NED' AND TGE.GrupoId = 10),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'CRC' AND TGE.GrupoId = 10)
		,2)


INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 10, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('FRA','GER','ARG','BEL')

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140704 13:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'FRA' AND TGE.GrupoId = 10),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'GER' AND TGE.GrupoId = 10)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140705 13:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'ARG' AND TGE.GrupoId = 10),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'BEL' AND TGE.GrupoId = 10)
		,2)

-----------------------------------------------------------------------------------------------------------------------

INSERT INTO dbo.Grupo(GrupoId,Nombre)
VALUES(11,'Semifinal')

INSERT INTO dbo.TorneoGrupo(TorneoId, GrupoId)
VALUES(1,11)

 -- FECHA 5
 ---------------------------------

INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 11, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('BRA','GER','NED','ARG')

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140708 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'BRA' AND TGE.GrupoId = 11),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'GER' AND TGE.GrupoId = 11)
		,2)

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140709 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'NED' AND TGE.GrupoId = 11),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'ARG' AND TGE.GrupoId = 11)
		,2)


-----------------------------------------------------------------------------------------------------------------------

INSERT INTO dbo.Grupo(GrupoId,Nombre)
VALUES(12,'Tercer Puesto')

INSERT INTO dbo.TorneoGrupo(TorneoId, GrupoId)
VALUES(1,12)

 -- FECHA 5
 ---------------------------------

INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 12, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('BRA','NED')

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140712 17:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'BRA' AND TGE.GrupoId = 12),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'NED' AND TGE.GrupoId = 12)
		,2)

 -- FINAL
 ---------------------------------
INSERT INTO dbo.Grupo(GrupoId,Nombre)
VALUES(13,'Final')

INSERT INTO dbo.TorneoGrupo(TorneoId, GrupoId)
VALUES(1,13)

INSERT INTO dbo.TorneoGrupoEquipo
SELECT TorneoId = 1, GrupoId = 13, EquipoId = E.EquipoId
FROM dbo.Equipo E
WHERE E.Abreviatura IN('GER','ARG')

INSERT INTO dbo.Partido(FechaNumero,FechaReal,TorneoGrupoEquipoLocalId,TorneoGrupoEquipoVisitanteId,TipoApuestaId)
VALUES(5,'20140713 16:00',
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'GER' AND TGE.GrupoId = 13),
		(SELECT TGE.TorneoGrupoEquipoId 
		 FROM dbo.TorneoGrupoEquipo TGE
			INNER JOIN dbo.Equipo E ON TGE.EquipoId = E.EquipoId
		 WHERE E.Abreviatura = 'ARG' AND TGE.GrupoId = 13)
		,2)