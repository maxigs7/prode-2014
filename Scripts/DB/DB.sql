
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apuesta](
	[ApuestaId] [int] IDENTITY(1,1) NOT NULL,
	[PartidoId] [int] NOT NULL,
	[GolesLocal] [tinyint] NOT NULL,
	[GolesVisitante] [tinyint] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[FechaApuesta] [datetime] NOT NULL,
	[TipoApuestaId] [tinyint] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Apuesta] PRIMARY KEY CLUSTERED 
(
	[ApuestaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Equipo](
	[EquipoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](80) NOT NULL,
	[Abreviatura] [varchar](5) NULL,
	[UrlEscudo] [varchar](500) NULL,
	[EsSeleccion] [bit] NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[EquipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grupo](
	[GrupoId] [smallint] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[GrupoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[PartidoId] [int] IDENTITY(1,1) NOT NULL,
	[TorneoId] [int] NOT NULL,
	[FechaNumero] [int] NOT NULL,
	[FechaReal] [datetime] NOT NULL,
	[LocalId] [int] NOT NULL,
	[VisitanteId] [int] NOT NULL,
	[GolesLocal] [int] NULL,
	[GolesVisitante] [int] NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[PartidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoApuesta]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoApuesta](
	[TipoApuestaId] [tinyint] NOT NULL,
	[ApuestaResultado] [bit] NOT NULL,
	[ApuestaGanador] [bit] NOT NULL,
	[PuntosResultado] [tinyint] NOT NULL,
	[PuntosGanador] [tinyint] NOT NULL,
 CONSTRAINT [PK_TipoApuesta] PRIMARY KEY CLUSTERED 
(
	[TipoApuestaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoTorneo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTorneo](
	[TipoTorneoId] [smallint] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[TieneGrupos] [bit] NOT NULL,
	[PartidoUnicoPorGrupo] [bit] NOT NULL,
	[PartidoUnicoRonda] [bit] NOT NULL,
	[CantidadEquipos] [tinyint] NOT NULL,
	[CantidadGrupos] [tinyint] NULL,
 CONSTRAINT [PK_TipoTorneo] PRIMARY KEY CLUSTERED 
(
	[TipoTorneoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Torneo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Torneo](
	[TorneoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[TipoTorneoId] [smallint] NOT NULL,
 CONSTRAINT [PK_Torneo] PRIMARY KEY CLUSTERED 
(
	[TorneoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TorneoEquipo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TorneoEquipo](
	[TorneoId] [int] NOT NULL,
	[EquipoId] [int] NOT NULL,
 CONSTRAINT [PK_TorneoEquipo] PRIMARY KEY CLUSTERED 
(
	[TorneoId] ASC,
	[EquipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TorneoGrupo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TorneoGrupo](
	[TorneoId] [int] NOT NULL,
	[GrupoId] [smallint] NOT NULL,
 CONSTRAINT [PK_TorneoGrupo] PRIMARY KEY CLUSTERED 
(
	[TorneoId] ASC,
	[GrupoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TorneoGrupoEquipo]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TorneoGrupoEquipo](
	[TorneoId] [int] NOT NULL,
	[GrupoId] [smallint] NOT NULL,
	[EquipoId] [int] NOT NULL,
 CONSTRAINT [PK_TorneoGrupoEquipo] PRIMARY KEY CLUSTERED 
(
	[TorneoId] ASC,
	[GrupoId] ASC,
	[EquipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TorneoUsuario]    Script Date: 10/06/2014 01:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TorneoUsuario](
	[TorneoId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_TorneoUsuario] PRIMARY KEY CLUSTERED 
(
	[TorneoId] ASC,
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Apuesta]  WITH CHECK ADD  CONSTRAINT [FK_Apuesta_Partido] FOREIGN KEY([PartidoId])
REFERENCES [dbo].[Partido] ([PartidoId])
GO
ALTER TABLE [dbo].[Apuesta] CHECK CONSTRAINT [FK_Apuesta_Partido]
GO
ALTER TABLE [dbo].[Apuesta]  WITH CHECK ADD  CONSTRAINT [FK_Apuesta_TipoApuesta] FOREIGN KEY([TipoApuestaId])
REFERENCES [dbo].[TipoApuesta] ([TipoApuestaId])
GO
ALTER TABLE [dbo].[Apuesta] CHECK CONSTRAINT [FK_Apuesta_TipoApuesta]
GO
ALTER TABLE [dbo].[Partido]  WITH CHECK ADD  CONSTRAINT [FK_Partido_TorneoEquipoLocal] FOREIGN KEY([TorneoId], [LocalId])
REFERENCES [dbo].[TorneoEquipo] ([TorneoId], [EquipoId])
GO
ALTER TABLE [dbo].[Partido] CHECK CONSTRAINT [FK_Partido_TorneoEquipoLocal]
GO
ALTER TABLE [dbo].[Partido]  WITH CHECK ADD  CONSTRAINT [FK_Partido_TorneoEquipoVisitante] FOREIGN KEY([TorneoId], [VisitanteId])
REFERENCES [dbo].[TorneoEquipo] ([TorneoId], [EquipoId])
GO
ALTER TABLE [dbo].[Partido] CHECK CONSTRAINT [FK_Partido_TorneoEquipoVisitante]
GO
ALTER TABLE [dbo].[Torneo]  WITH CHECK ADD  CONSTRAINT [FK_Torneo_TipoTorneo] FOREIGN KEY([TipoTorneoId])
REFERENCES [dbo].[TipoTorneo] ([TipoTorneoId])
GO
ALTER TABLE [dbo].[Torneo] CHECK CONSTRAINT [FK_Torneo_TipoTorneo]
GO
ALTER TABLE [dbo].[TorneoEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TorneoEquipo_Equipo] FOREIGN KEY([EquipoId])
REFERENCES [dbo].[Equipo] ([EquipoId])
GO
ALTER TABLE [dbo].[TorneoEquipo] CHECK CONSTRAINT [FK_TorneoEquipo_Equipo]
GO
ALTER TABLE [dbo].[TorneoEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TorneoEquipo_Torneo] FOREIGN KEY([TorneoId])
REFERENCES [dbo].[Torneo] ([TorneoId])
GO
ALTER TABLE [dbo].[TorneoEquipo] CHECK CONSTRAINT [FK_TorneoEquipo_Torneo]
GO
ALTER TABLE [dbo].[TorneoGrupo]  WITH CHECK ADD  CONSTRAINT [FK_TorneoGrupo_Grupo] FOREIGN KEY([GrupoId])
REFERENCES [dbo].[Grupo] ([GrupoId])
GO
ALTER TABLE [dbo].[TorneoGrupo] CHECK CONSTRAINT [FK_TorneoGrupo_Grupo]
GO
ALTER TABLE [dbo].[TorneoGrupo]  WITH CHECK ADD  CONSTRAINT [FK_TorneoGrupo_Torneo] FOREIGN KEY([TorneoId])
REFERENCES [dbo].[Torneo] ([TorneoId])
GO
ALTER TABLE [dbo].[TorneoGrupo] CHECK CONSTRAINT [FK_TorneoGrupo_Torneo]
GO
ALTER TABLE [dbo].[TorneoGrupoEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TorneoGrupoEquipo_TorneoEquipo] FOREIGN KEY([TorneoId], [EquipoId])
REFERENCES [dbo].[TorneoEquipo] ([TorneoId], [EquipoId])
GO
ALTER TABLE [dbo].[TorneoGrupoEquipo] CHECK CONSTRAINT [FK_TorneoGrupoEquipo_TorneoEquipo]
GO
ALTER TABLE [dbo].[TorneoGrupoEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TorneoGrupoEquipo_TorneoGrupo] FOREIGN KEY([TorneoId], [GrupoId])
REFERENCES [dbo].[TorneoGrupo] ([TorneoId], [GrupoId])
GO
ALTER TABLE [dbo].[TorneoGrupoEquipo] CHECK CONSTRAINT [FK_TorneoGrupoEquipo_TorneoGrupo]
GO
ALTER TABLE [dbo].[TorneoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TorneoUsuario_Torneo] FOREIGN KEY([TorneoId])
REFERENCES [dbo].[Torneo] ([TorneoId])
GO
ALTER TABLE [dbo].[TorneoUsuario] CHECK CONSTRAINT [FK_TorneoUsuario_Torneo]
GO
