﻿
var GraficoHerramientas = {

    ConvertirFecha: function (fecha) {
        var dia = fecha.substring(8, 10);
        var mes = fecha.substring(5, 7);
        var anio = fecha.substring(0, 4);
        return dia + "/" + mes + "/" + anio;
    },

    ConvertirAMonedaLocal: function (numero) {
        var _this = this;
        if (numero == null) {
            return "";
        }
        var _this = this;
        if (numero == 0) return "";
        return '$' + _this.ConvertirANumeroConPuntos(numero.toFixed(2).toString().replace(".", ","));
    },

    ConvertirEnBlanco: function (numero) {
        if (numero == 0) return "";
        return numero;
    },

    ConvertirANumeroConPuntos: function (n) {

        if (n == null) {
            return "";
        }

        n = n.toString()
        while (true) {
            var n2 = n.replace(/(\d)(\d{3})($|,|\.)/g, '$1.$2$3')
            if (n == n2) break
            n = n2
        }
        return n;
    },


    VerificarSoporteDeStorage: function () {
        if (typeof (Storage) !== "undefined") {
            return true;
        } else {
            return false;
            alertify.error("El Navegador que está utilizando no soporta la Aplicación de Gráficos. Utilice un navegador más moderno")
            console.log("No soporta localStorage");
        }
    },
    InicializarFecha: function (fecha) {
        fecha.datepicker();
        fecha.datepicker('option', 'dateFormat', 'dd/mm/yy');
        fecha.datepicker("setDate", new Date());
    },

    BlanquearParametrosDeBusqueda: function () {
        localStorage.removeItem("alias");
        localStorage.removeItem("idArea");

        //Para que no rompa la librería por si la página se cargó anteriormente
        if (window.Highcharts) {
            window.Highcharts = null;
        }
    },

    ActivarPrimerCheck: function (check, nombre_check) {
        check.prop('checked', true);
        filtro = nombre_check;
    },

    SettearEventosDeChecks: function (_this, conjunto_de_filtros, div_tabla_detalle, div_titulo_grafico, titulo) {
        conjunto_de_filtros.change(function () {
            conjunto_de_filtros.each(function () {
                this.checked = false;
                checks_activos = [];
                div_tabla_detalle.hide();
            });

            this.checked = true;
            filtro = this.nextSibling.innerHTML;
            var nombre = this.name;
            //var lastChar = nombre.substr(nombre.length - 1);
            var lastChar = $(this).data("grafico");
            checks_activos.push(lastChar);
            div_titulo_grafico.html(titulo + this.nextElementSibling.innerHTML);

            _this.BuscarDatos();

        });
        $('#btn_salir_menu').click(function () {
            $('#showTop').click();

        });
    },

    VerificarDatosObligatoriosParaBackend: function (fecha, check_seleccionado, id_area) {
        var buscar = true;
        if (check_seleccionado == null || check_seleccionado == undefined || check_seleccionado == "") {
            buscar = false;
            alertify.error("Debe seleccionar un filtro desde los checkbox");
        }
        if (fecha == null || fecha == undefined || fecha == "") {
            buscar = false;
            alertify.error("Debe completar la fecha de corte para la búsqueda de datos");
        }
        if (id_area == null || id_area == undefined || id_area == "") {
            buscar = false;
            alertify.error("Debe seleccinar un área desde el Organigrama");
        }
        return buscar;
    },

    OcultarTodosLosReportesExcepto: function (opcion) {
        switch (opcion) {
            case "Dotacion":

                $('#div_resultados_sueldos').hide();
                $('#div_filtros_sueldos').hide();
                $('#btn_mostrar_resumen').hide();
                $('#div_tabla_sueldo').hide();
                $('#search_sueldo').hide();
                $('#exportar_datos_sueldo').hide();
                $('#tabla_sueldo').hide();
                $('#div_tabla_sueldo_detalle').hide();
                $('#search_detalle_sueldo').hide();
                $('#tabla_sueldo_detalle').hide();


                $('#div_grafico_de_dotacion').show();
                $('#div_filtros').show();

                $('#div_graficos_y_tablas').hide();
                $('#div_filtros_rango_etareo').hide();
                $('#div_resultados_sueldos').hide();
                $('#div_filtros_sueldos').hide();

                $('#div_grafico_de_rangoEtario').hide();
                $('#div_filtros_rangoEtario').hide();

                break;

            case "Sueldo":
                $('#div_resultados_sueldos').hide();
                $('#btn_mostrar_resumen').hide();
                $('#div_tabla_sueldo').hide();
                $('#search_sueldo').hide();
                $('#exportar_datos_sueldo').hide();
                $('#tabla_sueldo').hide();
                $('#div_tabla_sueldo_detalle').hide();
                $('#search_detalle_sueldo').hide();
                $('#tabla_sueldo_detalle').hide();
                $('#container_grafico_torta_totales').hide();
                $("#search").hide();
                $('#div_graficos_y_tablas').hide();
                $('#search_detalle').hide();
                $('#div_tabla_detalle').hide();
                $('#div_grafico_de_dotacion').hide();
                $('#div_filtros').hide();

               
                $('#div_filtros').hide();
                $('#div_filtros_rango_etareo').hide();
                $('#div_resultados_sueldos').show();
                $('#div_filtros_sueldos').show();

                $('#div_grafico_de_rangoEtario').hide();
                $('#div_filtros_rangoEtario').hide();

                break;

            case "RangoEtario":
                $('#titulo_grafico').html(this.innerHTML);
                $('#div_grafico_de_dotacion').hide();
                $('#div_filtros').hide();
                $('#div_resultados_sueldos').hide();
                $('#div_filtros_sueldos').hide();
                $('#btn_excel_rangoEtario').hide();
       
                $('#div_grafico_de_rangoEtario').show();
                $('#div_filtros_rangoEtario').show();

                break;

        }

    }
}
