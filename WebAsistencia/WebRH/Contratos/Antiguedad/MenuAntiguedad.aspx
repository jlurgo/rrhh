﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuAntiguedad.aspx.cs" Inherits="Contratos_Antiguedad_MenuAntiguedad" %>

<%--<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <title>Portal RRHH</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width">
        <!-- CSS media query on a link element -->
        <%= Referencias.Css("../../")%>
        <%= Referencias.Javascript("../../")%>

        <script type="text/javascript" src="../../Scripts/ConversorDeFechas.js" ></script>
        <link rel="stylesheet" href="../../Portal/estilosPortalSecciones.css" type="text/css"  />
        <link rel="stylesheet" href="../../Formularios/EstilosFormularios.css" type="text/css"  />
        <link rel="stylesheet" href="../../estilos/estilos.css" type="text/css" />
       
        
        <%--<link id="link1" rel="stylesheet" href="~/Scripts/bootstrap/css/bootstrap.css" type="text/css" runat="server" />
        <link id="link2" rel="stylesheet" href="~/Scripts/bootstrap/css/bootstrap-responsive.css" type="text/css" runat="server" />
        <link id="link3" rel="stylesheet" href="~/Scripts/bootstrap/css/bootstrap.min.css" type="text/css" runat="server" />
        <link id="link4" rel="stylesheet" href="~/Scripts/bootstrap/css/bootstrap-responsive.min.css" type="text/css" runat="server" />--%>
        

        <style>
            #btn_realizar_solicitud
            {
                position: absolute;
                right: 10px;
                bottom: 10px;
            }
            
            #panel_derecho_credencial
            {
                position: absolute;
                right: 10px;
                width: 70%;
                bottom: 10px;
                top: 100px;
            }
            
            #titulo_vista_previa
            {
                position: absolute;
                left: 70px;
                top: 39px;
            }
            
            #vista_previa_credencial
            {
                position: absolute;
                left: 40px;
                top: 73px;
            }
        
            #vista_previa_credencial #imagen_credencial
            {
                width: 250px;
            }        
        
            #vista_previa_credencial #foto_usuario
            {
                position: absolute;
                top: 64px;
                left: 21px;
                height: 112px;
                width: 112px;
            }    
        
            #vista_previa_credencial #apellido
            {
                position: absolute;
                top: 196px;
                left: 19px;
                font-size: 20px;
                color: white;
            }    
        
            #vista_previa_credencial #nombres
            {
                position: absolute;
                top: 224px;
                left: 18px;
                font-size: 20px;
                color: white;
            }    
        
            #vista_previa_credencial #documento
            {
                position: absolute;
                top: 252px;
                left: 66px;
                font-size: 20px;
                color: white;
            }    
            
            #vista_previa_credencial #titulo_documento
            {
                position: absolute;
                top: 252px;
                left: 18px;
                font-size: 20px;
                color: white;
            }             
               
            .label_combo
            {
                width: 250px;
                text-align: right;
                margin-right: 10px;
            }
            
            .combo
            {
                width: 470px;;
            }
            
            .etiqueta_campo
            {
                color: Red;
                text-align: right;
                float: right;
                margin-right: 34px;
            }
            
            #btn_cambiar_foto
            {
                position: absolute;
                bottom: 10px;
                left: 48px;
            }
            .auto-style1 {
                width: 153px;
            }
        </style>
    </head>
