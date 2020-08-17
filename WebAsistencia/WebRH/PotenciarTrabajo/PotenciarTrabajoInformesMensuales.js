$(document).ready(function () {
    Backend.start(function () {

      var seccion = new SeccionEstadoInformesParticipacion();

      $("#pt_detalle_mensual").hide();
      $("#pt_boton_informes_mensuales").click(() => {

        $(".pt_selected_section_button").removeClass("pt_selected_section_button");
        $("#pt_boton_informes_mensuales").addClass("pt_selected_section_button");

        seccion.render();
      });

    });
});

class SeccionEstadoInformesParticipacion {
  constructor() {
    this.tablaInformesParticipacion = new TablaInformesParticipacion();
  }
  render() {
    this.tablaInformesParticipacion.render(); // DEBUG: pregunta a Char: debo pasar parámetro usuario? quien es ese parámetro?
  }
}


class TablaInformesParticipacion extends TablaPT{
  constructor () {
    super();
    var self = this;
    self.tablaInformesParticipacionDetalleMensual =  new TablaInformesParticipacionDetalleMensual();

    Backend.PT_Get_Estado_Informes_Participacion_Por_Periodo()
      .onSuccess((informes_participacion) => {
        _.forEach(informes_participacion, (i) => {
          var fila = $("<tr>");


          fila.attr("Anio", i.Entidad.Anio);
          fila.attr("Mes", i.Entidad.Mes);


          this.agregarCeldaTextoAFila(fila, i.Entidad.Anio);

          const celda = $("<td>")
          celda.text(i.Entidad.Mes);

          const icono_lupa = $("<img>");
          icono_lupa.attr("src", "IconoLupa.png");
          icono_lupa.addClass("pt_icono_celda");
          icono_lupa.click(() => {

            var fila = icono_lupa.parent().parent();

            self.tablaInformesParticipacionDetalleMensual.render(fila.attr("Anio"), fila.attr("Mes"));
          });
          celda.append(icono_lupa);
          fila.append(celda);


          var ent_sin_carga = this.agregarCeldaTextoAFila(fila, i.Ent_SinCarga);
          if(i.Ent_SinCarga > 0){
            ent_sin_carga.addClass("ent_sin_carga");
          }

          var ent_en_proceso = this.agregarCeldaTextoAFila(fila, i.Ent_EnProceso);
          if(i.Ent_EnProceso > 0){
            ent_en_proceso.addClass("ent_en_proceso");
          }



          this.agregarCeldaTextoAFila(fila, i.Ent_ConInforme);
          this.agregarCeldaTextoAFila(fila, i.Partic_SinCarga);
          this.agregarCeldaTextoAFila(fila, i.Partic_EnProceso);
          this.agregarCeldaTextoAFila(fila, i.Partic_ConInforme);

          fila.addClass("pt_fila_informes_mensuales");
          $("#pt_tabla_informes_mensuales").append(fila);
        });
      })
      .onError(function (e) {
        console.error("error al obtener estado de informes de participacion: " + e);
      });
  }
  render () {
      $(".pt_seccion").hide();
      $("#pt_seccion_informes_mensuales").show();
      $("#pt_detalle_mensual").hide();
  }
}



