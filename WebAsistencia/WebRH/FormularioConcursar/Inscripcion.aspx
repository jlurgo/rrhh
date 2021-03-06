﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inscripcion.aspx.cs" Inherits="FormularioConcursar_Inscripcion" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>
<%@ Register Src="~/FormularioConcursar/MenuConcursar.ascx" TagName="BarraMenuConcursar" TagPrefix="uc3" %>
<%@ Register Src="~/FormularioConcursar/Pasos.ascx" TagName="Pasos" TagPrefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <%= Referencias.Css("../")%>    

     <script type="text/javascript" src="../Scripts/bootstrap/js/jquery.js"> </script>
     <link rel="stylesheet" type="text/css" href="EstilosPostular.css" />

     <style type="text/css">
        label 
        {
            font-weight:normal !important;
            margin-left: 10px;
        }
        
        table tr 
        {
            width: 200px;
            height: 60px;
        }
     
     </style>

</head>
<body>
    <form id="form1" runat="server" class="cmxform">
    <uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:20px; font-weight: bold; padding-top:20px;'>PostulAR</span> <br/> " UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />
    <div class="contenedor_concursar" >

       <uc3:BarraMenuConcursar ID="BarraMenuConcursar1" runat="server" />
        <uc4:Pasos ID="Pasos1" runat="server" />    
        
        <div class="fondo_form" style="padding: 10px;">
            <div id = "cont_titulo">
                <p>Usted est&aacute; por inscribirse para concursar al cargo de:</p>
            </div>
            <hr />
            <div id="puesto_cuadro" class = "cont_detalles_cargo">
            <table border="0" cellpadding="1" cellspacing="1">
                <tr style="border-right-style: none">
