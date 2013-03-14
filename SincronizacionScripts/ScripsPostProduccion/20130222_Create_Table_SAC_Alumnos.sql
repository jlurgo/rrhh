USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[SAC_Alumnos]    Fecha de la secuencia de comandos: 03/07/2013 21:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAC_Alumnos](
	[IdPersona] [int] NOT NULL,
	[IdModalidad] [int] NOT NULL,
	[IdUsuario] [smallint] NULL,
	[Fecha] [datetime] NULL,
	[idBaja] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[SAC_Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_SAC_Alumnos_CRED_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[CRED_Personas] ([Id])
GO
ALTER TABLE [dbo].[SAC_Alumnos] CHECK CONSTRAINT [FK_SAC_Alumnos_CRED_Personas]