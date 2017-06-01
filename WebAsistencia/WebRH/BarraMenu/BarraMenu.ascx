﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BarraMenu.ascx.cs" Inherits="FormularioDeViaticos_BarraMenu" %>
<%@ Register Src="FormPassword.ascx" TagName="FormPassword" TagPrefix="uc5" %>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link id="link1" rel="stylesheet" href="<%= UrlEstilos %>EstilosBarraMenu.css" type="text/css" />
    <link id="link2" rel="stylesheet" href="<%= UrlEstilos %>BarraMenuUsuarios.css" type="text/css" />
    <link href="../scripts/vex-2.1.1/css/vex.css" rel="stylesheet">
    <link href="../scripts/vex-2.1.1/css/vex-theme-os.css" rel="stylesheet">
    <link rel="stylesheet" href="../Estilos/bootstrap.min.css">
    <link href="../scripts/vex-2.1.1/css/vex.css" rel="stylesheet">
    <link href="../scripts/vex-2.1.1/css/vex-theme-os.css" rel="stylesheet">
    <script type="text/javascript" src="../BarraMenu/BarraMenu.js"></script>
    <script type="text/javascript" src="../BarraMenu/MenuDesplegable.js"></script>
    <script type="text/javascript" src="../BarraMenu/VistaAlerta.js"></script>
    <script type="text/javascript" src="../BarraMenu/VistaSolicitudDeCambioDeImagen.js"></script>
    <script type="text/javascript" src="../BarraMenu/VistaItemMenu.js"></script>
    <script type="text/javascript" src="../Scripts/ControlesImagenes/VistaThumbnail.js"></script>
    <script type="text/javascript" src="../Scripts/ControlesImagenes/SubidorDeImagenes.js"></script>
    <script type="text/javascript" src="../scripts/vex-2.1.1/js/vex.combined.min.js"></script>
