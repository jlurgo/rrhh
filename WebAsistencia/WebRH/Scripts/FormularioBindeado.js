var FormularioBindeado = function (opt) {
    var _this = this;
    this.html_form = opt.formulario;
    this.modelo = opt.modelo;

    this.html_form.find("[rh-control-type='combo']").each(function (i, e) {
        _this.crearYBindearCombo($(e));
    });

    this.html_form.find("[rh-control-type='textbox']").each(function (i, e) {
        _this.crearYBindearTextBox($(e));
    });

    this.html_form.find("[rh-control-type='datepicker']").each(function (i, e) {
        _this.crearYBindearDatePicker($(e));
    });

    this.html_form.find("[rh-control-type='checkbox']").each(function (i, e) {
        _this.crearYBindearCheckbox($(e));
    });
};

FormularioBindeado.prototype.crearYBindearTextBox = function (input) {
    var _this = this;
    this[input.attr('Id')] = input;

    var path_propiedad_modelo = input.attr('rh-model-property');

    var tipo_del_dato = "texto";
    var validaciones = input.attr('data-validar');
    if (validaciones) {
        var validaciones_spliteadas = validaciones.split(' ');
        validaciones_spliteadas.forEach(function (v) {
            if (v == "esNumeroNatural" || v == "esNumeroNaturalSinCero") tipo_del_dato = "numero_entero";
        });
    }

    var handler = function (prop, oldval, newval) {
        input.val(newval);
    };
    input.change(function () {
        O_O.desWatchear(_this.modelo, path_propiedad_modelo, handler);
        if (tipo_del_dato == "texto") {
            O_O.desWatchear(_this.modelo, path_propiedad_modelo, handler);
            O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, input.val());
        }
        if (tipo_del_dato == "numero_entero") {
            if (input.val()) {
                O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, parseInt(input.val()));
            } else {
                O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, null);
            }
        }
        O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    });
    O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    input.val(O_O.getValorDePath(_this.modelo, path_propiedad_modelo));
};

FormularioBindeado.prototype.crearYBindearDatePicker = function (input) {
    var _this = this;
    this[input.attr('Id')] = input;

    var path_propiedad_modelo = input.attr('rh-model-property');

    input.mask("99/99/9999");
    input.datepicker();
    input.datepicker('option', 'dateFormat', 'dd/mm/yy');

    var handler = function (prop, oldval, newval) {
        input.datepicker('setDate', ConversorDeFechas.deIsoAFechaEnCriollo(newval));
    };
    input.change(function () {
        O_O.desWatchear(_this.modelo, path_propiedad_modelo, handler);
        if (input.datepicker('getDate')) O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, input.datepicker('getDate').toISOString());
        else O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, "0001-01-01T00:00:00");
        O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    });
    O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    input.datepicker('setDate', ConversorDeFechas.deIsoAFechaEnCriollo(O_O.getValorDePath(_this.modelo, path_propiedad_modelo)));
};

FormularioBindeado.prototype.crearYBindearCombo = function (select) {
    var _this = this;
    var opt_constructor = {
        select: select,
        dataProvider: select.attr('rh-data-provider'),
        permiteAgregar: select.attr('rh-permite-agregar') || false
    };
    var prop_label = select.attr("rh-propiedad-label");
    if (prop_label) opt_constructor.propiedadLabel = prop_label;

    var filter_key = select.attr('rh-filter-key');
    var filter_path = select.attr('rh-filter-value');
    if (filter_key && filter_path) {
        opt_constructor.filtro = {};
        opt_constructor.filtro[filter_key] = O_O.getValorDePath(_this.modelo, filter_path);
    }

    var combo = new ComboConBusquedaYAgregado(opt_constructor);
    this[select.attr('Id')] = combo;

    var path_propiedad_modelo = select.attr('rh-model-property');
    //var path_propiedad_modelo_texto = select.attr('rh-model-property-text');
    var handler = function (prop, oldval, newval) {
        combo.idSeleccionado(newval);
    };

    combo.change(function () {
        O_O.desWatchear(_this.modelo, path_propiedad_modelo, handler);
        O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, combo.idSeleccionado());
//        if (path_propiedad_modelo_texto && combo.itemSeleccionado()) {
//            if (prop_label) O_O.setValorEnPath(_this.modelo, path_propiedad_modelo_texto, combo.itemSeleccionado()[prop_label]);
//            else O_O.setValorEnPath(_this.modelo, path_propiedad_modelo_texto, combo.itemSeleccionado()["Descripcion"]);
//        }
        O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    });
    O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    combo.idSeleccionado(O_O.getValorDePath(_this.modelo, path_propiedad_modelo));

    if (filter_key && filter_path) {
        O_O.watchear(_this.modelo, filter_path, function (prop, oldval, newval) {
            var filtro = {};
            filtro[filter_key] = newval
            combo.filtrarPor(filtro);
        });
    }
};

FormularioBindeado.prototype.crearYBindearCheckbox = function (input) {
    var _this = this;
    this[input.attr('Id')] = input;

    var path_propiedad_modelo = input.attr('rh-model-property');



    var handler = function (prop, oldval, newval) {
        //if (una_experiencia.Vigente == true) {
        input.attr("checked", newval);

        //}
        input.val(newval);
    };
    input.change(function () {
        O_O.desWatchear(_this.modelo, path_propiedad_modelo, handler);
        O_O.setValorEnPath(_this.modelo, path_propiedad_modelo, input.prop( "checked" ));
   
        O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    });
    O_O.watchear(_this.modelo, path_propiedad_modelo, handler);
    input.attr("checked", O_O.getValorDePath(_this.modelo, path_propiedad_modelo));
};

FormularioBindeado.prototype.cerrarCombosAbiertos = function () {
    $(".select2-drop-mask").hide()
    $(".select2-drop").hide()
};