class TablaInformesParticipacionDetalleMensual extends TablaPT{
  constructor () {
    super();
    var self = this;

    $("#pt_generar_informe_participacion").click(() => {


      if(self.lista_generar_informe.length == 0){
        alert("Debe elegir al menos un elemento")
        return
      }


      Backend.PT_Upd_Generar_Informe_Participacion(self.lista_generar_informe)
      .onSuccess(function (e) {
        self.render();
      })
      .onError(function (e) {
        console.error("error al generar informe de participacion: " + e);
      });

    });

  }
  render (anio, mes) {
    var self = this;

    this.lista_generar_informe = [];

    if(anio != "undefined" ){
      self.anio = anio;
      self.mes = mes;
    }

    $("#pt_detalle_mensual").show();

    Backend.PT_Get_Estado_Informes_Participacion_Por_PeriodoyEntidad(self.anio, self.mes)
      .onSuccess((informes_participacion) => {


        $("#pt_tabla_informes_participacion_detalle_mensual").find(".pt_fila_informes_participacion_detalle_mensual").remove();

        _.forEach(informes_participacion, (i) => {
          var fila = $("<tr>");



          fila.attr("Id_Entidad", i.Entidad.Id_Entidad);
          fila.attr("Id_Informe", i.Entidad.Id_Informe);





          // Grupo de Trabajo
          var celda_nombre_entidad = this.agregarCeldaTextoAFila(fila, i.Entidad.Nombre_Entidad);



          // Personas
          var celda_cant_personas = this.agregarCeldaTextoAFila(fila, i.Cant_Personas);
          // var icono_lupa = $("<img>");
          // icono_lupa.attr("src", "IconoLupa.png");
          // icono_lupa.addClass("pt_icono_celda");
          // icono_lupa.click(() => {
          //   // TODO:
          //   alert("En construcción TBD")
          // });
          // celda_cant_personas.append(icono_lupa);




          // Estado
          var celda_estado = this.agregarCeldaTextoAFila(fila, i.Entidad.Estado);






          // Incluir en Informe
          var celda_incluir_en_informe = this.agregarCeldaTextoAFila(fila, "");


          if(i.Entidad.Estado == 'En Proceso') {

            var checkbox = $("<input type='checkbox'/>");
            checkbox.click(() => {
              var fila = checkbox.parent().parent();

              if(checkbox.prop('checked')== true){
                self.lista_generar_informe.push(fila.attr("Id_Entidad"));
              }else{

                for (var i = 0; i < self.lista_generar_informe.length; i++) {
                  if(fila.attr("Id_Entidad") == self.lista_generar_informe[i]){
                    self.lista_generar_informe.splice(i,1);
                  }
                }
              }
            });

          }else{
            celda_incluir_en_informe.text("---")
          }



          celda_incluir_en_informe.append(checkbox);





          // N° de Informe
          var celda_id_informe = this.agregarCeldaTextoAFila(fila, i.Entidad.Id_Informe);

          if(i.Entidad.Estado == 'Con Informe') {
            var icono = $("<img>");
            icono.attr("src", "IconoDownload.png");
            icono.addClass("pt_icono_celda");
            icono.click(() => {
              var fila = icono.parent().parent();

              Backend.PT_Get_Informe_Participacion(fila.attr("Id_Informe"))
              .onSuccess((pdf_string) => {



                var a = window.document.createElement('a');

                a.href = 'data:application/pdf;base64,' + pdf_string;

                a.download = "Informe_Participacion_Nro_" + fila.attr("Id_Informe") + ".pdf";


                // Append anchor to body.
                document.body.appendChild(a)
                a.click();


                // Remove anchor from body
                document.body.removeChild(a)


              })
              .onError(function (e) {
                console.error("error al obtener niveles de participacion: " + e);
              });


            });
            celda_id_informe.append(icono);
          }








          if(i.Entidad.Estado == 'Sin Carga'){
            celda_cant_personas.addClass("ent_sin_carga");
            celda_estado.addClass("ent_sin_carga");

          }else if(i.Entidad.Estado == 'En Proceso') {
            celda_cant_personas.addClass("ent_en_proceso");
            celda_estado.addClass("ent_en_proceso");
            celda_incluir_en_informe.addClass("ent_en_proceso");
          }






          fila.addClass("pt_fila_informes_participacion_detalle_mensual");
          $("#pt_tabla_informes_participacion_detalle_mensual").append(fila);
        });
      })
      .onError(function (e) {
        console.error("error al obtener estado de informes de participacion detalle: " + e);
      });

  }






}
