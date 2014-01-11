﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using General;
using General.Repositorios;

namespace TestViaticos
{
    [TestClass]
    //[Ignore]
    public class TestLicencias
    {
        private Persona unaPersona;
        private DateTime unaFecha;
        private ConceptoDeLicencia unConcepto;
        private Usuario unUsuario;
        private Auditoria unaAuditoria;
        private IRepositorioLicencia repositorioLicencias;
        private RepositorioPersonas repositorioPersonas;
        private Licencia unaLicencia;
        

        #region TestConfiguration


        [TestInitialize]
        public void Setup()
        {


            //repositorioLicencias = TestObjects.RepoLicenciaMockeado();
            //repositorioPersonas = new RepositorioPersonas();
            //unaFecha = new DateTime(2001, 04, 04);
            //unaPersona = new Persona { Documento = 29753914, Area = new Area { Id = 1 } };


            //unConcepto = new ConceptoDeLicencia { Id = 1 };
            //unUsuario = new Usuario { Id = 1 };
            //unaAuditoria = new Auditoria { UsuarioDeCarga = unUsuario };


            //unaLicencia = new Licencia
            //                  {
            //                      Desde = unaFecha,
            //                      Hasta = unaFecha,
            //                      Persona = unaPersona,
            //                      Concepto = unConcepto,
            //                      Auditoria = unaAuditoria
            //                  };

            //repositorioLicencias.Guardar(unaLicencia);
        }

        [TestCleanup]
        public void TearDown()
        {
            repositorioPersonas.EliminarInasistenciaALaFecha(unaPersona, unaFecha);
        }

        #endregion

        /// <summary>
        /// Este test prueba que no se pueda cargar una solicitud
        /// si se superpone con otra ya cargada
        /// </summary>
        [TestMethod]
        public void TestValidacionSolicitudesSuperpuestas()
        {
            var otraLicencia = new Licencia();
            //var estadoPrevio = repositorioLicencias.Guardar(unaLicencia);
            //Assert.IsNull(estadoPrevio);

            otraLicencia.Desde = unaFecha;
            otraLicencia.Hasta = unaFecha;
            otraLicencia.Persona = unaPersona;
            otraLicencia.Concepto = unConcepto;
            otraLicencia.Auditoria = unaAuditoria;

            var mensajeObtenido = repositorioLicencias.Guardar(otraLicencia);

            const string mensajeEsperado = "Error, ya existe una solicitud cargada en ese periodo.";
            Assert.AreEqual(mensajeObtenido, mensajeEsperado);

            repositorioPersonas.EliminarInasistenciaALaFecha(unaPersona, unaFecha);

        }


        /// <summary>
        /// Este test prueba que no se pueda cargar una licencia si ya 
        /// esta cargada o solicitada para ese periodo
        /// </summary>
        [TestMethod]
        public void TestValidacionLicenciasSuperpuestas()
        {

            var otraLicencia = new Licencia();
            var otraFecha = new DateTime(2001, 04, 04);

            repositorioLicencias.Guardar(unaLicencia);

            otraLicencia.Desde = otraFecha;
            otraLicencia.Hasta = otraFecha;
            otraLicencia.Persona = unaPersona;
            otraLicencia.Concepto = unConcepto;
            otraLicencia.Auditoria = unaAuditoria;
            string mensajeObtenido = repositorioLicencias.Guardar(otraLicencia);
            const string mensajeEsperado = "Error, ya existe una solicitud cargada en ese periodo.";
            Assert.AreEqual(mensajeEsperado, mensajeObtenido);
        }

        /// <summary>
        /// Se testea la solicitud de una licencia.
        /// </summary>
        [TestMethod]
        public void TestSolucitudDeLicencia()
        {
            var otraLicencia = new Licencia();
            var otraFecha = new DateTime(2005, 6, 10);

            otraLicencia.Desde = otraFecha;
            otraLicencia.Hasta = otraFecha;
            otraLicencia.Persona = unaPersona;
            otraLicencia.Concepto = unConcepto;
            otraLicencia.Auditoria = unaAuditoria;

            string mensajeObtenido = repositorioLicencias.Guardar(otraLicencia);
            const string mensajeEsperado = null;
            Assert.IsNull(mensajeEsperado);

            repositorioPersonas.EliminarInasistenciaALaFecha(unaPersona, otraFecha);
        }

        [TestMethod]
        public void deberia_saber_cuantas_vacaciones_permitidas_tiene_agus_para_el_2010()
        {
//            string source = @"  |Id	    |documento     |direccion             |Id_Dato_Area   |Descripcion_Dato_Area      |Dato_Area                  |Orden  |Nombre_Asistente	   |Apellido_Asistente	     |Cargo	        |Prioridad_Asistente	  |Telefono_Asistente	    |Fax_Asistente          |Mail_Asistente	                |Nombre_Responsable     |Apellido_Responsable	  |Telefono_Responsable	    |Fax_Responsable  	    |Mail_Responsable	                
//                                |1  	    |RRHH            |9 de Julio 1925       |1              |Teléfono                   |4333-2222                  |1      |Juan                  |García                   |Secretaria    |1                        |4444-5555                |4444-1111              |juan.garcia@mds.gov.ar         |Fabián                 |Miranda                  |4567-2222                |4544-3322              |fabian.miranda@ministerio.gov.ar
//                                |2	        |Dirección       |17 de Agosto 1850     |2              |Mail                       |area2@ministerio.gob.ar    |1      |María                 |Pérez                    |Secretaria    |1                        |4444-5555                |4444-1111              |maria.perez@ministerio.gov.ar  |Marta                  |Novoa                    |4567-1111                |4544-1111              |marta.novoa@ministerio.gov.ar               
//                                |1  	    |RRHH            |9 de Julio 1925       |1              |Teléfono                   |4333-2222                  |1      |Juan                  |García                   |Secretaria    |1                        |4444-5555                |4444-1111              |juan.garcia@mds.gov.ar         |Fabián                 |Miranda                  |4567-2222                |4544-3322              |fabian.miranda@ministerio.gov.ar
//                                |2	        |Dirección       |17 de Agosto 1850     |2              |Mail                       |area2@ministerio.gob.ar    |1      |María                 |Pérez                    |Secretaria    |1                        |4444-5555                |4444-1111              |maria.perez@ministerio.gov.ar  |Marta                  |Novoa                    |4567-1111                |4544-1111              |marta.novoa@ministerio.gov.ar               ";


//            IConexionBD conexion = TestObjects.ConexionMockeada();
//            var resultado_sp = TablaDeDatos.From(source);

//            Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));


            var persona = TestObjects.UnaPersona();
            var lista_personas = new List<Persona>() { persona };
            CalculadorDeVacaciones calculador = new CalculadorDeVacaciones(repositorioLicencias);
            
            var vacaciones_permitidas_de_agus = new VacacionesPermitidas();
            var periodo = new Periodo(new DateTime(2010,01,01),new DateTime(2010,12,31));
            Assert.AreEqual(20, calculador.CalcularVacacionesPermitidasPara(lista_personas));

           

            
        }


    }
}
