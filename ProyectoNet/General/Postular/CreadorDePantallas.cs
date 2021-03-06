﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using General.Postular;

namespace General
{
    public class CreadorDePantallas
    {
        public PantallaRecepcionDocumentacion CrearPantalla(CurriculumVitae curriculumVitae, Perfil perfil, Postulacion postulacion, List<DocumentacionRecibida> lista_docRecibida)
        {
            var pantalla = new PantallaRecepcionDocumentacion();
            var lista_docRequerida = new List<DivDocumentacionRequerida>();

            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvEstudios, "Estudios", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvCertificadosDeCapacitacion, "Actividades de Capacitacion", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvDocencias, "Actividades Docentes", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvEventosAcademicos, "Eventos Academicos", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvPublicaciones, "Publicaciones", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvMatricula, "Matriculas", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvInstitucionesAcademicas, "Instituciones Academicas", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvExperienciaLaboral, "Experiencia Laboral", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvIdiomas, "Idiomas", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvCompetenciasInformaticas, "Compentencias Informáticas", perfil);
            CargarDocumentacionRequerida(lista_docRequerida, curriculumVitae.CvCapacidadesPersonales, "Capacidades Personales", perfil);

            AgragarRequisitosObligatorios(perfil, pantalla);
            
            pantalla.DocumentacionRequerida = lista_docRequerida;
            pantalla.Postulacion = postulacion;
            pantalla.DocumentacionRecibida = lista_docRecibida;

            AgregarACuadroPerfil(curriculumVitae.CvEstudios, perfil, pantalla);
            AgregarACuadroPerfil(curriculumVitae.CvIdiomas, perfil, pantalla);
            AgregarACuadroPerfil(curriculumVitae.CvExperienciaLaboral, perfil, pantalla);
            //AgregarACuadroPerfil(new List<AntecedentePenal> { new AntecedentePenal() }, perfil, pantalla);

            return pantalla;
        }

        private void AgragarRequisitosObligatorios(Perfil perfil, PantallaRecepcionDocumentacion pantalla)
        {
            foreach (var requisito in perfil.Requisitos())
            {
                pantalla.RequisitosPerfil.Add(requisito.Descripcion);
                
            }
        }



        protected void AgregarACuadroPerfil(IList items_del_cv, Perfil perfil, PantallaRecepcionDocumentacion pantalla)
        {
           
            foreach (RequisitoPerfil requisito in perfil.Requisitos())
            {
                var documentacion_requerida = new DivDocumentacionRequerida();
                    //documentacion_requerida.DescripcionRequisito = requisito.Descripcion;
                foreach (ItemCv item_cv in items_del_cv)
                {
                    if (requisito.EsCumlidoPor(item_cv))
                    {
                        documentacion_requerida.DescripcionRequisito = requisito.Descripcion;
                        documentacion_requerida.AddItemCv(item_cv);
                    }
                }

                if (documentacion_requerida.TieneItems())
                {
                    pantalla.CuadroPerfil.Add(documentacion_requerida);
                }
            }
        }

        protected void CargarDocumentacionRequerida(List<DivDocumentacionRequerida> lista_doc_requerida, IList lista, string descripcion_requisito, Perfil perfil)
        {
            if (lista.Count > 0)
            {
                var documentacion = new DivDocumentacionRequerida();
                documentacion.DescripcionRequisito = descripcion_requisito;
                foreach (ItemCv item_cv in lista)
                {
                    if (!perfil.Requisitos().Any(req => req.EsCumlidoPor(item_cv)))
                    {
                        documentacion.AddItemCv(item_cv);
                    }
                }
                if (documentacion.ItemsCv.Count > 0)
                {
                    lista_doc_requerida.Add(documentacion);
                }
            }
        }
    }
}