<body>
    <form id="form1" runat="server">
    <%--<uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:18px; font-weight: bold; padding-top:25px;'>Datos<br/>Personales</span> <br/> " UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />--%>
    <div class="container-fluid">
        <h1 style="text-align:center; margin:17px; "></h1>
        <div style="margin: 0 auto;" class="row">
            <div style="text-align:center;" class="caja_izq"></div>
            
            <div class="caja_der papel">
                <legend style="margin-top: 20px;"></legend>
            

              <div style = "width:100%; text-align: center"; id="botonera_credenciales">
                <%--<div  style="display: inline-block;" > <button type="button" id="Button1" class="btn btn-primary">Ver credencial vigente</button></div>
                <div  style="display: inline-block;" > <button type="button" id="btn_credencial_vigente" class="btn btn-primary">Ver última credencial vigente</button></div>
                <div  style="display: inline-block;" > <button type="button" id="btn_aviso_solicitud" class="btn btn-danger">Tiene una solicitud pendiente de aprobación</button></div>
                <div  style="display: inline-block;" > <button type="button" id="btn_renovar_credencial" class="btn btn-primary">Solicitar nueva credencial</button></div>
                <div  style="display: inline-block;" > <button type="button" id="btn_historial_credenciales" class="btn btn-primary">Historial de credenciales</button></div>--%>
                
                <div  style="display: inline-block;" > <button type="button" id="btn_Estado" class="btn btn-primary">Agregar servicio administración pública</button></div>
                <div  style="display: inline-block;" > <button type="button" id="btn_Privado" class="btn btn-primary">Agregar servicio administración privada</button></div>

                </div>
                <br />

                <%--<div id="TablaHistoriaCredencial" class="table table-striped table-bordered table-condensed" >
                </div>--%>


              

           <%-- <div id="cajaSolicitudCredencial" style="display:none;" class="">
                <h3 style="text-align: center;">Solicitud de Credencial</h3>
                <br />
                <h4 id="titulo_vista_previa">Vista Previa Credencial</h4>
                <div id="vista_previa_credencial">
                    <div id="foto_usuario"></div>
                    <div id="apellido"></div>    
                    <div id="nombres"></div>    
                    <div id="titulo_documento">DNI:</div>    
                    <div id="documento"></div>    
                </div>
                <a id="btn_cambiar_foto" > Cambiar foto de perfil y credencial </a>
                <div id="panel_derecho_credencial">
                    <div class="">
                        <label class="label_combo" for="select_motivo">Indique el Motivo del pedido:</label>
                        <select class="combo" id="select_motivo">
                            <option value="0">--</option>
                            <option value="1">Deterioro</option>
                            <option value="2">Pérdida</option>
                            <option value="3">Robo</option>
                            <option value="4">Nunca tuve</option>
                        </select>                       
                    </div>
                    <br />
                    <div class="">
                        <label class="label_combo" for="select_organismo">Indique a que Organismo pertenece:</label>
                        <select class="combo" id="select_organismo">
                                
                        <option value="1">Ministerio de Desarrollo Social</option>
                        </select>                    

                    </div>
                    <br />
                    <div class="">
                        <label class="label_combo" for="cmb_lugar_de_entrega">Seleccione lugar de entrega:</label>
                        <select class="combo" id="cmb_lugar_de_entrega">                                
                        </select>                    

                    </div>
                    <br />

                    <label class="etiqueta_campo">Al hacer la solicitud, su credencial vigente será dada de baja.</label>
                  
                    <br/>
                    <label id = "texto_robo" class="etiqueta_campo" " for="cmb_provincia">*Para el caso de pérdida/robo debe presentar la denuncia policial, o Declaración Jurada firmada por el superior directo (Rango de Director o Superior), al momento de retirar la nueva credencial 
                        <a target="_blank" href="Files/DDJJCredencialPerdidaoRobo.pdf">Descargar modelo de DDJJ</a>
                    </label>
                    <label id = "texto_deterioro" class="etiqueta_campo" for="cmb_provincia">*Para el caso de credencial deteriorada, la misma debe devolverse al momento de retirar la nueva. </label>
                    <label id = "texto_seleccione_motivo" class="etiqueta_campo" for="cmb_provincia">*Seleccione un motivo </label>
                    <br />
                    <input  id="btn_realizar_solicitud" value="Solicitar nueva credencial" class="btn btn-primary" type="button" />
                </div>          
            </div>--%>


                    <%--<div class="row">
                         <div class="form-group col-sm-6 col-sm-4 col-md-2">
                                <label for="tar">tarjeta:</label>
                                <input class="form-control" name="tar" type="text" id="tar" value="00" style="width: 30px;" maxlength="2"/>
                         </div>
                         <div class="form-group col-sm-6 col-sm-4 col-md-2">
                                <label for="tar1">tarjeta1:</label>
                                <input class="form-control" name="tar1" type="text" id="tar1" value="00" style="width: 30px;" maxlength="2"/>
                         </div>       
                     </div>--%>

                 <div id="cajaDatosExpLaboral" style="display:none;"  class="">
                    <h3 style="text-align: center;" id="tituloExpLaboral"></h3>
                    <br />
                        
                    <table>
                        <tr>
                            <div class="">
                                <%--<label class="etiqueta_campo" style="margin-right: 28px;" for="cmbAmbitos">Ambito: <em style="color:Red;">*</em></label>--%>
                                    <td>
                                         
                                        <label>Ambito:</label>
                                        <select id="cmbAmbitos" style="width: 200px; margin-right: 30px;"></select>
                            
                                        <label>Folio:</label>
                                        <input type="text" id="txtNroFolio" value="00" style="width: 30px;" maxlength="2"/>
                                        -
                                        <input type="text" id="txtNroFolioDesde" value="000" style="width: 35px" maxlength="3" />
                                        -
                                        <input type="text" id="txtNroFolioHasta" value="000" style="width: 35px; margin-right: 30px;" maxlength="3"  />
                                    </td>
                                    <td >
                                        <label>Remunerado:</label>
                                        <br />
                                        <input type="radio" id="rdRemuneradoSI" value="1" name="Remunerado"/>  SI 
                                        <br />
                                        <input type="radio" id="rdRemuneradoNO" value="0" name="Remunerado"/>  NO (Ad Honorem) 
                                    </td>   
                            </div>
                        </tr>
                        <tr>  
                            <td>
                                <div class="">
                                    <label>Jurisdiccion:</label>
                                    <input type="text" value="" id="txtJurisdiccion" style="width: 400px" />
                                </div>
                                <div class="">
                                    <label>Caja de Previsión:</label>
                                    <input type="text" value="" id="txtCaja" style="width: 400px;" />
                                </div>
                                <div class="">
                                    <label>Nro de Afiliación:</label>
                                    <input type="text" value="" id="txtNroAfiliacion" style="width: 400px;" />
                                </div>
                            </td>
                            <td>
                                <div class="">
                                    <label>Tipo Documento:</label>
                                    <br/>
                                    <input type="radio" id="rdTipoDocumentoCTR" value="1" name="TipoDocumento" />  
                                    <label>Contrato</label>
                                    <br/>
                                    <input type="radio" id="rdTipoDocumentoCER" value="0" name="TipoDocumento" />   
                                    <label>Cert. de Serv.</label>
                                    <br/>
                                    <input type="radio" id="rdTipoDocumentoOTR" value="2" name="TipoDocumento" /> 
                                    <label>Otros</label>
                                </div>
                            </td>
                        </tr>  
                    </table>


                    <div style="border: thin solid #848484; width:100%;" >
                        
                        <label>Organismo:</label>
                        <input type="text" id="txtOrganismo" value="" style="width: 350px; margin-right: 30px" />
                            
                        <label>Cargo:</label>
                        <select runat="server" id="cmbCargo" name="Cargo" enableviewstate="false"></select>
                            
                        <br />

                        <label>Fecha Desde:</label>
                        <input type="text" id="txtFechaDesde" style="width: 110px; margin-right: 30px" placeholder="dd/mm/aaaa" />
                        
                        <label>Fecha Hasta:</label>
                        <input type="text" id="txtFechaHasta" style="width: 110px;" placeholder="dd/mm/aaaa" />
                            
                        <br />

                        <label>Domicilio:</label>
                        <input type="text" id="txtDomicilio" value="" style="width: 500px" />
                        
                        <div style="text-align:center">
                            <input type="button" value="Agregar" class="btn btn-primary" id="btn_Agregar" />
                            
                        </div>
                        
                        <br />
                        <div id="ContenedorGrillaServicios" runat="server" style="width: 95%" align="center">
                            <div id="ContenedorServicios" runat="server" style="width: 95%"></div>
                        </div>
                    </div>
                     <br />
                    <div>
                        <label>Causa de Egreso:</label>
                        <input type="text" id="txtCausaEgreso" value="" style="width: 400px" />
                    </div>

                    <input type="checkbox" id="DarDeBaja" name="DarDeBaja"  /> 
                     <label>Dar de Baja</label>


                    <div style="text-align:center;">
                        <input  id="btnGuardarExpLaboral" value="Guardar" class="btn btn-primary" type="button" />
                        <input  id="btn_Cerrar"  value="Cerrar" class="btn btn-primary" type="button"/>
                    </div>
                    
                </div>


                <legend style="margin-top: 20px;">Historial de Experiencia Laboral</legend>
                    <div id="tabla_Exp_Laboral">
                    </div>
                   
                    <%--<table id="tabla_Serv_Adm_Privada" class="table table-striped table-bordered table-condensed"></table>--%>
                    <%--<legend style="margin-top: 20px;">ESTUDIOS</legend>
                    <div id="tabla_estudios"></div>--%>

                </div>
               
            </div>
        

         <%--<div class="cajaEstudioOculta">
            <img src="../Imagenes/diploma.png" class="img_caja_estudio" alt="diploma" />
            <div class="div_dentro_de_caja_estudio" >
                <p><span class="titulo"></span> (<span class="nivel"></span>)</p>
                <p>Fecha Egreso: <span class="fecha"></span> </p>
            </div>
        </div>--%>

        <%--<div class="plantillas" style="display: none">
        </div>--%>

    </form>
