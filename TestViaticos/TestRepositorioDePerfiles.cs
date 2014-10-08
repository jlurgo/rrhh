﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using General.Repositorios;
using General.Calendario;
using General;


using NMock2;
using General.MAU;
using General.Postular;

namespace TestViaticos
{

    [TestClass]
    public class TestRepositorioDePerfiles
    {

        Puesto perfil;
        CurriculumVitae cv = TestObjects.UnCV();
        CreadorDePantallas creador;

        [TestInitialize]
        public void Setup()
        {
            perfil = TestObjects.UnPerfil();
            cv = TestObjects.UnCV();
            creador = new CreadorDePantallas();
        }



        [TestMethod]
        public void deberia_poder_conocer_los_foliables_de_un_perfil()
        {
            IConexionBD conexion = TestObjects.ConexionMockeada();
            
            string source = @"  |DescripcionDocRequerida	                            |NombreClaseFoliable                   |  
                                |Se requiere 5 años de experiencia en ambito publico	|FoliableExperienciaLaboralPublica     |
                                |Se requiere 2 años de experiencia en ambito privado    |FoliableExperienciaLaboralPrivada     |
                                |Titulo Universitario	 	                            |FoliableEstudiosUniversitario         | 
                                |Antecedentes Penales	                                |FoliableAntecedentesPenales           |";


           var resultado_sp = TablaDeDatos.From(source);
           Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));

           RepositorioDePuestos repo = new RepositorioDePuestos(conexion);



