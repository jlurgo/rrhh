﻿
var PanelDeDocumentos = function (cfg) {
    var self = this;
    this.lista_de_fichas = new ListaDeFichas(new FabricaDeFichasDeDocumento(cfg.plantillaFichaChica, cfg.plantillaFichaGrande, cfg.plantillaTransicion, cfg.listaAreas, cfg.areaDelUsuario), cfg.uiListaDeDocs);
    var proveedor = {
        pedirDatos: function (callback) {
            WebService.getDocumentosFiltrados(self._panel_filtros.getFiltrosActivos(), callback);
        }
    };
    this.lista_de_fichas.setProveedorDeDatos(proveedor);
    this.lista_de_fichas.dibujarEn(cfg.divPanelDocumentos);
    this.btnOrdenarPorAreaActual = cfg.btnOrdenarPorAreaActual;
    this.btnOrdenarPorAreaActual.click(function () {
        self.ordenarPorAreaActual();
    });
    this.btnOrdenarPorTipo = cfg.btnOrdenarPorTipo;
    this.btnOrdenarPorTipo.click(function () {
        self.ordenarPorTipo();
    });
}

PanelDeDocumentos.prototype = {
    limpiarFlechasOrdenamiento: function () {
        this.btnOrdenarPorAreaActual.find("i").removeClass("icon-chevron-up");
        this.btnOrdenarPorAreaActual.find("i").removeClass("icon-chevron-down");
        this.btnOrdenarPorTipo.find("i").removeClass("icon-chevron-up");
        this.btnOrdenarPorTipo.find("i").removeClass("icon-chevron-down");
    },
    ordenarPorAreaActual: function () {
        var self = this;
        this.lista_de_fichas.ordenarPor(function (d) { return d.areaActual.descripcion; });
        this.limpiarFlechasOrdenamiento();
        this.btnOrdenarPorAreaActual.find("i").addClass("icon-chevron-down");
        this.btnOrdenarPorAreaActual.unbind("click");
        this.btnOrdenarPorAreaActual.click(function () {
            self.ordenarPorAreaActualEnFormaDescendente();
        });
    },
    ordenarPorAreaActualEnFormaDescendente: function () {
        var self = this;
        this.lista_de_fichas.ordenarDescendentementePor(function (d) { return d.areaActual.descripcion; });
        this.limpiarFlechasOrdenamiento();
        this.btnOrdenarPorAreaActual.find("i").addClass("icon-chevron-up");
        this.btnOrdenarPorAreaActual.unbind("click");
        this.btnOrdenarPorAreaActual.click(function () {
            self.ordenarPorAreaActual();
        });
    },
    ordenarPorTipo: function () {
        var self = this;
        this.lista_de_fichas.ordenarPor(function (d) { return d.tipo.descripcion; });
        this.limpiarFlechasOrdenamiento();
        this.btnOrdenarPorTipo.find("i").addClass("icon-chevron-down");
        this.btnOrdenarPorTipo.unbind("click");
        this.btnOrdenarPorTipo.click(function () {
            self.ordenarPorTipoEnFormaDescendente();
        });
    },
    ordenarPorTipoEnFormaDescendente: function () {
        var self = this;
        this.lista_de_fichas.ordenarDescendentementePor(function (d) { return d.tipo.descripcion; });
        this.limpiarFlechasOrdenamiento();
        this.btnOrdenarPorTipo.find("i").addClass("icon-chevron-up");
        this.btnOrdenarPorTipo.unbind("click");
        this.btnOrdenarPorTipo.click(function () {
            self.ordenarPorTipo();
        });
    },
    refrescarDocumentos: function () {
        this.limpiarFlechasOrdenamiento();
        this.lista_de_fichas.refrescar();
    },
    mostrarDocumentos: function (docs) {
        this.lista_de_fichas.borrarContenido();
        this.lista_de_fichas.cargarObjetos(docs);
    },
    setPanelDetalle: function (panel) {
        this._panel_detalle = panel;
    },
    setPanelFiltros: function (panel) {
        this._panel_filtros = panel;
        this.lista_de_fichas.refrescar();
    },
    desSeleccionarTodo: function () {
        this.lista_de_fichas.desSeleccionarTodo();
    }
}



