﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using General.Repositorios;
using General.Calendario;
using General;
using NDbUnit.Core;
using NDbUnit.Core.SqlClient;
using NMock2;

namespace TestViaticos
{
    [TestClass]
    public class TestRepositorioDeViaticos
    {
        private RepositorioDeComisionesDeServicio repoViaticos;
        private IConexionBD conexionMock;
        [TestInitialize]
        public void SetUp()
        {
            conexionMock = TestObjects.ConexionMockeada();
            repoViaticos = new RepositorioDeComisionesDeServicio(conexionMock);
        }     

        [TestMethod]
        public void deberia_poder_guardar_un_nuevo_viatico_en_el_repositorio_de_viaticos_y_que_se_le_asigne_un_id()
        {
            var una_comision_nueva  = TestObjects.ComisionDeBelen();
            Assert.AreEqual(0, una_comision_nueva.Id);
            Expect.AtLeastOnce.On(conexionMock).Method("EjecutarEscalar").WithAnyArguments().Will(Return.Value((decimal)10));          
            repoViaticos.GuardarComisionDeServicio(una_comision_nueva);            
            Assert.AreEqual(10, una_comision_nueva.Id);
        }


        [TestMethod]
        [Ignore]
        public void deberia_poder_obtener_un_viatico_con_una_estadia_un_pasaje_y_una_transicion()
        {
            Expect.AtLeastOnce.On(conexionMock).Method("Ejecutar").WithAnyArguments().Will(Return.Value(TestObjects.TablaViaticoConUnaEstadiaUnPasajeYUnaTransicion()));          
            var una_comision = repoViaticos.ObtenerViaticoPorId(1);
            Assert.AreEqual(1, una_comision.Id);
            Assert.AreEqual(1, una_comision.Estadias.Count);
            Assert.AreEqual(1, una_comision.Pasajes.Count);
            Assert.AreEqual(1, una_comision.TransicionesRealizadas.Count);
        }

        [TestMethod]
        [Ignore]
        public void deberia_poder_obtener_un_viatico_con_dos_estadias_dos_pasajes_y_dos_transiciones()
        {
            Expect.AtLeastOnce.On(conexionMock).Method("Ejecutar").WithAnyArguments().Will(Return.Value(TestObjects.TablaViaticoConDosEstadiasDosPasajesYDosTransiciones()));
            var una_comision = repoViaticos.ObtenerViaticoPorId(1);
            Assert.AreEqual(1, una_comision.Id);
            Assert.AreEqual(2, una_comision.Estadias.Count);
            Assert.AreEqual(2, una_comision.Pasajes.Count);
            Assert.AreEqual(2, una_comision.TransicionesRealizadas.Count);
        }

        [TestMethod]
        public void deberia_poder_obtener_un_viatico_sin_estadias_pasajes_ni_transiciones()
        {
            Expect.AtLeastOnce.On(conexionMock).Method("Ejecutar").WithAnyArguments().Will(Return.Value(TestObjects.TablaViaticoSinEstadiasPasajesNiTransiciones()));
            var una_comision = repoViaticos.ObtenerViaticoPorId(1);
            Assert.AreEqual(1, una_comision.Id);
            Assert.AreEqual(0, una_comision.Estadias.Count);
            Assert.AreEqual(0, una_comision.Pasajes.Count);
            Assert.AreEqual(0, una_comision.TransicionesRealizadas.Count);
        }