</body>

<%--<script type="text/javascript" src="Legajo.js"></script>--%>
<script type="text/javascript" src="../../Scripts/Spin.js"></script>
<script type="text/javascript" src="../../Scripts/ControlesImagenes/VistaThumbnail.js"></script>
<script type="text/javascript" src="../../scripts/vex-2.1.1/js/vex.combined.min.js"></script>
<script type="text/javascript" src="MenuAntiguedad.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $(window).keydown(function (event) {
            if (event.keyCode == 13) {
                event.preventDefault();
                return false;
            }
        });


        var cfg_panel_alta = {
            inputFechaDesde: $('#txtFechaDesde'),
            inputFechaHasta: $('#txtFechaHasta'),
        }
        var panel_alta = new PanelFechas(cfg_panel_alta);


    });
</script>


<%--<script type="text/javascript" >
    $("#btn_credencial_vigente").hide();
    $(document).ready(function ($) {


        $("#texto_deterioro").hide();
        $("#texto_robo").hide();
        $("#texto_seleccione_motivo").hide();
        $("#btn_aviso_solicitud").hide();
        $("#btn_renovar_credencial").hide();
        $("#btn_historial_credenciales").hide();
        $("#botonera_credenciales").hide();
        Backend.start(function () {
            //para cargar el menu izquierdo 
            $(".caja_izq").load("SeccionIzquierda.htm", function () {

                Legajo.getNombre();
                Legajo.getDatosPersonales();
                Legajo.getDatosFamiliares();
                Legajo.getPsicofisicos();
                Legajo.getEstudios();
                Legajo.getCredencialesUsuario();
            });

            Backend.GetUsuarioLogueado().onSuccess(function (usuario) {

                if (usuario.Owner.IdImagen == -1) {


                    $("#cajaAgregarFotoPerfil").show();
                    $("#botonera_credenciales").hide();
                    $("#btn_cargar_foto").click(function () { $("#contenedor_foto_usuario").click(); });

                }
                else {

                    Backend.GetSolicitudesDeCredencialPorPersona().onSuccess(function (solicitudes) {

                        $("#botonera_credenciales").show();
                        if (_.some(solicitudes, function (sol) {
                            if (sol.Id == 0) return false;
                            if (sol.Estado == "ENTREGADO") return false;
                            if (sol.Estado == "RECHAZADO") return false;
                            return true;
                        })) {
                            $("#btn_aviso_solicitud").show();
                            $("#btn_renovar_credencial").hide();
                        }
                        else {
                            $("#btn_aviso_solicitud").hide();
                            $("#btn_renovar_credencial").show();
                        }
                        $("#btn_historial_credenciales").show();
                    });

                }

            });

            
            
            Backend.GetCredencialesTodasDePortal().onSuccess(function (credenciales) {
                var credencial_vigente = _.find(credenciales, function (c) { return c.Estado == "VIGENTE" });
                if (credencial_vigente) {
                    $("#btn_credencial_vigente").show();
                    $("#btn_credencial_vigente").click(function () {
                        var div = $("<div>");
                        div.load(window.location.origin + '/Componentes/CredencialVigente.htm', function () {
                            Componente.start(false, div);
                        });
                    });
                    //

                }

                $('#btn_renovar_credencial').click(function () {

                    //var ui = $("#cajaCambiarDomicilio");

                    vex.defaultOptions.className = 'vex-theme-os';
                    vex.open({
                        afterOpen: function ($vexContent) {
                            var ui = $("#cajaSolicitudCredencial").clone();
                            $vexContent.append(ui);
                            Backend.GetUsuarioLogueado().onSuccess(function (usuario) {
                                ui.find("#apellido").text(usuario.Owner.Apellido);
                                ui.find("#nombres").text(usuario.Owner.Nombre);
                                ui.find("#documento").text(usuario.Owner.Documento);

                                var img = new VistaThumbnail({
                                    id: usuario.Owner.IdImagen,
                                    contenedor: ui.find("#foto_usuario")
                                });                               
                            });

                            ui.find("#btn_cambiar_foto").click(function () { $("#contenedor_foto_usuario").click(); });

                            Backend.GetLugaresEntregaCredencial()
                                    .onSuccess(function (lugares) {
                                        _.forEach(lugares, function (lugar) {
                                            var opt = $("<option>");
                                            opt.text(lugar.Descripcion);
                                            opt.attr("value", lugar.IdLugar);
                                            ui.find("#cmb_lugar_de_entrega").append(opt);
                                        });
                                    });
                            ui.find("#select_motivo").change(function () {
                                var val = ui.find("#select_motivo").val();

                                if (val == 0) {
                                    ui.find("#texto_seleccione_motivo").show();
                                    ui.find("#texto_deterioro").hide();
                                    ui.find("#texto_robo").hide();
                                }

                                if (val == 1) {
                                    ui.find("#texto_deterioro").show();
                                    ui.find("#texto_robo").hide();
                                    ui.find("#texto_seleccione_motivo").hide();
                                }

                                if (val == 2) {
                                    ui.find("#texto_deterioro").hide();
                                    ui.find("#texto_robo").show();
                                    ui.find("#texto_seleccione_motivo").hide();
                                }

                                if (val == 3) {
                                    ui.find("#texto_deterioro").hide();
                                    ui.find("#texto_robo").show();
                                    ui.find("#texto_seleccione_motivo").hide();
                                }

                                if (val == 4) {
                                    ui.find("#texto_deterioro").hide();
                                    ui.find("#texto_robo").hide();
                                    ui.find("#texto_seleccione_motivo").hide();
                                }

                            });

                            ui.find("#btn_realizar_solicitud").click(function () {
                                if (ui.find("#select_motivo").val() == 0) {
                                    return;
                                }

                                Backend.SolicitarRenovacionCredencial(ui.find("#select_motivo").val(), ui.find("#select_organismo").val(), ui.find("#cmb_lugar_de_entrega").val()).onSuccess(function () {
                                    alertify.success("Solicitud creada con éxito");

                                    vex.close();
                                    setTimeout(function () { location.reload(); }, 1000);
                                });
                            });


                            ui.show();
                        },
                        css: {
                            'padding-top': "4%",
                            'padding-bottom': "0%"
                        },
                        contentCSS: {
                            width: "80%",
                            height: "90%"
                        }
                    });
                    //$('#cajaCambiarDomicilio').show();
                });
            });
        });
    });

</script> --%>
</html>

