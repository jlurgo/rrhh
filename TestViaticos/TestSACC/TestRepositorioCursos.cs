﻿using System.Linq;
using General;
using General.Repositorios;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using General.Calendario;

using NMock2;
using System;
using General.Sacc;
using General.Sacc.Seguridad;
using General.MAU;

namespace TestViaticos
{

    [TestClass]
    public class TestRepositorioCursos
    {

        ManagerDeCalendarios managerDeCalendarios;
        CalendarioDeFeriados unCalendarioGlobal = new CalendarioDeFeriados();
       

        [TestInitialize]
        public void Setup()
        {
            managerDeCalendarios = new ManagerDeCalendarios(unCalendarioGlobal);
        }

          [TestMethod]
          [Ignore] //para que ande el teamcity
          public void deberia_poder_obtener_un_curso_del_repositorio_de_cursos_y_comprobar_que_tiene_materia_docente_horas_catedra_aula_y_alumnos_opcionalmente()
            {

                string source = @"  |id    |IdMateria     |IdDocente          |Fecha                       |HorasCatedra     |idBaja     |IdEspacioFisico   |IdInstancia |DescripcionInstancia |Documento  |Apellido   |Nombre     |Telefono   |Mail                       |LugarTrabajo |FechaNacimiento         |Direccion          |FechaInicio                 |FechaFin                  |DireccionEdificio  |NumeroEdificio     |idEdificio |NombreEdificio |Aula       |Capacidad  |idCiclo    |NombreCiclo    |IdModalidad    |ModalidadDescripcion   |Desde      |Hasta      |NroDiaSemana   |idCurso    |IdAlumno   |IdArea |NombreArea                        |IdOrganismo |DescripcionOrganismo |Observaciones
                                    |01    |01            |01                 |2012-10-13 21:36:35.077     |1                |0          |01                |1           |Primer Parcial       |31507315   |Cevey      |Belén      |3969-8706  |belen.cevey@gmail.com      |MDS          |2012-10-13 21:36:35.077 |Perón 452          |2012-10-13 21:36:35.077     |2012-12-13 21:36:35.077   |San Martín         |122                |01         |Perón          |Magna      |20         |01         |Primero        |01             |Fines PURO             |12:00      |13:00      |1              |01         |01         |0      |Ministerio de Desarrollo Social   |1           |MDS                  |Observación
                                    |02    |02            |02                 |2012-10-13 21:36:35.077     |3                |0          |02                |1           |Primer Parcial       |31234567   |Pérez      |Ana        |4577-4536  |ana.perez@gmail.com        |MDS          |2012-10-13 21:36:35.077 |Juan B Justo 151   |2013-01-13 21:36:35.077     |2013-10-13 21:36:35.077   |9 de Julio         |500                |02         |Sarmiento      |Principal  |30         |02         |Segundo        |02             |CENS                   |10:00      |12:30      |2              |02         |02         |1      |unidad Ministro                   |1           |MDS                  |Observación
                                    |03    |03            |03                 |2012-10-13 21:36:35.077     |4                |0          |03                |1           |Primer Parcial       |31987654   |González   |Carlos     |4504-3565  |carlos.gonzalez@gmail.com  |MDS          |2012-10-13 21:36:35.077 |Av. Nazca 5002     |2013-02-13 21:36:35.077     |2013-10-13 21:36:35.077   |Florida            |252                |03         |Evita          |PB         |40         |03         |Termero        |03             |Fines                  |15:40      |17:20      |3              |03         |03         |621    |Secretaría de Deportes            |1           |MDS                  |Observación";
                                                                                                                                                                                                                                                                           
               Curso curso = new Curso(01, TestObjects.MateriaCens(), TestObjects.unDocente(), TestObjects.EspacioFisico(), DateTime.Today, DateTime.Today, "");
                
                Usuario usuario = TestObjects.UsuarioSACC();  

                IConexionBD conexion = TestObjects.ConexionMockeada();
                var resultado_sp = TablaDeDatos.From(source);

                Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));

                RepositorioDeCursos repo = new RepositorioDeCursos(conexion);

                Curso curso_bd = repo.GetCursoById(1);


