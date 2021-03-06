set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[VIA_GetAreasCompletas]
AS
BEGIN

	SELECT 
		ta.id_area,
		ta.descripcion,
		isnull(dp2.Apellido, '')			  		    Apellido_Responsable,
		isnull(dp2.Nombre, '')							Nombre_Responsable,
		isnull((tad.Calle + ' '+ tad.Nro + ' ' + ' Piso ' + 
		tad.Piso + ' Dto ' +tad.Dpto), '') AS					direccion,
		isnull(dp.Apellido, '')							Apellido_Asistente,
		isnull(dp.Nombre, '')								Nombre_Asistente,
		isnull(ca.Telefono, '')							Telefono_Asistente,
		isnull(ca.Fax, '')								Fax_Asistente,
		isnull(ca.Mail, '')								Mail_Asistente, 
		isnull(tdc.Descripcion, '')						Cargo,
		isnull(ca.Nro_orden, 1)							Prioridad_Asistente, 
		isnull(dca.Tipo_Dato, 0)						Id_Dato_Area,
		isnull(ttd.Descripcion, '')					    Descripcion_Dato_Area,
		isnull(dca.Dato, '')							Dato_Area,
		isnull(dca.Orden, 0)							Orden
		
		
  		
	FROM
		dbo.tabla_areas_estructura							ta
		left join  dbo.Tabla_Areas_Detalle					tad on
		tad.Id_Area =  ta.Id_Area
		left join  dbo.Tabla_Areas_DatosContacto			dca on
		dca.Id_Area =  ta.Id_Area
		left join dbo.Tabla_Tipo_De_Dato					ttd on
		ttd.id = dca.Tipo_Dato
		left join  dbo.Tabla_Areas_Asistentes				ca	on 
		ca.Id_Area =  ta.Id_area and ca.Baja <> 1
		left join  dbo.Tabla_Areas_Descripcion_Cargos		tdc on 
		tdc.id = ca.Indicador_Cargo and tdc.Baja <> 1
		left join  dbo.Datos_Personales						dp	on
		dp.Nro_Documento =  ca.DNI	  	  	         
		
		
		left join dbo.Tabla_Firmantes						fir on
		fir.Area = ta.Id_area 
		and fir.Baja <> 1
	
		left join  dbo.Datos_Personales						dp2 on
		dp2.Nro_Documento =  fir.Nro_Documento 
	
	WHERE
		ta.baja = 0
		
		
end		


