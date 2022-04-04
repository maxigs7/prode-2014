 -- GRUPO A FECHA 1
 ---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140612 17:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BRA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CRO'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140613 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'MEX'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CMR'))

-- GRUPO B FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140613 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ESP'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'NED'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140613 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CHI'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'AUS'))

-- GRUPO C FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140614 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'COL'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GRE'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140614 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'URU'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CRC'))

-- GRUPO D FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140614 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ENG'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ITA'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140614 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'CIV'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'JPN'))


-- GRUPO E FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140615 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'SUI'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ECU'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140615 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'FRA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'HON'))

-- GRUPO F FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140615 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ARG'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BIH'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140616 16:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'IRN'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'NGA'))

-- GRUPO G FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140616 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GER'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'POR'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140616 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'GHA'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'USA'))
	   
-- GRUPO H FECHA 1
---------------------------------
INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140617 13:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'BEL'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'ALG'))

INSERT INTO dbo.Partido(TorneoId,FechaNumero,FechaReal,LocalId,VisitanteId)
VALUES(1,1,'20140617 19:00',(SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'RUS'),
	   (SELECT EquipoId FROM dbo.Equipo WHERE Abreviatura = 'KOR'))