<%--                    <td width="20%"   id="td-border" style="border-top-style: solid; border-left-style: solid;border-width: 1px;" >        
                        <label class ="titulo_cargo">N° Central de Oferta de empleo:</label>   
                    </td>
                    <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">
                        <b id="puesto_numero" class = "detalle_cargo"></b>
                    </td> --%> 
                    
                    <td width="18%" style="border-top-style: solid; border-left-style: solid;border-width: 1px;">
                        <label class="titulo_cargo">Entidad Convocante:</label>   
                    </td>     
                    <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">
                        <b id="puesto_convocante" class = "detalle_cargo"></b>
                    </td>
                     <td style="border-top-style: solid; border-left-style: solid;border-width: 1px;">
                        <label class="titulo_cargo">Secretar&iacute;a/SubSecretar&iacute;a:</label> 
                    </td>
                    <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">    
                        <b id="puesto_secretaria" class="detalle_cargo"> </b>
                    </td>
                </tr>
                <tr style="border-right-style: none">
                  <td style="border-top-style: solid; border-left-style: solid;border-width: 1px;">
                        <label class = "titulo_cargo"> Denominaci&oacute;n <br /> del puesto: </label>   
                    </td>   
                <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">
                    <b id="puesto_denominacion" class="detalle_cargo"></b>
                </td>
                  <td style="border-top-style: solid; border-left-style: solid;border-width: 1px;">
                    <label class ="titulo_cargo">Agrupamiento:</label> 
                    </td>
                    <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">
                        <b id="puesto_agrupamiento" class="detalle_cargo"></b>
                    </td>      
                         
                </tr>
                <tr style="border-right-style: none">
                    <td style="border-top-style: solid; border-left-style: solid;border-width: 1px;">                      
                        <label class="titulo_cargo">Direcci&oacute;n Nacional/General o Equivalente:</label>  
                        </td>
                        <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">
                            <b id="puesto_cargo" class="detalle_cargo"></b>   
                    </td>
                    <td style="border-top-style: solid; border-left-style: solid;border-width: 1px;">
                        <label class="titulo_cargo">Tipo de convocatoria:</label> 
                        </td>
                        <td style="border-top-style: solid; border-right-style: solid;border-width: 1px;">
                            <b id="puesto_convocatoria" class="detalle_cargo"></b>
                        </td>

                </tr>
                <tr  style="border-top-style: solid; border-left-style: solid;border-width: 1px;">
                    <td style="border-top-style: solid; border-left-style: solid;border-bottom-style: solid;border-width: 1px;">
                        <label class = "titulo_cargo">Unidad Destino:</label>   
                         </td> 
                        <td style="border-top-style: solid; border-right-style: solid;border-bottom-style: solid;border-width: 1px;">  
                            <b id="puesto_destino" class="detalle_cargo"></b>       
                        </td>
                         <td style="border-top-style: solid; border-left-style: solid;border-bottom-style: solid;border-width: 1px;">  
                        <label class = "titulo_cargo">Nivel escalafonario:</label>  
                        </td>
                        <td style="border-top-style: solid; border-right-style: solid;border-bottom-style: solid;border-width: 1px;">
                            <b id="puesto_nivel" class="detalle_cargo"></b>
                        </td>
                  
                </tr>
               <%-- <tr style="border-right-style: none">

                         <td style="border-top-style: solid; border-left-style: solid;border-bottom-style: solid;border-width: 1px;">  
                        <label class = "titulo_cargo"></label>  
                        </td>
                        <td style="border-top-style: solid; border-right-style: solid;border-bottom-style: solid;border-width: 1px;">
                            <b id="Label1" class="detalle_cargo"></b>
                        </td>

              </tr>--%>
            </table>
            </div>

            <!-- SACAR A PEDIDO DE FABY
            <div id = "cont_titulo_completar_informacion">
                <p>Es deseable que complete la siguiente informaci&oacute;n:</p>
            </div>
            <hr />
            <div id = "cont_info_a_completar">
               <label>Motivo de la postulaci&oacute;n</label>
                <textarea id="txt_motivo" rows="2" cols="80"></textarea>
            </div>
            <div id="cont_info_a_completar_2">
                <label>Observaciones</label>
                <textarea id="txt_observaciones" rows="2" cols="80"></textarea>
            </div> 
            <hr />
            -->
            <br />
            <div>
                <p class="subtitulo_incripcion">Ingresar el/los números de "INFORMES GRÁFICOS" generados en el sistema GDE</p>
                <div id="cajaDeInformesGraficos">
                    <p><b>N° de INFORME GRÁFICO DEL SISTEMA GDE: </b><input class="informesGraficos" type="text" id="informeGrafico_00" /></p>
                </div>
                <input type=button class="btn btn-primary" onclick="agregarInforme()" value="Agregar otro INFORME" />
                
                <%--<p class="subtitulo_incripcion" >Documentaci&oacute;n a presentar: Verifique que la misma est&eacute; completa, podr&aacute; imprimirla una vez confirmada la postulaci&oacute;n:</p>--%>
            </div>
            <hr />
            <div id="cont_aclaraciones">
               <%-- <p class="aclaraciones">
                        1) "Formulario de Solicitud y Ficha de Inscripci&oacute;n"-ANEXO I- debidamente completado, los datos all&iacute; volcados presentan car&aacute;cter de declaraci&oacute;n jurada. El formulario debe ser firmado en todas sus hojas. <a href="../Imagenes/AnexoI.pdf" target="_blank" class="vista_preliminar">[vista preliminar]</a><br/>
                        2) Se deber&aacute; adjuntar un curr&iacute;culum vitae actualizado, firmado en todas sus hojas. <br/>
                        3) "Constancia de Recepción y Aceptación del Reglamento y Bases del Concurso". Declaración Jurada que obra como ANEXO II - <a href="../Imagenes/AnexoII.pdf" target="_blank" class="vista_preliminar">[vista preliminar]</a><br/>
                        4) "Constancia de Recepción de la Solicitud, Ficha de Inscripción y de la Documentación presentada.", que obra como ANEXO III - <a href="../Imagenes/AnexoIII.pdf" target="_blank" class="vista_preliminar">[vista preliminar]</a> <br/>
                        5) Certificados de estudios formales y de la documentación que respalde toda otra información volcada en el Formulario "Solicitud y Ficha de Inscripción". Original y fotocopia. Los postulantes que no estén encuadrados en el Sistema Nacional de Empleo Público deberán adjuntar, además: <br/>
                        6) DOS (2) fotografías recientes tipo carné, tamaño 4x4 cm. <br/>
                        7) Fotocopia de las DOS (2) primeras hojas del DNI y de la hoja donde figure el domicilio actualizado. <br/>
                </p>
                <br />--%>


                <p class="subtitulo_incripcion" >Declaro bajo juramento que:</p>
                <p class="aclaraciones">
                    a) los datos consignados en la presente Solicitud y Ficha de Inscripción son completos, verdaderos y atinentes al perfil del puesto de trabajo o función a concursar; <br /> <br />
                    b) que los certificados, fotocopias y demás documentación incluida en el/los Informe/s del GDE es autentica o copia fiel de sus respectivos originales; <br /> <br />
                    c) reúno los requisitos previstos en los Artículos 4º y 5º del Anexo de la Ley Nº 25.164, y su Decreto reglamentado Nº 1.421/2002, y artículos concordantes del Convenio Colectivo de Trabajo General de la Administración Pública Nacional (Decreto Nº 214/06), a los que acepto conocer y aceptar; <br /> <br />
                    d) reúno los requisitos para acceder al Agrupamiento y Nivel Escalafonario del cargo a concursar, previstos por el Sistema Nacional de Empleo Público (2.098/08); <br /> <br />
                    e) conozco y acepto las Bases del Concurso en el que solicito inscribirme, cuya copia he consultado en este Sitio Web, tomando conocimiento del 
                       cronograma y metodología de las etapas del proceso, de las materias o temáticas a abordar en la(s) prueba(s) y entrevista(s) fijadas o de 
                       las asignaturas del Curso de Selección si fuera aplicable, de los puntajes a asignar a las diversas características a considerar, con los 
                       cambios que pudiera resolver el Comité de Selección a los efectos de mejor preveer, y que serán comunicados con la antelación suficiente;  <br /> <br />
                    f) he sido notificado que en esta ubicación web se notificarán las diversas incidencias y resultados del presente proceso de selección; <br /> <br />
                    g) acepto que las notificaciones a que dé lugar el desarrollo del proceso en el que solicito ser inscripto puedan ser efectuadas en las direcciones domiciliarias y electrónicas así como del teléfono y/o fax que he comunicado en la presente
                       solicitud. <br /> <br />
                </p>
                <p style="font-size:larger;" class="aclaraciones2"><input id="chk_bases" type="checkbox" />&nbsp;He leído y acepto las Bases y Condiciones del Concurso al que me postulo</p>
                <a style="margin-right: 10px;" class="btn btn-primary" href="Postulaciones.aspx">Cancelar</a>
                <input type="button" class="btn btn-primary" id="btn_postularse" value="Confirmar Postulación" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="perfil" runat="server" />
 
    </form>
</body>
 <script type="text/javascript" src="Postulacion.js" ></script>
 <%= Referencias.Javascript("../") %>

  <script type="text/javascript">
      Backend.start();
      var nextinput = 0;

      $(document).ready(function () {
          var perfil =JSON.parse($('#perfil').val());
//          var puesto = JSON.parse($('#puesto').val());
          Postulacion.armarPostulacion(perfil);

          $("#paso_2").attr('class', 'link_activado');
          $("#paso_3").attr('class', 'link_activado');

          $("#siguiente").attr('style', 'display: none;');
          

      });

      function Anterior() {
          window.location.href = 'PreInscripcion.aspx';
      }

      function Siguiente() {

      }

      
      function agregarInforme() {
          nextinput++;
          campo = '<p><b>N° de INFORME GRÁFICO DEL SISTEMA GDE: </b><input class="informesGraficos" type="text" id="informeGrafico_0' + nextinput + '" /></p>';
          $("#cajaDeInformesGraficos").append(campo);
      }


  </script>


</html>