           perfil.DocumentacionRequerida = repo.GetFoliablesDelPerfil(perfil.Id);
           Assert.AreEqual(4, perfil.DocumentacionRequerida.Count);

        }

        [TestMethod]
        public void deberia_traer_los_estudios_universitarios_de_un_cv_a_partir_del_foliable()
        {
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());
            //cv.AgregarEstudio(TestObjects.UnEstudioSecundario());
            //tabla de niveles de estudio se llama tabla_codigo_escolaridad_nivel
            //nivel universitario = 12  nivel secundario = 04

            FoliableEstudiosUniversitario foliable_universitario = new FoliableEstudiosUniversitario();
            FoliableEstudiosSecundario foliable_secundario = new FoliableEstudiosSecundario();
            //perfil.DocumentacionRequerida = repo.GetFoliablesDelPerfil(perfil.Id);

            Assert.AreEqual(2, foliable_universitario.documentacion(cv).Count);
            Assert.AreEqual(0, foliable_secundario.documentacion(cv).Count);

        }

        [TestMethod]
        public void deberia_crear_una_pantalla_mostrando_solo_ingles()
        {
           
            cv.AgregarIdioma(Idioma("Ingles"));
            
            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, TestObjects.UnPerfil());

            AssertDocNoRequerida(new Dictionary<string, List<string>>() {
                { "Idiomas", new List<string>() { "Ingles" } } 
            }, pantalla);

            AssertDocRequerida(new Dictionary<string, List<string>>(), pantalla);
        }



        [TestMethod]
        public void deberia_crear_una_pantalla_mostrando_solo_aleman()
        {

            cv.AgregarIdioma(Idioma("Aleman"));
            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, TestObjects.UnPerfil());

            var no_requerido = new Dictionary<string, List<string>>() {
                { "Idiomas", new List<string>() { "Aleman" } } 
            };

            AssertDocNoRequerida(no_requerido, pantalla);

        }

        [TestMethod]
        public void deberia_crear_una_pantalla_mostrando_una_publicacion()
        {
            cv.AgregarPublicacion(new CvPublicaciones(1,"Informe sobre ciegos","","",1,1,new DateTime()));
            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, TestObjects.UnPerfil());

            var no_requerido = new Dictionary<string, List<string>>() {
                { "Publicaciones", new List<string>() { "Informe sobre ciegos" } } 
            };
            AssertDocNoRequerida(no_requerido, pantalla);
        }

        [TestMethod]
        public void deberia_crear_una_pantalla_mostrando_aleman_e_ingles_y_una_publicacion()
        {

            cv.AgregarIdioma(Idioma("Aleman"));
            cv.AgregarIdioma(Idioma("Ingles"));
            cv.AgregarPublicacion(new CvPublicaciones(1, "Informe sobre ciegos", "", "", 1, 1, new DateTime()));
            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, TestObjects.UnPerfil());

            var no_requerido = new Dictionary<string, List<string>>() {
                { "Publicaciones", new List<string>() { "Informe sobre ciegos" } },
                 { "Idiomas", new List<string>() { "Aleman", "Ingles" } }
            };

            AssertDocNoRequerida(no_requerido, pantalla);
        }


        [TestMethod]
        public void deberia_ver_el_idioma_ingles_en_el_cuadro_del_perfil()
        {
            cv.AgregarIdioma(Idioma("Ingles"));

            Puesto puesto = TestObjects.UnPerfil();
            puesto.Requiere(RequisitoIdiomaIngles());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            var no_requerido = new Dictionary<string, List<string>>();
            var requerido = new Dictionary<string, List<string>>()
                {
                    { "Idiomas", new List<string>(){ "Ingles" }}
                };
            AssertDocNoRequerida(no_requerido, pantalla);
            AssertDocRequerida(requerido, pantalla);

        }

        [TestMethod]
        public void deberia_ver_el_idioma_portugues_en_el_cuadro_del_perfil()
        {
            cv.AgregarIdioma(Idioma("Portugues"));

            Puesto puesto = TestObjects.UnPerfil();
            puesto.Requiere(RequisitoIdiomaPortugues());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocNoRequerida(new Dictionary<string, List<string>>(), pantalla);
            AssertDocRequerida(new Dictionary<string, List<string>>() { 
                { "Idiomas", new List<string>(){ "Portugues" }}
            }, pantalla);

        }

        [TestMethod]
        public void deberia_ver_el_idioma_ingles_en_el_cuadro_del_perfil_y_portugues_fuera_de_el()
        {
            cv.AgregarIdioma(Idioma("Ingles"));
            cv.AgregarIdioma(Idioma("Portugues"));

            Puesto puesto = TestObjects.UnPerfil();
            puesto.Requiere(RequisitoIdiomaIngles());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocRequerida(new Dictionary<string, List<string>>() { 
                { "Idiomas", new List<string>(){ "Ingles" }}
            }, pantalla);
            AssertDocNoRequerida(new Dictionary<string, List<string>>() { 
                { "Idiomas", new List<string>(){ "Portugues" }}
            }, pantalla);

        }

        [TestMethod]
        public void deberia_ver_el_idioma_ingles_y_portugues_en_el_cuadro_del_perfil()
        {
            cv.AgregarIdioma(Idioma("Ingles"));
            cv.AgregarIdioma(Idioma("Portugues"));

            Puesto puesto = TestObjects.UnPerfil();
            var idiomas_requeridos = new List<string>() { "Ingles", "Portugues" };
            puesto.Requiere(new RequisitoIdioma("Idiomas", idiomas_requeridos));

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocRequerida(new Dictionary<string, List<string>>() { 
                { "Idiomas", new List<string>(){ "Ingles", "Portugues" }}
            }, pantalla);
            AssertDocNoRequerida(new Dictionary<string, List<string>>(), pantalla);

        }

        [TestMethod]
        public void no_deberia_ver_el_titulo_universitario_en_el_cuadro_del_perfil()
        {
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());

            Puesto puesto = TestObjects.UnPerfil();

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocNoRequerida(new Dictionary<string, List<string>>() { 
                { "Estudios", new List<string>(){ "Lic en Adm" }}
            }, pantalla);
            AssertDocRequerida(new Dictionary<string, List<string>>(), pantalla);

        }

        [TestMethod]
        public void no_deberia_tener_un_idioma_en_el_cuadro_perfil_cuando_el_perfil_no_lo_requiere()
        {
            cv.AgregarIdioma(Idioma("Ingles"));
            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, TestObjects.UnPerfil());

            AssertDocRequerida(new Dictionary<string, List<string>>(), pantalla);
            AssertDocNoRequerida(new Dictionary<string, List<string>>() { 
                { "Idiomas", new List<string>(){ "Ingles" }}
            }, pantalla);
        }


        [TestMethod]
        public void deberia_ver_el_titulo_universitario_en_el_cuadro_del_perfil()
        {
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());

            Puesto puesto = TestObjects.UnPerfil();
            puesto.Requiere(new RequisitoEstudio("Un Estudio Universitario", new NivelDeEstudio(12, "Universitario")));

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocNoRequerida(new Dictionary<string, List<string>>(), pantalla);
            AssertDocRequerida(new Dictionary<string, List<string>>() { 
                { "Un Estudio Universitario", new List<string>(){ "Lic en Adm" }}
            }, pantalla);


        }


        [TestMethod]
        public void deberia_ver_el_universitario_en_el_perfil_y_el_secundario_fuera_de_el()
        {
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());
            cv.AgregarEstudio(TestObjects.UnEstudioSecundario());

            Puesto puesto = TestObjects.UnPerfil();
            puesto.Requiere(new RequisitoEstudio("Un Estudio Universitario", new NivelDeEstudio(12, "Universitario")));

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocRequerida(new Dictionary<string, List<string>>() {
                { "Un Estudio Universitario", new List<string>() { "Lic en Adm" } },
            }, pantalla);

            AssertDocNoRequerida(new Dictionary<string, List<string>>() {
                { "Estudios", new List<string>() { "Tecnico Electricista" } },
            }, pantalla);
        }

        [TestMethod]
        public void deberia_ver_el_universitario_e_ingles_en_el_perfil_y_el_secundario__y_portugues_fuera_de_el()
        {
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());
            cv.AgregarEstudio(TestObjects.UnEstudioSecundario());
            cv.AgregarIdioma(Idioma("Ingles"));
            cv.AgregarIdioma(Idioma("Portugues"));

            Puesto puesto = TestObjects.UnPerfil();
            var idiomas_requeridos = new List<string>() { "Ingles" };
           
            puesto.Requiere(new RequisitoEstudio("Un Estudio Universitario", new NivelDeEstudio(12, "Universitario")));
            puesto.Requiere(new RequisitoIdioma("Idiomas", idiomas_requeridos));

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, puesto);

            AssertDocRequerida(new Dictionary<string, List<string>>() {
                { "Un Estudio Universitario", new List<string>() { "Lic en Adm" } },
                 { "Idiomas", new List<string>() { "Ingles" } }
            }, pantalla);

            AssertDocNoRequerida(new Dictionary<string, List<string>>() {
                { "Estudios", new List<string>() { "Tecnico Electricista" } },
                 { "Idiomas", new List<string>() { "Portugues" } }
            }, pantalla);

        }

        [TestMethod]
        public void no_deberia_mostrar_en_el_cuadro_de_perfil_la_antiguedad_publica()
        {

            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPublica());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, perfil);

            AssertDocNoRequerida(new Dictionary<string, List<string>>() {
                { "Experiencia Laboral", new List<string>() { "Trabajo MDS" } }
            }, pantalla);

            AssertDocRequerida(new Dictionary<string, List<string>>(), pantalla);
        }

        [TestMethod]
        public void deberia_mostrar_en_el_cuadro_de_perfil_la_antiguedad_publica()
        {

            perfil.Requiere(new RequisitoAntiguedad("Dos años de experiencia pública", new AmbitoLaboral(1, "Publica")));

            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPublica());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, perfil);

            AssertDocRequerida(new Dictionary<string, List<string>>() {
                { "Dos años de experiencia pública", new List<string>() { "Trabajo MDS" } }
                
            }, pantalla);

            AssertDocNoRequerida(new Dictionary<string, List<string>>(), pantalla);
        }

        [TestMethod]
        public void deberia_mostrar_en_el_cuadro_de_perfil_la_antiguedad_privada_y_no_la_exp_publica()
        {
            perfil.Requiere(new RequisitoAntiguedad("Dos años de experiencia privada", new AmbitoLaboral(2, "Privada")));

            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPrivada());
            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPublica());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, perfil);

            AssertDocRequerida(new Dictionary<string, List<string>>() {
                { "Dos años de experiencia privada", new List<string>() { "Banco Macro" } } 
                
            }, pantalla);

            AssertDocNoRequerida(new Dictionary<string, List<string>>() {
                { "Experiencia Laboral", new List<string>() { "Trabajo MDS" } }
                
            }, pantalla);
        }

        [TestMethod]
        public void deberia_mostrar_en_el_cuadro_de_perfil_la_antiguedad_privada_la_exp_publica_un_estudio_universitario_y_no_idioma()
        {

            perfil.Requiere(new RequisitoAntiguedad("Dos años de experiencia publica", new AmbitoLaboral(1, "Publica")));
            perfil.Requiere(new RequisitoAntiguedad("Dos años de experiencia privada", new AmbitoLaboral(2, "Privada")));
            perfil.Requiere(new RequisitoEstudio("Un Estudio Universitario", new NivelDeEstudio(12, "Universitario")));

            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPrivada());
            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPublica());
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());
            cv.AgregarIdioma(Idioma("Ingles"));

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, perfil);

            AssertDocRequerida(new Dictionary<string, List<string>>() {
                { "Un Estudio Universitario", new List<string>() { "Lic en Adm" } } ,    
                { "Dos años de experiencia publica", new List<string>() { "Trabajo MDS" } } ,
                { "Dos años de experiencia privada", new List<string>() { "Banco Macro" } } 
                
            }, pantalla);

            AssertDocNoRequerida(new Dictionary<string, List<string>>()
            {
                { "Idiomas", new List<string> { "Ingles" } }
            }, pantalla);

        }

      /*  [TestMethod]
        public void deberia_mostrar_matriculas_en_doc_no_requerida()
        {
            //perfil.Requiere(new RequisitoAntiguedad("Dos años de experiencia privada", new AmbitoLaboral(2, "Privada")));

            cv.AgregarMatricula(TestObjects.UnaExpPrivada());
            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPublica());

            PatallaRecepcionDocumentacion pantalla = creador.CrearPantalla(cv, perfil);

            AssertDocRequerida(new Dictionary<string, List<string>>() {
                { "Dos años de experiencia privada", new List<string>() { "Banco Macro" } } 
                
            }, pantalla);

            AssertDocNoRequerida(new Dictionary<string, List<string>>() {
                { "Experiencia Laboral", new List<string>() { "Trabajo MDS" } }
                
            }, pantalla);
        }*/


        private static CvIdiomas Idioma(string idioma)
        {
            return new CvIdiomas(1, idioma, "", idioma, 1, 1, 1, new DateTime(), "", 1);
        }

        private static RequisitoIdioma RequisitoIdiomaIngles()
        {
            return RequisitoIdiomaUnIdioma("Ingles");
        }

        private static RequisitoIdioma RequisitoIdiomaPortugues()
        {
            return RequisitoIdiomaUnIdioma("Portugues");
        }

        private static RequisitoIdioma RequisitoIdiomaUnIdioma(string idioma)
        {
            var el_idioma = new List<string>() { idioma };
            return new RequisitoIdioma("Idiomas", el_idioma);
        }

        public void AssertDocNoRequerida(Dictionary<string, List<string>> requerido, PatallaRecepcionDocumentacion pantalla)
        {
            var doc = pantalla.DocumentacionRequerida;
            ValidacionesPantalla(requerido, doc);
        }

        public void AssertDocRequerida(Dictionary<string, List<string>> requerido, PatallaRecepcionDocumentacion pantalla)
        {
            var doc = pantalla.CuadroPerfil;
            ValidacionesPantalla(requerido, doc);
        }

        private void ValidacionesPantalla(Dictionary<string, List<string>> requerido, List<DivDocumentacionRequerida> doc)
        {
            Assert.AreEqual(requerido.Count, doc.Count);

            for (int i = 0; i < requerido.Keys.Count; i++)
            {
                string key = requerido.Keys.ToList()[i];
                Assert.AreEqual(requerido[key].Count, doc[i].ItemsCv.Count());
                Assert.AreEqual(key, doc[i].DescripcionRequisito);

                for (int j = 0; j < requerido[key].Count; j++)
                {
                    Assert.AreEqual(requerido[key][j], doc[i].ItemsCv[j].Descripcion);
                }
            }
        }


       /* [TestMethod]
        public void la_postulacion_deberia_tener_la_lista_de_doc_recibida()
        {
            IConexionBD conexion = TestObjects.ConexionMockeada();
            
            string source = @"  |DescripcionDocRequerida	                            |NombreClaseFoliable                   |  
                                |Se requiere 5 años de experiencia en ambito publico	|FoliableExperienciaLaboralPublica     |
                                |Se requiere 2 años de experiencia en ambito privado    |FoliableExperienciaLaboralPrivada     |
                                |Titulo Universitario	 	                            |FoliableEstudiosUniversitario         | 
                                |Antecedentes Penales	                                |FoliableAntecedentesPenales           |";


           var resultado_sp = TablaDeDatos.From(source);
           Expect.AtLeastOnce.On(conexion).Method("Ejecutar").WithAnyArguments().Will(Return.Value(resultado_sp));

           RepositorioDePuestos repo = new RepositorioDePuestos(conexion);

           Puesto perfil = TestObjects.UnPerfil();

           perfil.DocumentacionRequerida = repo.GetFoliablesDelPerfil(perfil.Id);

            Postulacion postulacion = TestObjects.UnaPostulacion();
            CurriculumVitae cv = TestObjects.UnCV();
            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPrivada());
            cv.AgregarExperienciaLaboral(TestObjects.UnaExpPublica());
            cv.AgregarEstudio(TestObjects.UnEstudioUniversitario());

            //List<DocumentacionRecibida> doc_recibidos = new List<DocumentacionRecibida>();

            FoliableEstudiosUniversitario foliable_universitario = new FoliableEstudiosUniversitario();
            FoliableEstudiosSecundario foliable_secundario = new FoliableEstudiosSecundario();
            //perfil.DocumentacionRequerida = repo.GetFoliablesDelPerfil(perfil.Id);

            //perfil.DocumentacionRequerida.ForEach(dr => dr.documentacion(cv).ForEach(d => postulacion.AgregarDocumentacionRecibida(new DocumentacionRecibida(0,"",d,DateTime.Today))));
            postulacion.CrearDocumentacionARecibir(perfil.DocumentacionRequerida, cv);
            
            Assert.AreEqual(4, postulacion.DocumentacionARecibir.Count);
            Assert.AreEqual(1, foliable_universitario.documentacion(cv).Count);
            Assert.AreEqual(0, foliable_secundario.documentacion(cv).Count);

        }*/


    }
}