//    this._grilla_de_documentos = new Grilla(
//                [
//                    new Columna('Ticket', { generar: function (doc) { return doc.ticket } }),
//                    new Columna('Número', { generar: function (doc) { return self.getTextoresumido(doc.tipo.descripcion + ":" + doc.numero) } }),
//                    new Columna('Categoría', { generar: function (doc) { return self.getTextoresumido(doc.categoria.descripcion) } }),
//                    new Columna('Extracto', { generar: function (doc) { return self.getTextoresumido(doc.extracto) } }),
//                    new Columna('Fecha Alta', { generar: function (doc) { return doc.fechaDeAlta } }),
//                    new Columna('Área Creadora', { generar: function (doc) { return self.getAreaResumida(doc.areaCreadora.descripcion) } }),
//                    new Columna('Área Actual', { generar: function (doc) { return self.getAreaResumida(doc.areaActual.descripcion) } }),
//                    new Columna('Hace', { generar: function (doc) { return doc.enAreaActualHace.dias + " días" } }),
//                    new Columna('Área Destino', { generar: function (doc) { return self.getAreaResumida(doc.areaDestino.descripcion) } }),
//                    new Columna('Obs.', { generar: function (doc) {
//                        var comentarios = "";
//                        if (doc.comentarios != "") {
//                            var comentarios = "*";
//                        }
//                        return comentarios
//                    }
//                    }),
//                    new Columna('Acciones', { generar: function (doc) {
//                        var contenedorAcciones = $('<div>');
//                        if (doc.areaDestino.id > -1) {
//                            var botonEnviar = $('<input>');
//                            botonEnviar.attr('id', 'btnEnviarDocumentoEnGrilla');
//                            botonEnviar.attr('type', 'button');
//                            botonEnviar.addClass('btn');
//                            botonEnviar.addClass('btn-primary');
//                            botonEnviar.val('enviar');
//                            botonEnviar.click(function () {
//                                var post_url;
//                                var post_data;
//                                if (cfg.areaDelUsuario.id == doc.areaActual.id) {
//                                    post_url = "../AjaxWS.asmx/TransicionarDocumento";
//                                    post_data = JSON.stringify({
//                                        id_documento: doc.id,
//                                        id_area_origen: doc.areaActual.id,
//                                        id_area_destino: doc.areaDestino.id
//                                    });
//                                } else {
//                                    post_url = "../AjaxWS.asmx/TransicionarDocumentoConAreaIntermedia";
//                                    post_data = JSON.stringify({
//                                        id_documento: doc.id,
//                                        id_area_origen: doc.areaActual.id,
//                                        id_area_intermedia: cfg.areaDelUsuario.id,
//                                        id_area_destino: doc.areaDestino.id
//                                    });
//                                }

//                                $.ajax({
//                                    url: post_url,
//                                    type: "POST",
//                                    data: post_data,
//                                    dataType: "json",
//                                    contentType: "application/json; charset=utf-8",
//                                    success: function (respuestaJson) {
//                                        var respuesta = JSON.parse(respuestaJson.d);
//                                        if (respuesta.tipoDeRespuesta == "envioDeDocumento.ok") {
//                                            self.refrescarGrilla();
//                                        }
//                                        if (respuesta.tipoDeRespuesta == "envioDeDocumento.error") {
//                                            alert("Error al enviar el documento: " + respuesta.error);
//                                        }
//                                    },
//                                    error: function (XMLHttpRequest, textStatus, errorThrown) {
//                                        alert(errorThrown);
//                                    }
//                                });
//                            });
//                            contenedorAcciones.append(botonEnviar);
//                        }
//                        return contenedorAcciones;
//                    }
//                    })
//                ]);

//    this._grilla_de_documentos.SetOnRowClickEventHandler(function (doc) {
//        self._panel_detalle.mostrarDocumento(doc);
//    });

//    var proveedor = {
//        pedirDatos: function (callback) {
//            WebService.getDocumentosFiltrados(self._panel_filtros.getFiltrosActivos(), callback);
//        }
//    };
//    this._grilla_de_documentos.setProveedorDeDatos(proveedor);

//    //CargarObjetos(cfg.listaDocumentos);
//    this._grilla_de_documentos.DibujarEn(cfg.divPanelDocumentos);