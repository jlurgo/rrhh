
describe("Test Grilla de Evaluaciones", function () {

    var una_calificacion = "8";
    var una_fecha = "20/03/2013";
    var una_evaluacion = new Evaluacion(1,una_calificacion, una_fecha);

    it("Mi objeto evaluaciones deberia decirme la calificaci�n otorgada", function () {

        spyOn(una_evaluacion, 'calificacionOtorgada').andCallThrough();
        spyOn(una_evaluacion, 'fechaDeCalificacion').andCallThrough();

        expect(una_evaluacion.calificacionOtorgada()).toBe(una_calificacion);
    });

    it("Mi objeto evaluaciones deberia decirme la calificaci�n otorgada y la fecha en que se hizo", function () {

        spyOn(una_evaluacion, 'calificacionOtorgada').andCallThrough();
        spyOn(una_evaluacion, 'fechaDeCalificacion').andCallThrough();

        expect(una_evaluacion.calificacionOtorgada()).toBe(una_calificacion);
        expect(una_evaluacion.fechaDeCalificacion()).toBe(una_fecha);
    });

    it("Deber�a poder cambiar la fecha de una evaluaci�n", function () {
        var otra_fecha_de_evaluacion = "25/03/2013";

        spyOn(una_evaluacion, 'fechaDeCalificacion').andCallThrough();

        expect(una_evaluacion.fechaDeCalificacion()).toBe(una_fecha);
        una_evaluacion.cambiarFechaDeCalificacion(otra_fecha_de_evaluacion);
        expect(una_evaluacion.fechaDeCalificacion()).toBe(otra_fecha_de_evaluacion);

    });

    it("Deber�a poder cambiar la calificaci�n otorgada de una evaluaci�n", function () {
        var otra_calificacion = 10;

        spyOn(una_evaluacion, 'calificacionOtorgada').andCallThrough();

        expect(una_evaluacion.calificacionOtorgada()).toBe(una_calificacion);
        una_evaluacion.cambiarCalificacionOtorgada(otra_calificacion);
        expect(una_evaluacion.calificacionOtorgada()).toBe(otra_calificacion);
    });

});
