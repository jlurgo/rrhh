
ALTER TABLE dbo.SAC_Cursos drop column IdAula

alter table dbo.SAC_Cursos add idusuario smallint

ALTER TABLE [dbo].[SAC_Cursos]  WITH CHECK ADD FOREIGN KEY([IdEspacioFisico])
REFERENCES [dbo].[SAC_Espacios_Fisicos] ([id])

