﻿var VistaDeLegajoModi = function (opt) {
    this.o = opt;
    this.start();
};

VistaDeLegajoModi.prototype.start = function () {
    this.o.ui.css('opacity', '0');
    this.lbl_resumen_datos_personales = this.o.ui.find('#lbl_resumen_datos_personales');
    this.panel_documentos = this.o.ui.find('#panel_documentos');
    this.div_imagenes_no_asignadas = this.o.ui.find('#panel_imagenes_no_asignadas');
    this.vistasDeDocumentos = [];
    this.servicioDeDragAndDrop = new ServicioDeDragAndDrop();
    var _this = this;
    this.panel_imagenes_no_asignadas = new PanelDeImagenes({
        servicioDeLegajos: this.o.servicioDeLegajos,
        servicioDeDragAndDrop: this.servicioDeDragAndDrop,
        mensajeParaCuandoEstaVacio: 'Este legajo no tiene imágenes sin asignar',
        onImagenDropeada: function (imagen) {
            _this.o.servicioDeLegajos.desAsignarImagen(imagen.id);
        }
    });
    this.panel_imagenes_no_asignadas.dibujarEn(this.div_imagenes_no_asignadas);

    this.btn_nueva_busqueda = this.o.ui.find('#btn_nueva_busqueda');
    this.btn_nueva_busqueda.click(function () {
        _this.o.ui.css('opacity', '0');
        _this.buscadorDeLegajos.mostrarModal();
    });
};

VistaDeLegajoModi.prototype.mostrandoVisualizadorDeImagenes = function () {
    return this.visualizadorDeImagenes.visible;
};

VistaDeLegajoModi.prototype.mostrarLegajo = function (legajo) {
    this.lbl_resumen_datos_personales.text(legajo.apellido + ", " + legajo.nombre + " (" + legajo.numeroDeDocumento + ") Id Interna:" + legajo.idInterna);
    this.vistasDeDocumentos = [];
    this.panel_documentos.empty();

    var _this = this;
    for (var i = 0; i < legajo.documentos.length; i++) {
        var vista_documento = new VistaDeDocumentoModi({
            ui: this.o.plantilla_vista_documento.clone(),
            documento: legajo.documentos[i],
            plantilla_vista_imagen: this.o.plantilla_vista_imagen,
            servicioDeLegajos: this.o.servicioDeLegajos,
            servicioDeDragAndDrop: this.servicioDeDragAndDrop,
            visualizadorDeImagenes: this.visualizadorDeImagenes,
            numero_legajo: legajo.idInterna,
            servicioDeCategorias: this.o.servicioDeCategorias
        });
        this.vistasDeDocumentos.push(vista_documento);
        vista_documento.dibujarEn(this.panel_documentos);
    }

    this.panel_imagenes_no_asignadas.cargarImagenes(legajo.idImagenesSinAsignar);
    this.o.ui.css('opacity', '1');
};