        [TestMethod]
        public void deberia_traer_4_viaticos()
        {
            string source = @"  |Id|Baja |fecha                  |IdAreaCreadora |DescripcionAreaCreadora                                                    |Persona_Nombre |Persona_Apellido   |Persona_Documento  |Persona_Area_Id    |Persona_Area_Descripcion                                                   |Estadia_Id |Estadia_Desde      |Estadia_Hasta      |Estadia_Provincia_Id   |Estadia_Provincia_Nombre   |Estadia_Eventuales |Estadia_AdicionalParaPasajes   |Estadia_CalculadoPorCategoria  |Estadia_Motivo |Pasaje_Id  |Pasaje_LocalidadOrigen_Id  |Pasaje_LocalidadOrigen_Nombre  |Pasaje_LocalidadDestino_Id |Pasaje_LocalidadDestino_Nombre |Pasaje_FechaDeViaje    |Pasaje_MedioDeTransporte_Id    |Pasaje_MedioDeTransporte_Nombre    |Pasaje_MedioDePago_Id  |Pasaje_MedioDePago_Nombre  |Pasaje_Precio  |Transicion_Id  |Transicion_AreaOrigen_Id   |Transicion_AreaOrigen_Descripcion                                              |Transicion_AreaOrigen_Responsable_Nombre   |Transicion_AreaOrigen_Responsable_Apellido |Transicion_AreaOrigen_Responsable_Documento    |Transicion_AreaDestino_Id  |Transicion_AreaDestino_Descripcion                                             |Transicion_AreaDestino_Responsable_Nombre  |Transicion_AreaDestino_Responsable_Apellido    |Transicion_AreaDestino_Responsable_Documento   |Transicion_Id_Accion   |Transicion_Fecha           |Transicion_Comentario  |Telefono_Area  |Cuil_Persona     |Legajo_Persona |Nivel_Funcion  |Grado_Rango     |Categoria_Persona  |Id_Zona|Nombre_Zona   |
                                |15|false|2012-10-11 21:36:35.077|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|19         |2012-10-22 10:00:00|2012-10-23 10:00:00|3                      |CORDOBA                    |100.0              |100.0                          |0.1                            |motivo         |7          |3552                       |LA ROSARINA                    |3552                       |LA ROSARINA                    |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |120.1          |5              |1024                       |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas    |Fabian Adalberto                           |MIRANDA                                    |22049417                                       |1024                       |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas    |Fabian Adalberto                           |MIRANDA                                        |22049417                                       |4                      |2012-10-11 21:36:35.053    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |15|false|2012-10-11 21:36:35.077|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|19         |2012-10-22 10:00:00|2012-10-23 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |7          |3552                       |LA ROSARINA                    |3552                       |LA ROSARINA                    |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |120            |6              |1024                       |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas    |Fabian Adalberto                           |MIRANDA                                    |22049417                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |1                      |2012-10-12 17:06:35.643    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |15|false|2012-10-11 21:36:35.077|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|19         |2012-10-22 10:00:00|2012-10-23 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |7          |3552                       |LA ROSARINA                    |3552                       |LA ROSARINA                    |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |120            |7              |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                      |16533276                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |4                      |2012-10-12 17:10:27.270    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |15|false|2012-10-11 21:36:35.077|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|19         |2012-10-22 10:00:00|2012-10-23 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |7          |3552                       |LA ROSARINA                    |3552                       |LA ROSARINA                    |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |120            |8              |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                      |16533276                                       |1024                       |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas    |Fabian Adalberto                           |MIRANDA                                        |22049417                                       |2                      |2012-10-12 17:18:22.277    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |15|false|2012-10-11 21:36:35.077|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|19         |2012-10-22 10:00:00|2012-10-23 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |7          |3552                       |LA ROSARINA                    |3552                       |LA ROSARINA                    |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |120            |9              |1024                       |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas    |Fabian Adalberto                           |MIRANDA                                    |22049417                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |4                      |2012-10-12 17:37:42.440    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |16|false|2012-10-12 19:41:04.793|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|20         |2012-10-12 10:00:00|2012-10-12 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |8          |3081                       |ABBURRA                        |3081                       |ABBURRA                        |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |0              |10             |1024                       |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas    |Fabian Adalberto                           |MIRANDA                                    |22049417                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |4                      |2012-10-12 19:41:04.870    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |16|false|2012-10-12 19:41:04.793|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|20         |2012-10-12 10:00:00|2012-10-12 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |8          |3081                       |ABBURRA                        |3081                       |ABBURRA                        |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |0              |11             |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                      |16533276                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |4                      |2012-10-12 19:47:03.840    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |16|false|2012-10-12 19:41:04.793|939            |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Carla Lorena   |ACOSTA             |31475729           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|20         |2012-10-12 10:00:00|2012-10-12 10:00:00|3                      |CORDOBA                    |100                |100                            |0                              |motivo         |8          |3081                       |ABBURRA                        |3081                       |ABBURRA                        |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |0              |12             |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                      |16533276                                       |16                         |Secretaría de Coordinación y Monitoreo Institucional                           |Carlos Daniel                              |CASTAGNETO                                     |13942516                                       |1                      |2012-10-12 19:48:15.270    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |17|false|2012-10-18 19:43:06.510|54             |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Daniel Antonio |TATAY              |13407166           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|22         |2012-10-17 10:00:00|2012-10-19 10:00:00|14                     |TUCUMAN                    |0                  |0                              |0                              |motivo         |8          |3081                       |ABBURRA                        |3081                       |ABBURRA                        |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |0              |11             |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                      |16533276                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |4                      |2012-10-12 19:47:03.840    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |
                                |18|false|2012-10-18 19:47:53.947|16             |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|Daniel Antonio |TATAY              |13407166           |1024               |Dirección de Diseño y Desarrollo Organizacional para la Gestión de Personas|23         |2012-10-16 08:00:00|2012-10-16 16:00:00|9                      |SALTA                      |58                 |500                            |0                              |motivo         |8          |3081                       |ABBURRA                        |3081                       |ABBURRA                        |2012-10-12 00:00:00    |1                              |Micro                              |1                      |Tarjeta De Credito         |0              |11             |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                      |16533276                                       |54                         |Dirección General de Recursos Humanos y Organización                           |Marta Alicia                               |NOVOA                                          |16533276                                       |4                      |2012-10-12 19:47:03.840    |coment_transicion      |4444-4444      |27-31475729-2    |203426         |D              |0A              |Contrato 1421      |4      |CENTRO        |";

            IConexionBD conexion = TestObjects.ConexionMockeada();
            var resultado_sp = TablaDeDatos.From(source);// CrearResultadoSP();

            Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));

            RepositorioDeComisionesDeServicio repo = new RepositorioDeComisionesDeServicio(conexion);

            Assert.AreEqual(4, repo.ObtenerTodosLosViaticos().Count);

          
        }
    }
}