</head>
<div id="barra_menu_contenedor" class="no-print">
    <div id="contenedor_imagen">
        <img src="<%= UrlImagenes %>logo_sistema.png" id="img_logo_sistema" alt="logosistema" />
        <img src="<%= UrlImagenes %>logo_ministerio.png" id="img_logo_minis" alt="logosistema" />
        <img src="<%= UrlImagenes %>logo_direccion.png" id="img_logo_direccion" alt="logosistema" />
        <div id="barra_menu_nombre_sistema">
        </div>
    </div>
    <div id="barra_navegacion"> 
        <div id="boton_home">
            <img src="<%= UrlImagenes %>Home-icono.png" id="home_imagen" alt="homeicono" />
        </div>
        <div id="contenedor_imagen_usuario">
            <img src="<%= UrlImagenes %>portal/portal_empleado.png" id="foto_usuario_icono" alt="fotouser" />
            <div id="imagen">
            </div>
        </div>
        <div id="contenedor_menu_usuarios" class="menu_usuario sombrita" style="display: none;">
            <div class="flechita">
            </div>
            <div id="contenedor_foto_usuario">
                <img id="foto_usuario_generica" src="<%= UrlImagenes %>portal/portal_empleado.png"
                    alt="fotousuariogenerica" class="foto_menu_estilo" />
                <div id="foto_usuario_menu" class="foto_menu_estilo">
                </div>
                <div id="barrita_cambio_imagen">
                    <div>
                        Cambiar</div>
                    <div>
                        Imágen</div>
                </div>
            </div>
            
            <div id="nombre_user" class="cabecera_menu_usuario">
            </div>
            <div id="apellido_user" class="cabecera_menu_usuario">
            </div>
            <div id="dni_user" class="cabecera_menu_usuario">
            </div>
            <div id="email_user" class="cabecera_menu_usuario">
            </div>
            <div id="info_usuario">
            <a id="link_area" style="display:none;">Mi Área</a>
                <a id="cambiar-email_usuario" class="" name="signup" >Modificar correo</a>
                <%--<button id="cambiar-email_usuario" type="button" class="btn barra_menu_botones sombrita-iconos">
                    Modificar correo</button>
                <button id="cambiar-constrasena_usuario" type="button" class="btn btn-info datos_usuario">
                        Modificar contraseña </button> btn barra_menu_botones sombrita-iconos --%>
                <a id="go" rel="leanModal" class="" name="signup" href="#signup">Cambiar Contraseña</a>
                <uc5:FormPassword ID="FormPassword" runat="server" />
                <div id="cerrar-sesion_usuario">
                    <asp:Button ID="CerrarSessionLinkButton" CssClass="btn btn-primary"
                        runat="server" OnClick="CerrarSessionLinkButton_Click" Text="Cerrar Sesión">
                    </asp:Button>
                </div>
            </div>
        </div>
        <div id="contenedor_imagen_cuadrados" class="sombrita-iconos">
            <img src="<%= UrlImagenes %>cuadraditos.png" id="menu_cuadrados" alt="fotousuariomenu" />
        </div>
        <div id="contenedor_menu_cuadrados" class="menu_usuario sombrita" style="display: none;">
            <div class="flechita">
            </div>
        </div>
        <!--mensajes-->
        <div id="contenedor_imagen_mensajes">
            <div id="contador_rojo">
            </div>
            <img src="<%= UrlImagenes %>alertas-icono.png" id="menu_mensajes" alt="fotousuariomenu" />
        </div>
        <div id="contenedor_menu_mensajes" class="menu_usuario sombrita-iconos" style="display: none;">
            <div class="flechita">
            </div>
            <div id="contenedor_alertas" class="contenedor_de_alertas_y_mensajes">
            </div>
        </div>

         <div id="contenedor_imagen_tareas">
            <div id="contador_rojo">
            </div>
            <img src="<%= UrlImagenes %>tareas-icono.png" id="menu_tareas" alt="fotousuariomenu" />
        </div>
        <div id="contenedor_menu_tareas" class="menu_usuario sombrita-iconos" style="display: none;">
            <div class="flechita">
            </div>
            <div id="contenedor_tareas" class="contenedor_de_alertas_y_mensajes">
            </div>
        </div>
    </div>
    <div id="sub_barrita_negra"></div>
    <div id="plantillas_barra_menu" style="display: none">
        <div id="indicaciones_al_subir_imagen">
            <div id="titulo_indicaciones">
                Al elegir la foto para subir, por favor, tené en cuenta lo siguiente:
            </div>
            <div class=indicacion>
                1-Esta foto es la que te identificará en tu legajo y otros documentos del Ministerio (como la credencial).
            </div>
            <div class=indicacion>  
                2-Procurá que se vea tu cara sobre un fondo claro.                
            </div>
            <div class=indicacion>  
                3-La imagen debe contener la cara completa desde los hombros hasta arriba del pelo.              
            </div>
            <div class=indicacion>  
                4-Evitar ojos cerrados, anteojos y sombreros.              
            </div>
            <div class=indicacion>     
                5-Tu cara debe ser la única que aparezca en la imagen           
            </div>
            <image id="btn_ok" src="<%= UrlImagenes %>botones/ok.png"/>
        </div>
        <a class="ui_vista_item_menu">
            <img class='redondeo-modulos' style='margin: 5px;'/>
        </a>

        <div class="ui_mensaje_alerta mensaje_alerta sombra-mensaje">
            <p class="titulo_mensaje_alerta">
                Mensaje 1</p>
            <p class="contenido_mensaje_alerta">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <image id="btn_ok" src="<%= UrlImagenes %>botones/ok.png"/>
        </div>

        <div class="ui_tarea sombra-mensaje">
            <p class="titulo_tarea">
                bla</p>
            <p class="descripcion_tarea">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>

        <div id="contenedor_chat_mensajes">
            <div id="titulo_chat">
            </div>
            <div id="cuerpo_chat">
                <div id="plantilla_mensaje">
                </div>
            </div>
            <input id="btn_enviar" type="button" class="btn btn-primary" value="Enviar" />
            <input id="btn_cerrar" type="button" class="btn btn-primary" value="Cerrar" />
            <input id="bnt_finalizar" type="button" class="btn btn-primary" value="Finalizar" />
        </div>
    </div>
     <div id="div_mi_area" style="display: none">
     <div class="load_imagen" style="text-align:center;">CARGANDO ... <br /><img src="../Imagenes/load.gif" alt="cargando" height="142" width="142"/></div>
     <div class="resumen_area"></div>
     </div>

</div>