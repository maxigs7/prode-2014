 -- GRUPO A FECHA 1
 ---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140617 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BRA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'MEX'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140618 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CMR'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CRO'),1)

-- GRUPO B FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140618 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'AUS'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'NED'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140618 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ESP'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CHI'),1)

-- GRUPO C FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140619 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'COL'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CIV'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140619 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'JPN'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GRE'),1)

-- GRUPO D FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140619 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'URU'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ENG'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140620 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ITA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CRC'),1)


-- GRUPO E FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140620 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'SUI'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'FRA'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140620 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'HON'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ECU'),1)

-- GRUPO F FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140621 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ARG'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'IRN'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140621 18:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'NGA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BIH'),1)

-- GRUPO G FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140621 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GER'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GHA'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140622 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'USA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'POR'),1)
	   
-- GRUPO H FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140622 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BEL'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'RUS'),1)

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId,TipoApuestaId)
VALUES(1,2,'20140622 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'KOR'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ALG'),1)