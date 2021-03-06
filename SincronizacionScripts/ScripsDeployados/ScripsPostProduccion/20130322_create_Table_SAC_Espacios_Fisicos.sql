USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[SAC_Espacios_Fisicos]    Fecha de la secuencia de comandos: 04/08/2013 19:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAC_Espacios_Fisicos](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[Aula] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[idEdificio] [smallint] NULL,
	[Capacidad] [smallint] NULL,
	[idusuario] [smallint] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[idBaja] [int] NULL,
 CONSTRAINT [PK_SAC_Espacios_Fisicos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SAC_Espacios_Fisicos]  WITH CHECK ADD  CONSTRAINT [FK_SAC_Espacios_Fisicos_SAC_Edificios] FOREIGN KEY([idEdificio])
REFERENCES [dbo].[SAC_Edificios] ([id])
GO
ALTER TABLE [dbo].[SAC_Espacios_Fisicos] CHECK CONSTRAINT [FK_SAC_Espacios_Fisicos_SAC_Edificios]