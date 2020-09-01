<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PotenciarTrabajo.aspx.cs" Inherits="PotenciarTrabajo_PotenciarTrabajo" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Potenciar Trabajo</title>
    <link href="../Scripts/vex-2.1.1/css/vex.css" rel="stylesheet">
    <link href="../Scripts/vex-2.1.1/css/vex-theme-os.css" rel="stylesheet">
    <%= Referencias.Css("../")%>
    <link rel="stylesheet" type="text/css" href="PotenciarTrabajo.css" />
    <%= Referencias.Javascript("../")%>
</head>
    <body>
        <form id="form1" runat="server">
            <uc2:BarraMenu ID="BarraMenu" runat="server" Feature="<span style='font-size:18px; font-weight: bold;'>Datos Abiertos</span> <br/> <span style='font-size:12px;'> Administración de Usuarios </span>" UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" UrlPassword="../" />
            <div id="pt_pagina">
              <div id="pt_barra_izquierda">
                  <div id="pt_titulo_barra">
                    <div>
                      Potenciar Trabajo
                    </div>
                  </div>
                  <img id="pt_logo_seccion"
                    src="../MenuPrincipal/Potenciar_Trabajo.png"/>
                  <div id="pt_controles_barra_izq">
                    PARTICIPACION
                    <div id="pt_boton_carga_participacion">
                      - Carga Participación
                    </div>
                    <div id="pt_boton_informes_mensuales">
                      - Informes Mensuales
                    </div>
                    <div id="">
                      - Historial
                    </div>
                    <div id="">
                      - Consultas al Programa
                    </div>
                  </div>
              </div>
              <div id="pt_seccion_gestion_semanal" class="pt_seccion">
                <div id='pt_estado_mensual'>
                  <div id="pt_titulo_seccion">
                    Estado Mensual de la Carga de Participación
                  </div>
                  <div id="pt_controles_superiores">
                      <div>
                          <label for="pt_cmb_periodo" class="pt_label_combo">Mes</label>
                          <select id="pt_cmb_periodo" class="pt_combo">
                          </select>
                      </div>
                  </div>
                  <div id="pt_contenedor_tabla_participacion_mensual"
                    class="pt_contenedor_tabla">
                    <table id="pt_tabla_participacion_mensual" class="pt_tabla">
                      <tr id="pt_titulos_tabla_participacion_mensual"
                        class="pt_fila_titulo_tabla" >
                        <th rowspan="1"> Grupo de Trabajo</th>
                        <th colspan="5"> Estados </th>
                        <th colspan="3"> Carga </th>
                      </tr>
                      <tr id="pt_titulos2_tabla_participacion_mensual"
                        class="pt_fila_subtitulo_tabla">
                        <th> Nombre </th>
                        <th> Activos </th>
                        <th> Activos Parcial </th>
                        <th> Suspendidos </th>
                        <th> Inactivos </th>
                        <th> Total </th>
                        <!-- <th> Sin Carga </th> -->
                        <th> En Proceso </th>
                        <th> Con informe </th>
                      </tr>
                    </table>
                  </div>
                </div>
                <div id="pt_estado_semanal">
                  <div id="pt_titulo_seccion">
                    Registro de Participacion en Actividades del Grupo de Trabajo
                  </div>
                  <div id="pt_encabezados_semanal">
                    <div id="pt_encabezado_grupo_de_trabajo">
                      <div>
                          Grupo de Trabajo
                      </div>
                      <div id="pt_grupo_de_trabajo">
                        xxxxxxxxxxxxxxxxxxxxxxxx
                      </div>
                    </div>
                    <div id="pt_encabezado_periodo">
                      <div>
                          Mes
                      </div>
                      <div id="pt_periodo">
                          Abril 9999
                      </div>
                    </div>
                  </div>
                  <div class="pt_nota">
                    Nota: Por defecto, todas las personas presentan un cumplimiento del 100%
                  </div>
                  <div id="pt_nota_de_abajo" class="pt_nota">
                    MODIFIQUE las que corresponda a MENORES porcentajes de cumplimiento (seleccionando el valor correcto de la lista desplegable)
                  </div>
                  <div id="pt_boton_volver_tabla_participacion_mensual" class="pt_volver">
                    <img src="IconoVolver.png"/>
                  </div>
                  <div id="pt_contenedor_tabla_participacion_semanal"
                    class="pt_contenedor_tabla">
                    <table id="pt_tabla_participacion_semanal"
                      class="pt_tabla">
                      <tr id="pt_titulos_tabla_participacion_semanal"
                        class="pt_fila_titulo_tabla">
                      </tr>
                    </table>
                  </div>
                  <div class="pt_nota_pie_table">
                    Atención: La carga de participación para Participantes
                    en Estado "incompatible" no generan ningún tipo de derecho
                    a cobro por el período y su consideración está
                    completamente supeditada a la evaluación del PROGRAMA
                    sobre la documentación que oportunamente se presente.
                  </div>
                </div>
                <div id="pt_controles_inferiores"></div>
              </div>

              <div id="pt_seccion_informes_mensuales" class="pt_seccion">

                <div id='pt_estados_mensuales'>
                  <div id="pt_titulo_seccion">
                    Estados Mensuales
                  </div>
                  <!-- <div id="pt_encabezados">
                    <div id="pt_unidad_gestion">
                      Unidad de Gestión: XXXXXXXXXXXXX XXXXX XXXXXXXXX
                    </div>
                  </div> -->
                  <div id="pt_contenedor_tabla_informes_mensuales"
                    class="pt_contenedor_tabla">
                    <table id="pt_tabla_informes_mensuales" class="pt_tabla">
                      <tr id="pt_titulos_tabla_informes_mensuales" class="pt_fila_titulo_tabla" >
                        <th  colspan="2" class="empty_cell"></th>
                        <th  colspan="3"> Grupo de Trabajo </th>
                        <th  colspan="3"> Personas </th>
                      </tr>

                      <tr id="pt_titulos2_tabla_informes_mensuales" class="pt_fila_subtitulo_tabla" >
                        <th > Año </th>
                        <th > Mes </th>
                        <th > Sin Carga </th>
                        <th > En Proceso </th>
                        <th > Con Informe </th>
                        <th > Sin Carga </th>
                        <th > En Proceso </th>
                        <th > Con Informe </th>
                      </tr>
                    </table>
                  </div>
                </div>
                <div id="pt_detalle_mensual">
                  <div id="pt_titulo_seccion">
                    Detalle Mensual
                  </div>

                  <div id="pt_contenedor_tabla_informes_participacion_detalle_mensual" class="pt_contenedor_tabla">
                    <table id="pt_tabla_informes_participacion_detalle_mensual" class="pt_tabla">
                      <tr id="pt_titulos_tabla_informes_participacion_detalle_mensual" class="pt_fila_titulo_tabla" >
                        <!-- <th > Entidad </th> -->
                        <th > Grupo de Trabajo </th>
                        <th > Personas </th>
                        <th > Estado </th>
                        <th > Incluir en Informe </th>
                        <th > N° de Informe </th>
                      </tr>
                    </table>
                  </div>
                  <div id="pt_controles_inferiores_detalle_mensual">
                    <button id="pt_generar_informe_participacion" type="button">Generar Informe Mensual</button>
                  </div>
                  <div class="pt_nota_pie_table">
                    1, FILAS “Sin carga”= en color ROJO y guiones en las dos últimas columnas (como
                    “no corresponde dato”)
                    2. FILAS “En proceso” = en color AMARILLO, con una casilla para chequear en la
                    columna “Incluir en Informe” así el informe se va a generar UNICAMENTE para los
                    grupos marcados. Y guiones en la última columna (como “no corresponde dato”)
                    3. FILAS “Con Informe” = todo sin color de fondo, con un ícono en la ultima
                    columna al lado del número de informe, que permita bajar el PDF.
                  </div>
                </div>
              </div>


          </div>
        <div id="pt_plantillas">
          <div class="pt_justificacion">
            <div>
              <label> Tipo: </label>
              <select id="pt_justificacion_cmb_motivo">
              </select>
            </div>

            <div class="pt_justificacion_semana_desde_hasta">

              <div>
                <label> Desde: </label>
                <label id="pt_justificacion_semana_desde"> </label>
              </div>

              <div>
                <label> Hasta: </label>
                <select id="pt_justificacion_cmb_semana_hasta"></select>
              </div>

            </div>
            <div>
              <label> Descripción: </label>
              <textarea id="pt_descripcion_justificacion"> </textarea>
            </div>
          </div>
        </div>
      </form>
  </body>
  <script type="text/javascript" src="../Scripts/vex-2.1.1/js/vex.combined.min.js"></script>
  <script type="text/javascript" src="PotenciarTrabajo.js"></script>
  <script type="text/javascript" src="PotenciarTrabajoInformesMensuales.js"></script>

</html>
