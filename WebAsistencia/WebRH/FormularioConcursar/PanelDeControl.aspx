﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PanelDeControl.aspx.cs" Inherits="FormularioConcursar_PanelDeControl" %>
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
     
</head>
<body>
    <form id="form1" runat="server">
    <uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:20px; font-weight: bold; padding-top:20px;'>PostulAR</span> <br/> " UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />
    <div class="contenedor_concursar" >

    <uc3:BarraMenuConcursar ID="BarraMenuConcursar1" runat="server" />
    
    <div class="panel panel-heading">
        <div class="panel_izquierdo" style="height:auto; width:50%" >
           
            <!--<div class="panel panel-default">
                <div class=" estilo_paneles  ">
                
                <a href="#" ><span><img alt="imprimir" width="22px" height="22px" src="../Imagenes/Botones/impresora.png" />&nbsp;Imprimir</span></a>    
                <a href="VistaPreliminar.aspx" ><span><img alt="descargar" width="22px" height="22px" src="../Imagenes/Botones/guardar.png" />&nbsp;Descargar</span></a>                 
                <hr class="lineas-subraya"/>
                <div  class="panel-body estilo_paneles fondo_form ">
                    <h3 class="panel-title" style="text-align:center; font-size:12pt; font-weight: bold;">Mi CV</h3>
                    <hr class="lineas-subraya"/>
                    <a class="cvFotoUsuario " href="#"><img src="../Imagenes/silueta.gif" alt="Avatar Usuario" width="125" /></a>
                    <div class="cvOverview"> 
                	    <p class=""><a class="cvNombrePostulante" href="#"><%=nombre +" "+ apellido  %></a></p>
                        <p class="cvEstadoCv">Tu CV está al  <span id="Span1">85</span>%</p>
                        <div class="cvProgress">
                            <div class="cvProgressBar cvProgressBarAlta" style="width: 85%"></div>
                        </div>
                    </div>
                </div>
                </div>
            </div>-->
            <legend><q>¿QUÉ ES CONCURSAR?</q></legend>
            <p>CONCURSAR es una política del Gobierno Nacional que apunta a consolidar el proceso de fortalecimiento y modernización del Estado a través de la selección de su personal mediante el sistema de concursos.</p>
            <p>Un Estado nuevamente activo, protagonista del proceso de crecimiento con inclusión social que atraviesa nuestro país desde mayo de 2003, y que aborda desafíos cada vez más complejos, requiere contar con un personal competente, debidamente capacitado y seleccionado mediante mecanismos transparentes que garanticen la igualdad de oportunidades, en los que el mérito y la idoneidad sean valorados como el principal capital de los postulantes.</p>
            <p>En definitiva, a través de CONCURSAR se busca optimizar las capacidades de gestión de las distintas áreas y organismos estatales y consolidar un cuerpo de funcionarios y trabajadores cada vez más especializado, cuyos integrantes cuenten con la certeza de formar parte de un Estado que los contiene, valora y proyecta hacia el futuro, y que a la vez exige de ellos el compromiso permanente de brindar lo mejor de sus habilidades en el desempeño cotidiano.</p>
            <p>Por ello invitamos a todos los interesados a participar de las convocatorias que realizan los organismos públicos para ingresar a formar parte de la planta permanente de la Administración Pública Nacional: porque estamos convencidos de que este es el camino para construir un mejor Estado.</p>
            <p>En este sitio web usted encontrará toda la información relevante sobre convocatorias vigentes, perfiles de los cargos concursados, requisitos, cronogramas y mecanismos de inscripción, guías de  orientación, preguntas frecuentes, y toda la normativa vigente sobre los concursos.</p>
           
        </div>

        <div style="float:right; " class="panel_derecho">
           <%-- <a href="#" ><span><img alt="imprimir" width="22px" height="22px" src="../Imagenes/Botones/impresora.png" />&nbsp;Imprimir CV</span></a>    --%>
            <a href="VistaPreliminar.aspx" target="_blank" ><span><img alt="descargar" width="22px" height="22px" src="../Imagenes/Botones/guardar.png" />&nbsp;Descargar CV</span></a>                 
           
          <!--  <div class="panel panel-default">-->
              <div style="height: 435px;"   ">
               <h3 class="panel-title" >Mis Postulaciones</h3>
               
                 <hr class="lineas-subraya"/>
                 <div id="tabla_postulaciones"> </div>
                  <!-- <table id="tabla_postulaciones" style="width:100%;"></table>
                 <div class="feedPostulacionesAplicadas sombra_y_redondeado"> 
                    <h3 class="subtitulo_postulaciones"><a href="#">Programador para RRHH/ CABA </a></h3>
                    <hr class="SubrayadoPostulaciones degrade"/>
                  <p>Se require programadores con conocimientos avanzados en c#</p>
                  </div>

                <div class="feedPostulacionesAplicadas sombra_y_redondeado">
                    <h3 class="subtitulo_postulaciones"><a href="#">Adminitrador de Redes RRHH/ CABA </a></h3>
                    <hr class="SubrayadoPostulaciones degrade"/>
                    <p>Se require expertos en Redes para administrar la infraestructura</p>-->
                    
                    
                </div>
              </div>
            </div>

        <!--</div>-->
    </div>
    <asp:HiddenField ID="postulaciones" runat="server" />
            </form>
</body>

 <%= Referencias.Javascript("../") %>
 <script type="text/javascript" src="../Scripts/ConversorDeFechas.js" ></script>
 <script type="text/javascript" src="PanelDeControl.js"></script>

 <script type="text/javascript">
     $('#tab_panel').addClass('active');

    Backend.start();
    $(document).ready(function () {
        var postulaciones = JSON.parse($('#postulaciones').val());

        if ($.browser.msie) {
            alert("PARA UNA MEJOR EXPERIENCIA LE RECOMENDAMOS QUE POR FAVOR UTILICE NAVEGADORES MODERNOS COMO CHROME O FIREFOX " + $.browser.version);
        }

        PanelDeControl.armarPostulaciones(postulaciones);
    });
 </script>
</html>