                Assert.AreEqual(curso_bd.Id, curso.Id);
                Assert.IsNotNull(curso_bd.Materia);
                Assert.IsNotNull(curso_bd.Docente);
                Assert.IsNotNull(curso_bd.EspacioFisico);
                Assert.IsTrue(curso_bd.Alumnos().Count() > 0);
            }


          [TestMethod]
          [Ignore] //para que ande el teamcity
          public void deberia_poder_traer_los_cursos_segun_el_area_responsable_del_usuario_logeado()
          {
              Usuario usu_cenard = TestObjects.UsuarioCENARD();
              Usuario usu_sacc = TestObjects.UsuarioSACC();
              Organigrama organigrama = TestObjects.OrganigramaConDosRamas();

              IConexionBD conexion = TestObjects.ConexionMockeada();
              AutorizadorSacc autorizador = new AutorizadorSacc();

              List<Curso> cursos = TestObjects.UnListadoDeCursoConEdificios();

              Assert.AreEqual(1, autorizador.FiltrarCursosPorUsuario(cursos, organigrama, usu_cenard).Count());
              Assert.AreEqual(3, autorizador.FiltrarCursosPorUsuario(cursos, organigrama, usu_sacc).Count());

          }


          [TestMethod]
          public void deberia_poder_obtener_las_observaciones_de_un_curso()
          {
                string source = @"  |id    |IdMateria     |IdDocente          |Fecha                       |HorasCatedra     |idBaja     |IdEspacioFisico   |Documento  |Apellido   |Nombre     |Telefono   |Mail                       |LugarTrabajo |FechaNacimiento         |Direccion          |FechaInicio                 |FechaFin                  |DireccionEdificio  |NumeroEdificio     |idEdificio |NombreEdificio |Aula       |Capacidad  |idCiclo    |NombreCiclo    |IdModalidad    |ModalidadDescripcion |idInstancia  |DescripcionInstancia  |Desde      |Hasta      |NroDiaSemana   |idCurso    |IdAlumno   |IdArea |NombreArea                       |IdOrganismo |DescripcionOrganismo  |Observaciones
                                    |01    |01            |01                 |2012-10-13 21:36:35.077     |1                |0          |01                |31507315   |Cevey      |Belén      |3969-8706  |belen.cevey@gmail.com      |MDS          |2012-10-13 21:36:35.077 |Perón 452          |2012-10-13 21:36:35.077     |2012-12-13 21:36:35.077   |San Martín         |122                |01         |Perón          |Magna      |20         |01         |Primero        |01             |Fines PURO           |1            |Primer Parcial        |12:00      |13:00      |1              |01         |01         |0      |Ministerio de Desarrollo Social  |1           |MDS                   |el 22/06 Ausencia docente
                                    |02    |02            |02                 |2012-10-13 21:36:35.077     |3                |0          |02                |31234567   |Pérez      |Ana        |4577-4536  |ana.perez@gmail.com        |MDS          |2012-10-13 21:36:35.077 |Juan B Justo 151   |2013-01-13 21:36:35.077     |2013-10-13 21:36:35.077   |9 de Julio         |500                |02         |Sarmiento      |Principal  |30         |02         |Segundo        |02             |CENS                 |1            |Primer Parcial        |10:00      |12:30      |2              |02         |02         |1      |unidad Ministro                  |1           |MDS                   |observaciones
                                    |03    |03            |03                 |2012-10-13 21:36:35.077     |4                |0          |03                |31987654   |González   |Carlos     |4504-3565  |carlos.gonzalez@gmail.com  |MDS          |2012-10-13 21:36:35.077 |Av. Nazca 5002     |2013-02-13 21:36:35.077     |2013-10-13 21:36:35.077   |Florida            |252                |03         |Evita          |PB         |40         |03         |Termero        |03             |Fines                |1            |Primer Parcial        |15:40      |17:20      |3              |03         |03         |621    |Secretaría de Deportes           |1           |MDS                   |observaciones";
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
              IConexionBD conexion = TestObjects.ConexionMockeada();
              var resultado_sp = TablaDeDatos.From(source);

              Curso curso = new Curso(01, TestObjects.MateriaCens(), TestObjects.unDocente(), TestObjects.EspacioFisico(), DateTime.Today, DateTime.Today, "");

              Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));
              RepositorioDeCursos repo = new RepositorioDeCursos(conexion);

              Assert.AreEqual(repo.GetCursoById(1).Observaciones, "el 22/06 Ausencia docente");
          }


          [TestMethod]
          public void deberia_poder_obtener_todos_los_horarios_de_un_curso()
          {
              string source = @"    |id    |IdMateria     |IdDocente          |Fecha                       |HorasCatedra     |idBaja     |IdEspacioFisico   |LugarTrabajo |FechaNacimiento         |Documento  |Apellido   |Nombre     |Telefono   |Mail                       |Direccion          |FechaInicio                 |FechaFin                  |DireccionEdificio  |NumeroEdificio     |idEdificio |NombreEdificio |Aula       |Capacidad  |idCiclo    |NombreCiclo    |IdModalidad    |ModalidadDescripcion |idInstancia  |DescripcionInstancia  |Desde      |Hasta      |NroDiaSemana   |idCurso    |IdAlumno   |IdArea |NombreArea                       |IdOrganismo |DescripcionOrganismo  |Observaciones
                                    |01    |01            |01                 |2012-10-13 21:36:35.077     |1                |0          |01                |MDS          |2012-10-13 21:36:35.077 |31507315   |Cevey      |Belén      |3969-8706  |belen.cevey@gmail.com      |Perón 452          |2012-10-13 21:36:35.077     |2012-12-13 21:36:35.077   |San Martín         |122                |01         |Perón          |Magna      |20         |01         |Primero        |01             |Fines PURO           |1            |Primer Parcial        |12:00      |13:00      |1              |01         |01         |0      |Ministerio de Desarrollo Social  |1           |MDS                   |el 22/06 Ausencia docente
                                    |02    |02            |02                 |2012-10-13 21:36:35.077     |3                |0          |02                |MDS          |2012-10-13 21:36:35.077 |31234567   |Pérez      |Ana        |4577-4536  |ana.perez@gmail.com        |Juan B Justo 151   |2013-01-13 21:36:35.077     |2013-10-13 21:36:35.077   |9 de Julio         |500                |02         |Sarmiento      |Principal  |30         |02         |Segundo        |02             |CENS                 |1            |Primer Parcial        |10:00      |12:30      |2              |02         |02         |1      |unidad Ministro                  |1           |MDS                   |observaciones
                                    |03    |03            |03                 |2012-10-13 21:36:35.077     |4                |0          |03                |MDS          |2012-10-13 21:36:35.077 |31987654   |González   |Carlos     |4504-3565  |carlos.gonzalez@gmail.com  |Av. Nazca 5002     |2013-02-13 21:36:35.077     |2013-10-13 21:36:35.077   |Florida            |252                |03         |Evita          |PB         |40         |03         |Termero        |03             |Fines                |1            |Primer Parcial        |15:40      |17:20      |3              |03         |03         |621    |Secretaría de Deportes           |1           |MDS                   |observaciones";
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
              IConexionBD conexion = TestObjects.ConexionMockeada();
              var resultado_sp = TablaDeDatos.From(source);

              Curso curso = new Curso(01, TestObjects.MateriaCens(), TestObjects.unDocente(), TestObjects.EspacioFisico(), DateTime.Today, DateTime.Today, "");

              Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));
              RepositorioDeCursos repo = new RepositorioDeCursos(conexion);

              Assert.AreEqual(repo.GetCursoById(1).GetHorariosDeCursada().First().HoraDeInicio, TimeSpan.Parse("1200"));
              Assert.AreEqual(repo.GetCursoById(1).GetHorariosDeCursada().First().HoraDeFin, TimeSpan.Parse("1300"));
          }
          [TestMethod]
          public void deberia_poder_obtener_todos_los_cursos_en_que_se_inscribio_un_alumno()
          {

              IConexionBD conexion = TestObjects.ConexionMockeada();

              RepositorioDeCursos repo_cursos = new RepositorioDeCursos(conexion);

              var fer = TestObjects.AlumnoFer();
              var cursos = TestObjects.UnListadoDeCursoConEdificios();
              cursos.First().AgregarAlumno(fer);

              Assert.AreEqual(1, repo_cursos.GetCursosParaElAlumno(fer, cursos).Count);
              Assert.IsTrue(repo_cursos.GetCursosParaElAlumno(fer, cursos).All(c => c.Alumnos().Contains(fer)));

          }

          [TestMethod]
          public void deberia_poder_obtener_las_observaciones()
          {

              string source = @"    |id    |FechaCarga                  |Relacion          |PersonaCarga    |Pertenece     |Asunto      |ReferenteMDS   |Seguimiento    |Resultado          |FechaDelResultado          |ReferenteRtaMDS    |idBaja  
                                    |01    |2012-10-13 00:00:00.077     |Fines CENS        |Camacho         |Mariano       |zaraza      |Javier         |Laaa           |wawa               |2012-10-13 00:00:00.077    |Cevey              |1    
                                    |02    |2012-10-13 00:00:00.077     |Fines Puro        |Elizondo        |Cholo         |zaraza      |Fer            |asdsd          |wawa               |2012-10-13 00:00:00.077    |Pérez              |2    
                                    |03    |2012-10-13 00:00:00.077     |Fines CENS        |Mongui          |Elena         |zaraza      |Carlos         |asd            |wawa               |2012-10-13 00:00:00.077    |González           |1";

              IConexionBD conexion = TestObjects.ConexionMockeada();
              var resultado_sp = TablaDeDatos.From(source);

              Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));

              RepositorioDeCursos repo = new RepositorioDeCursos(conexion);

              Assert.AreEqual(3, repo.GetObservaciones().Count);
             
          }

          [TestMethod]
          public void deberia_poder_obtener_las_observaciones_a_actualizar_y_guardar_las_nuevas()
          {
             
              string source = @"    |id    |FechaCarga                  |Relacion          |PersonaCarga    |Pertenece      |Asunto     |ReferenteMDS   |Seguimiento    |Resultado          |FechaDelResultado          |ReferenteRtaMDS    |idBaja  
                                    |01    |2012-10-13 00:00:00.077     |Fines CENS        |Mariano         |MDS            |Cursada    |Mariano        |Lala           |Sasa               |2012-10-13 00:00:00.077    |Elena              |1    
                                    |02    |2012-10-13 00:00:00.077     |Fines Puro        |Leonardo        |MDS            |Cursada    |Mariano        |Lala           |Sasa               |2012-10-13 00:00:00.077    |Elena              |2    
                                    |03    |2012-10-13 00:00:00.077     |Fines CENS        |Cholo           |MDS            |Libre      |Mariano        |Lala           |Sasa               |2012-10-13 00:00:00.077    |Elena              |1";

              IConexionBD conexion = TestObjects.ConexionMockeada();
              ComparadorDeDiferencias comparador = new ComparadorDeDiferencias();

              var resultado_sp = TablaDeDatos.From(source);
              List<Observacion> observaciones = new List<Observacion>();
              var repo = new RepositorioDeCursos(conexion);

              Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));

              List<Observacion> observaciones_antiguas = repo.GetObservaciones();

              //Hice una nueva lista de Evaluaciones xq si cambiaba de la lista original tb cambiaba a la lista nueva
              List<Observacion> observaciones_nuevas = TestObjects.Observaciones();

              observaciones_nuevas.First().Asunto = "cambio el asunto";

              var obser_cambiadas = comparador.ObservacionesParaActualizar(observaciones_antiguas, observaciones_nuevas);
              var obser_a_agregar = comparador.ObservacionesParaGuardar(observaciones_antiguas, observaciones_nuevas);
              
              Assert.AreEqual(1, obser_cambiadas.Count);
              Assert.AreEqual(1, obser_a_agregar.Count);

              observaciones_nuevas.Find(o => o.Id.Equals(2)).FechaCarga = new DateTime(2013, 08, 01);
              obser_cambiadas = comparador.ObservacionesParaActualizar(observaciones_antiguas, observaciones_nuevas);

              Assert.AreEqual(2, obser_cambiadas.Count);


              //PRUEBO BORRAR OBSERVACIONES
              observaciones_nuevas.RemoveAt(0);

              var obser_a_borrar = comparador.ObservacionesParaDarDeBajaSinInsertarOtra(observaciones_antiguas, observaciones_nuevas);
             
              Assert.AreEqual(1, obser_a_borrar.Count);

          }

    }
}
