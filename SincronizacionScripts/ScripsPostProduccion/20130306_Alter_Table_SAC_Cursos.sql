USE [DB_RRHH]
GO
ALTER TABLE [dbo].[SAC_Cursos]  WITH CHECK ADD FOREIGN KEY([IdDocente])
REFERENCES [dbo].[SAC_Docentes] ([id])