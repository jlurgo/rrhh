﻿var RepositorioDeTiposDeCapacidadPersonal = {
    tipos_de_capacidad: [
        { id: 1, descripcion: "Social" },
        { id: 2, descripcion: "Organizativa" },
        { id: 3, descripcion: "Técnica" },
        { id: 4, descripcion: "Otra" }
    ],
    buscar: function (criterio) {
        if (criterio === undefined) return this.tipos_de_capacidad;
        var resultado = this.tipos_de_capacidad.find(criterio);
        if(resultado.length == 1) return resultado[0];
        if(resultado.length == 0) return null;
        return resultado;
    }
};