﻿var VistaDeDocumentoModi = function (opt) {
    this.o = opt;
    this.start();
};

VistaDeDocumentoModi.prototype.start = function () {
    this.lbl_descripcion_en_RRHH = this.o.ui.find('#lbl_descripcion_en_RRHH');
    this.panel_folios = this.o.ui.find('#panel_folios');
    this.lbl_descripcion_en_RRHH.text(this.o.documento.descripcionEnRRHH);

    var _this = this;

    for (var i = 0; i < this.o.documento.folios.length; i++) {
        var vista_folio = new VistaDeFolioModi({
            folio: this.o.documento.folios[i],
            servicioDeLegajos: this.o.servicioDeLegajos,
            servicioDeDragAndDrop: this.o.servicioDeDragAndDrop,
            numero_legajo: this.o.numero_legajo
        });
        vista_folio.dibujarEn(this.panel_folios);
    }

    this.cmb_categorias = this.o.ui.find('#cmb_categoria select');
    this.o.servicioDeCategorias.categoriasDocumentosSICOI(function (categorias) {
        for (var i = 0; i < categorias.length; i++) {
            var o_categoria = $('<option id="' + categorias[i].Id + '">');
            o_categoria.text(categorias[i].descripcion);
            _this.cmb_categorias.append(o_categoria);
        }
        _this.cmb_categorias.find('#' + _this.o.documento.idCategoria).attr('selected', 'selected');
    });

    this.cmb_categorias.change(function () {
        _this.o.servicioDeLegajos.asignarCategoriaADocumento(_this.cmb_categorias.find(":selected").attr('id'),
                                                                _this.o.documento.tabla,
                                                                _this.o.documento.id);
    });

};

VistaDeDocumentoModi.prototype.dibujarEn = function (panel) {
    panel.append(this.o.ui);
}; 
