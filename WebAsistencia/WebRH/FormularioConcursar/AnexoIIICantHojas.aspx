﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnexoIIICantHojas.aspx.cs" Inherits="FormularioConcursar_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <title></title>
     <%= Referencias.Css("../")%>    

     <link rel="stylesheet" type="text/css" href="EstilosPostular.css" />
     <style type="text/css">
        .celda {
            border: 3px double #000;
            padding:3px;
        }
        
        .celda_vacia 
        {
            padding:15px 0px;
            border: 3px double #000;
            }
        
        .tabla_anexo_1 
        {
            font-size:0.9em;
            width:100%;
            }


 @media print
        {    
    .no-print, .no-print *
    {
        display: none !important;
    }

     
     </style>
</head>
<body>

    <form id="form1" runat="server">
    
<input type="hidden" id = "codigo_postu" runat = "server"/>
<input type="hidden" id = "fecha_postu" runat = "server"/>
    
    <div style="width: 75%; margin-left:10%; height: 949px;" class="">
        <div style=" text-align:left;" class="">
            <p style="float:left;" class=""><b>Postulación Nº:     <span id="num_postulacion" style="font-size:1.2em;"></span></b> <label class="">. Recepcionó:</label> <span id ="span_recepcion"></span> </p>
            <p style="float:right;">ANEXO III</p>
            <div style="clear:both;"></div>
            <p class="encabezado"style="font-size:20px; margin-bottom:1%;margin-top:1%">CONSTANCIA DE RECEPCIÓN DE LA SOLICITUD.
             <br />
             FICHA DE INSCRIPCIÓN Y DE LA DOCUMENTACIÓN PRESENTADA</p>
            <%--<p class="encabezado"style="font-size:20px; margin-bottom:1%;margin-top:1%"></p>--%>
        </div>
        <table class="tabla_anexo_1">
            <tr >
                <td colspan="2" class="celda">FICHA DE INSCRIPCIÓN Nº</td>
                <td colspan="2" class="celda"></td>
            </tr>
           <%-- <tr >
                <td colspan="2" class="celda">N° DEL REGISTRO CENTRAL DE OFERTAS DE EMPLEO</td>
                <td id="numero_de_oferta" colspan="2" class="celda"></td>
            </tr>--%>
            <tr>
                <td colspan="2" class="celda">TIPO DE CONVOCATORIA</td>
                <td id="puesto_tipo" colspan="2" class="celda"></td>
            </tr>
            <tr>
                <td colspan="2" class="celda">DENOMINACION DEL CARGO A CUBRIR</td>
                <td id="puesto_denominacion" colspan="2" class="celda"></td>
            </tr>
            <tr>
                <td colspan="2" class="celda">AGRUPAMIENTO</td>
                <td id="puesto_agrupamiento" colspan="2" class="celda"></td>
            </tr>
            <tr>
                <td class="celda">NIVEL ESCALAFONARIO</td>
                <td id="nivel_escalafonario" class="celda"></td>
                <td class="celda">NIVEL DE JEFATURA</td>
                <td id="nivel_jefatura" class="celda"></td>
            </tr>
            <tr >
                <td colspan="2" class="celda">JURISDICCION/ENTIDAD DESCENTRALIZADA</td>
                <td id="jurisdiccion" colspan="2" class="celda"></td>
            </tr>
            <tr >
                <td colspan="2" class="celda">SECRETARIA/SUBSECRETARIA</td>
                <td id="secretaria" colspan="2" class="celda"> </td>
            </tr>
            <tr >
                <td colspan="2" class="celda">DIRECCION NACIONAL/GENERAL O EQUIVALENTE</td>
                <td id="direccion" colspan="2" class="celda"> </td>
            </tr>
            <tr >
                <td colspan="2" class="celda">DIRECCION</td>
                <td id="domicilio_lugar_de_trabajo" colspan="2" class="celda"></td>
            </tr>
            <tr >
                <td colspan="2" class="celda">APELLIDO Y NOMBRES DEL INSCRIPTO</td>
                <td id="apellido_y_nombre" colspan="2" class="celda"></td>
            </tr>
            <tr >
                <td colspan="2" class="celda">TIPO Y NUMERO DE DOCUMENTO</td>
                <td id="documento" colspan="2" class="celda"></td>
            </tr>    
            <tr><td colspan="4" class="celda"></td></tr>
            <tr>
                <td style="text-align:center;" colspan="3" class="celda">LISTADO DOCUMENTACION PRESENTADA</td>
                <td style="text-align:center;" colspan="1" class="celda">FOLIOS</td>
            </tr>
            <tr>
                <td colspan="3" class="celda" style="font-size:16px;">Ficha de Inscripci&oacute;n</td>
                <td colspan="1" class="celda"> <span id ="Ficha_inscripcion" 
                       style="display:block;margin:0px auto;padding-left: 35px"></span> </td>
            </tr>
            <tr>
                <td colspan="3" class="celda"style="font-size:16px;">Foto tipo carnet</td>
                <td colspan="1" class="celda">   <span id ="Foto_carnet"  style="display:block;margin:0px auto;padding-left: 35px"></span> </td>
            </tr>
            <tr>
                <td colspan="3" class="celda"style="font-size:16px;">Fotocopia de DNI</td>
                <td colspan="1" class="celda"> <span id ="Fotocopia_dni"  style="display:block;margin:0px auto;padding-left: 35px"></span> </td>
            </tr>
                <tr>
                <td colspan="3"  class="celda"style="font-size:16px;">Fotocopia del t&iacute;tulo acad&eacute;mico</td>
                <td colspan="1"  class="celda"><span id ="Fotocopia_titulo"  style="display:block;margin:0px auto;padding-left: 35px"></span></td>
            </tr>
             <tr>
                <td colspan="3"  class="celda"style="font-size:16px;">Curr&iacute;culum Vitae</td>
                <td colspan="1"  class="celda"><span id ="Cv"  style="display:block;margin:0px auto;padding-left: 35px"></span></td>
            </tr>
             <tr>
                <td colspan="3"  class="celda"style="font-size:16px;">Documentaci&oacute;n de respaldo</td>
                <td colspan="1"  class="celda"> <span id ="Documentacion"  style="display:block;margin:0px auto;padding-left: 35px"></span></td>
            </tr>


        </table>        

        <p style="border: 1px solid #000; padding:5px; padding-bottom:50px;">OBSERVACIONES (consignar si la inscripción fue efectuada por apoderado debidamente acreditado) Consignar
        entrega de las Bases del Concurso y cualquier otra documentación</p>

        <div class="div-pie-tabla" style="height:50px;">
            <table border="border-collapse: collapse" style="border-collapse: collapse; height:50px;" class="pie-tabla" >
            <tr>
                <td class="td-pie-tabla"><span class="letra-bold" style="height:50px;">Fecha de Inscripción</span></td>
                <td class="td-pie-tabla"><span class="letra-bold" style="height:50px;">Firma y Aclaración del Inscriptor o Apoderado</span></td>
            </tr>
            </table>
            <br />
            <div style="text-align:center;">
                <input  type ="button" value="IMPRIMIR" onclick="Imprimir();" class="btn btn-primary no-print" />
            </div>
           
           <%-- <p class="p-imprimir"><button class="btn btn-primary" onclick="ImprimirCVPostulado()">Imprimir</button></p>--%>
        </div>	
    </div>

<asp:HiddenField ID="postulacion" runat="server" />
<asp:HiddenField ID="curriculum" runat="server" />
<asp:HiddenField ID="idPostulante" runat="server" />
        
    </form>
</body>
<%= Referencias.Javascript("../") %>
<script type="text/javascript" src="Anexo.js" ></script>
<script type="text/javascript" src="curriculum.js" ></script>
<script type="text/javascript" src="../Scripts/ConversorDeFechas.js" ></script>

<script type="text/javascript">
    //Backend.start();

    function ImprimirCVPostulado() {
        //window.print();
    }


    function Imprimir() {
        window.print();
    }

    Backend.start(function () {
        $(document).ready(function () {
            ///
            $("#codigo_postu")[0].innerHTML = localStorage.getItem("nro_inscripcion");
            $("#fecha_postu")[0].innerHTML = localStorage.getItem("fecha_inscripcion");

            $("#Ficha_inscripcion")[0].innerHTML = localStorage.getItem("ficha_inscripcion");
            $("#Foto_carnet")[0].innerHTML = localStorage.getItem("foto_carnet");
            $("#Fotocopia_dni")[0].innerHTML = localStorage.getItem("fotocopia_dni");
            $("#Fotocopia_titulo")[0].innerHTML = localStorage.getItem("fotocopia_titulo");
            $("#Cv")[0].innerHTML = localStorage.getItem("Curri");
            $("#Documentacion")[0].innerHTML = localStorage.getItem("Docum_respaldo");
            //$("#idPostulante")[0].val(localStorage.getItem("idPostulante"));




            ///
            Anexo.armarAnexo();

            //$("#apellido_y_nombre").text(localStorage.getItem("empleado"));
            //$("#documento").text(localStorage.getItem("dni"));

            $.ajax({
                url: "../AjaxWS.asmx/GetUsuario",
                type: "POST",
                //data: data,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (respuestaJson) {

                    usuario = respuestaJson.d;



                    var fullName = usuario.split(' ');
                    var nombre = fullName[0];
                    var apellido = fullName[fullName.length - 1];

                    //  document.getElementById("span_recepcion").innerHTML = respuestaJson.d;
                    document.getElementById("span_recepcion").innerHTML = nombre + " " + apellido; // localStorage.getItem("usuario"); // usuario;

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alertify.alert("", errorThrown);
                }
            });





            //   window.print();
        });
    });

</script>

</html>
