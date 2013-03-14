USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[SAC_Inscripciones]    Fecha de la secuencia de comandos: 03/11/2013 20:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAC_Inscripciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCurso] [smallint] NOT NULL,
	[idAlumno] [int] NOT NULL,
	[idusuario] [smallint] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[idBaja] [int] NULL,
 
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]


USE [DB_RRHH]
GO
ALTER TABLE [dbo].[SAC_Inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_SAC_Inscripciones_SAC_Cursos] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[SAC_Cursos] ([Id])
GO
ALTER TABLE [dbo].[SAC_Inscripciones] CHECK CONSTRAINT [FK_SAC_Inscripciones_SAC_Cursos]



GO
ALTER TABLE [dbo].[SAC_Inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_SAC_Inscripciones_SAC_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[SAC_Alumnos] ([IdPersona])
GO
ALTER TABLE [dbo].[SAC_Inscripciones] CHECK CONSTRAINT [FK_SAC_Inscripciones_SAC_Alumno]