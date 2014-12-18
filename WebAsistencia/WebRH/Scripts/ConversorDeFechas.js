﻿var ConversorDeFechas = {
    deIsoAFechaEnCriollo: function (fecha_en_iso) {
        var fecha = new Date(fecha_en_iso);
        return fecha.getUTCDate().toString() + "/" + (fecha.getUTCMonth() + 1).toString() + "/" + fecha.getUTCFullYear();
    },
    PrimeraFechaCriolloMayor: function (fechaMayor, fechaMenor) {
        var lista_fecha1 = fechaMayor.split('/');
        var lista_fecha2 = fechaMenor.split('/');
        var dia1 = parseInt(lista_fecha1[0], 10);
        var mes1 = parseInt(lista_fecha1[1], 10);
        var anio1 = parseInt(lista_fecha1[2], 10);
        var dia2 = parseInt(lista_fecha2[0], 10);
        var mes2 = parseInt(lista_fecha2[1], 10);
        var anio2 = parseInt(lista_fecha2[2], 10);

        if (anio1 > anio2) {
            return true;
        }
        else {
            if (anio1 == anio2) {
                if (mes1 > mes2) {
                    return true;
                }
                else {
                    if (mes1 == mes2) {
                        if (dia1 > dia2) {
                            return true;
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        return false;
                    }
                }
            }
            else {
                return false;
            }
        }

    }
}