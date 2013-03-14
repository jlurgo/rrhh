CREATE PROCEDURE [dbo].[SACC_Get_Alumnos]

AS

BEGIN

select
pe.Id							Id,	
pe.Documento					Documento,
pe.Apellido						Apellido,
pe.Nombres						Nombre,
isnull(pr.Telefono,'')			Telefono,
isnull(pr.Email_personal,'')	Mail,
isnull(cd.Calle,'')	+  ' ' + isnull(cd.Numero,'') +  ' ' + isnull( 'Piso ' + cd.Piso,'') +  ' ' + isnull( 'Dto ' + cd.Depto,'')	 		Direccion,
--ta.descripcion					Area,
al.IdModalidad					IdModalidad,
mo.Descripcion					ModalidadDescripcion



From dbo.SAC_Alumnos al
inner join dbo.CRED_Personas pe on 
al.IdPersona = pe.Id
inner join dbo.CRED_PersonasRelevadas pr on
pe.Documento = pr.Documento
inner join  dbo.CRED_Domicilios cd on 
pe.Documento = cd.Documento
--inner join dbo.Datos_Personales dp on
--pe.Documento = dp.Nro_Documento
--inner join RH_Usuarios_Areas_Web aw on
--dp.Id_Interna = aw.id
-- inner join dbo.tabla_areas ta on      
--  ta.id = aw.Id_Area      
left join dbo.SAC_Modalidad as mo
on al.IdModalidad = mo.IdModalidad

WHERE al.Baja = 0

END

