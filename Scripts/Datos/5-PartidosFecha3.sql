 -- GRUPO A FECHA 3
 ---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140623 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CMR'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BRA'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140623 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CRO'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'MEX'),1)

-- GRUPO B FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140623 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'AUS'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ESP'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140623 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'NED'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CHI'),1)

-- GRUPO C FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140624 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'JPN'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'COL'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140624 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GRE'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CIV'),1)

-- GRUPO D FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140624 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ITA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'URU'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140624 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CRC'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ENG'),1)


-- GRUPO E FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140625 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'HON'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'SUI'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140625 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ECU'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'FRA'),1)

-- GRUPO F FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140625 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'NGA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ARG'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140625 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BIH'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'IRN'),1)

-- GRUPO G FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140626 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'USA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GER'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140626 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'POR'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GHA'),1)
	   
-- GRUPO H FECHA 3
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140626 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'KOR'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BEL'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,3,'20140626 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ALG'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'RUS'),1)