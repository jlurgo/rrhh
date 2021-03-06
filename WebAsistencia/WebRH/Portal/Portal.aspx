﻿<%@ page language="C#" autoeventwireup="true" inherits="Portal_Portal" CodeFile="Portal.aspx.cs" %>

<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Portal RRHH</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="estilosPortal.css" type="text/css" media="screen" />
    <!-- CSS media query on a link element -->
    <link rel="stylesheet" href="estilosPortalSecciones.css" />
    <%= Referencias.Css("../")%>
    <%= Referencias.Javascript("../")%>
</head>
<body>
    <form id="form1" runat="server">
    <uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:18px; font-weight: bold; padding-top:25px;'>Portal<br/> del Empleado</span> <br/> "
        UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />
    <div id="content">
    
      <!-- <div class="Corona">
                <img src="../Imagenes/Coronavirus-sigirh-bot-6.png" id="img_logo_corona" alt="logosistema" style="cursor: pointer;" onclick='abrirCorona()' />
            </div>-->

    <div class="resumen_area"></div>
     <div class="resumen_postular">
     <p style="text-align:center">Información de la Comisión de Igualdad de Oportunidades y Trato - CIOT</p>
     <p style="text-align: center; margin: 5px;"><a href="../ciot/Principal.aspx" ><img src="../ciot/imagenes/logo.png" width="150px" height="80px" style="background-color:white" /></a></p>
         <br />
     <p style="text-align:center">Etica y Transparencia</p>
     <p style="text-align: center; margin: 5px;"><a href="../EticayTransparencia/Etica.aspx" ><img src="../EticayTransparencia/Imagenes/etica_transparencia.jpg" width="150px" height="80px" style="background-color:white" /></a></p>
     <p style="text-align:center">COVID</p>
     <p style="text-align: center; margin: 5px;"><a href="../covid/Principal.aspx" ><img src="../covid/imagenes/btnCovid.jpg" width="150px" height="80px" style="background-color:white" /></a></p>
        <%--<p style="text-align: center; margin: 5px;"><span style="margin: 20px; display: block;">Para SABER MÁS sobre el Proceso de RETIRO VOLUNTARIO hacé click en el círculo de abajo</span><a href="../Imagenes/AficheRetiroV.jpg" target="_blank" ><img src="../MenuPrincipal/RetiroV.png" width="80px" height="80px" /></a></p>--%>
        <%--<p style="text-align: center; margin: 5px;"><span style="margin: 20px; display: block;"class="panel-title"><a href="../MenuPrincipal/FormulRetiroV.pdf" target="_blank" >Para DESCARGAR el FORMULARIO del Proceso de RETIRO VOLUNTARIO hacé click acá</a></p>--%>
        <%--<hr class="lineas-subraya"/>--%>
        <%--<hr class="lineas-subraya"/>--%>
        <%--<p style="text-align: center; margin: 5px;"><span style="margin: 20px; display: block;">Para INSCRIBIRTE al Concurso de PLANTA PERMANENTE (Convocatoria Interna) hacé click en el circulo de abajo</span><a href="../FormularioConcursar/PanelDeControl.aspx" ><img src="../MenuPrincipal/Postular.png" width="80px" height="80px" /></a></p>--%>
     
         
     <div style="text-align: center; margin-top:20px;">
     <p>Para mas información click en las imágenes</p>
        <%--<p style="display:inline-block; text-align: center; width: 100px; margin: 0 auto; margin-bottom:15px;"><span style="margin-bottom: 10px; display: inline-block;"></span><a href="../Imagenes/001afiche.promo.lanzamiento.2017.jpg" target="_blank"><img src="../Imagenes/001afiche.promo.lanzamiento.2017.jpg" width="100px" height="150px" /></a></p>--%>
        <%--<p style="display:inline-block; text-align: center; width: 100px; margin: 0 auto;"><span style="margin-bottom: 10px; display: inline-block;"></span><a href="../Imagenes/002panfleto.promo.concurso.jpg" target="_blank"><img src="../Imagenes/002panfleto.promo.concurso.jpg" width="100px" height="120px" /></a></p>--%>
     </div>
     </div>
        <div class="navigation ch-grid" id="nav">
            <div class="ch-item_3d ch-img-1_3d">
                <div class="ch-info-wrap_3d">
                    <div class="ch-info_3d">
                        <div class="ch-info-front ch-img-1_3d">
                        </div>
                        <div class="ch-info-back_3d">
                            <%-- <h3>Bears Type</h3>
					<p>by Josh Schott <a href="http://drbl.in/ewUW">View on Dribbble</a></p>--%>
                            <%-- <img src="../Imagenes/portal/portal_empleado.png" alt="" class=""/>--%>
                        </div>
                    </div>
                    <div id="btnDatosPersonales" class="ch-item ch-img-1 item datosPersonales test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3 style="margin-top: 30px; line-height: 14px;">
                                        Datos Personales</h3>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="icon "></a>
                    </div>
                    <div id="btnEstudios" class="ch-item ch-img-1 item estudios test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3 style="font-size: 0.35em;">
                                        DOCUMENTOS</h3>
                                </div>
                            </div>
                        </div>
                        <a href="Documentos.aspx" class="icon "></a>
                    </div>
                    <div id="btnLicencias" class="ch-item ch-img-1 item licencias test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3>
                                        LICENCIAS</h3>
                                </div>
                            </div>
                        </div>
                        <a href="Licencias.aspx" class="icon "></a>
                    </div>
                    <div id="btnNotificaciones" class="ch-item ch-img-1 item capacitaciones test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3 style="font-size: 0.35em;">
                                        APLICACIONES</h3>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="icon "></a>
                    </div>
                    <div id="btnCapacitaciones" class="ch-item ch-img-1 item notificaciones test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3 style="font-size: 0.35em;">
                                        CAPACITACIONES</h3>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="icon "></a>
                    </div>
                    <div id="btnBeneficios" class="ch-item ch-img-1 item beneficios test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3>
                                        BENEFICIOS</h3>
                                </div>
                            </div>
                        </div>
                        <a href="Recibo.aspx" class="icon "></a>
                    </div>
                    <div id="btnOrganigrama" class="ch-item ch-img-1 item viaticos test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3 style="font-size: 0.35em;">
                                        ORGANIGRAMA</h3>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="icon "></a>
                    </div>
                    <div id="btnPerfil" style="box-shadow: none;" class="ch-item ch-img-1 item perfil test">
                        <div class="ch-info-wrap">
                            <div class="ch-info">
                                <div class="ch-info-front ch-img-1">
                                </div>
                                <div class="ch-info-back">
                                    <h3>
                                        CARRERA</h3>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="icon "></a>
                    </div>
                </div>
            </div>
            <%--<div class="item datosPersonales test ch-item ch-img-3" data-toggle="tooltip" data-placement="right" title="DATOS PERSONALES">--%>
            <%-- <img src="../Imagenes/portal/bg_user.png" alt="" width="100" height="100" class="circle"/>--%>
            <%-- </div>--%>
            <%--<div class="item estudios test" data-toggle="tooltip" data-placement="right" title="ESTUDIOS">
                    <%--<img src="../Imagenes/portal/bg_home.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
            <%--<div class="item licencias" data-toggle="tooltip" data-placement="right" title="LICENCIAS">
                    <%--<img src="../Imagenes/portal/bg_shop.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
            <%--<div class="item notificaciones" data-toggle="tooltip" data-placement="right" title="NOTIFICACIONES">
                    <%--<img src="../Imagenes/portal/bg_camera.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
            <%--<div class="item capacitaciones" data-toggle="tooltip" data-placement="right" title="CAPACITACIONES">
                   <%-- <img src="../Imagenes/portal/bg_fav.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
            <%-- <div class="item beneficios" data-toggle="tooltip" data-placement="right" title="BENEFICIOS">
                    <%--<img src="../Imagenes/portal/bg_fav.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
            <%-- <div class="item viaticos" data-toggle="tooltip" data-placement="right" title="VIÁTICOS">
                   <%-- <img src="../Imagenes/portal/bg_fav.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
            <%-- <div class="item perfil" data-toggle="tooltip" data-placement="right" title="PERFIL">
                    <%--<img src="../Imagenes/portal/bg_fav.png" alt="" width="199" height="199" class="circle"/>
                    <a href="#" class="icon"></a>
                </div>--%>
        </div>
    </div>
    <div style="color: #fff; width: 100%; position: absolute; top: 720px;">
        <p style="text-align: center; font-size: smaller; letter-spacing: 1.5px;">
            &copy; PROPIEDAD INTELECTUAL / TODOS LOS DERECHOS RESERVADOS / MINISTERIO DE DESARROLLO
            SOCIAL</p>
    </div>
    </form>
    <!-- The JavaScript -->
    <script type="text/javascript" src="Legajo.js?version=01"></script>
    <script type="text/javascript" src="../Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap/js/bootstrap-tooltip.js"></script>
    <!-- <script type="text/javascript" src="../MAU/HabilitadorDePermisos.js"></script>-->
    <script type="text/javascript">
        $(document).ready(function () {

            //DESCOMENTAR CUANDO SE TERMINE SINO HINCHABA LAS PELOTAS
            Backend.start(function () {
                Legajo.getAreaDeLaPersona();
                //HabilitadorDePermisos.traerPermisos();
                
                /* Backend.GetUsuarioLogueado().onSuccess(function (usuario) {
                        
                /*var levantar_prompt = function () {
                alertify.prompt("Ingrese su mail", "Para continuar debe ingresar una dirección de correo válida", "", function (ev, mail) {
                Backend.ModificarMiMail(mail).onSuccess(function (ok) {
                if (ok) {
                alertify.success("Mail modificado correctamente");
                }
                else alertify.error("Error al modificar el mail");
                }).onError(function () {
                alertify.error("Error al modificar el mail");
                });
                }, function () {
                setTimeout(function () { levantar_prompt(); }, 100);
                });
                };
                if (usuario.MailRegistro == '') {
                levantar_prompt();
                }
                });*/
            });

            $('[data-toggle="tooltip"]').tooltip();

            $('#btnDatosPersonales').click(function () {
                window.location.href = 'DatosPersonales.aspx';
            });

            $('#btnEstudios').click(function () {
                window.location.href = 'Documentos.aspx';
            });

            $('#btnPerfil').click(function () {
                window.location.href = 'Perfil.aspx';
            });

            $('#btnLicencias').click(function () {
                window.location.href = 'Licencias.aspx';
            });

            $('#btnBeneficios').click(function () {
                window.location.href = 'Recibo.aspx';
            });

            $('#btnNotificaciones').click(function () {
                window.location.href = '../MenuPrincipal/Menu.aspx';
            });

            $('#btnOrganigrama').click(function () {
                window.location.href = 'Organigrama.aspx';
            });

        });

        /*$(function () {
        $('#nav > div').hover(
        function () {
        var $this = $(this);
        $this.find('img').stop().animate({
        'width': '199px',
        'height': '199px',
        'top': '-25px',
        'left': '-25px',
        'opacity': '1.0'
        }, 500, 'easeOutBack', function () {
        $(this).parent().find('ul').fadeIn(700);
        });

        $this.find('a:first,h2').addClass('active');
        },
        function () {
        var $this = $(this);
        $this.find('ul').fadeOut(500);
        $this.find('img').stop().animate({
        'width': '52px',
        'height': '52px',
        'top': '0px',
        'left': '0px',
        'opacity': '0.1'
        }, 5000, 'easeOutBack');

        $this.find('a:first,h2').removeClass('active');
        }
        );
        });*/
    </script>

    <script type="text/javascript" >
    function abrirCorona(){
       //window.open("http://localhost:43414/Portal/coronavirusddjj.aspx");
        window.location.assign("coronavirusddjj.aspx")
    
     }
</script>
</body>
</html>
