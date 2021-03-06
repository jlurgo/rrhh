﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.MAU;
using General.Repositorios;
using System.Configuration;
using General;

namespace General
{
    public class ResponsableDDJJ
    {
        IRepositorioDePermisosSobreAreas repositorio_permisos_areas;
        IRepositorioDeFuncionalidadesDeUsuarios repositorio_funcionalidades;
        Autorizador autorizador;

        public ResponsableDDJJ(IRepositorioDePermisosSobreAreas un_repo, Autorizador auto)
        {
            repositorio_permisos_areas = un_repo;
            autorizador = auto;
        }

        public ResponsableDDJJ(IRepositorioDePermisosSobreAreas un_repo, IRepositorioDeFuncionalidadesDeUsuarios repo_funcionalidad, Autorizador auto)
        {
            repositorio_permisos_areas = un_repo;
            autorizador = auto;
            repositorio_funcionalidades = repo_funcionalidad;
        }

        public ConexionBDSQL Conexion()
        {
            return new ConexionBDSQL(ConfigurationManager.ConnectionStrings["SQLConection"].ConnectionString);
        }

        public List<Area> AreasConDDJJAdministradasPor(Usuario usuario)
        {
            //FC nuevo llamado a Permisos Areas
            return repositorio_funcionalidades.AreasAdministradasPor(usuario, 22).FindAll(area =>  area != null).FindAll(area => area.PresentaDDJJ);
            //return repositorio_permisos_areas.AreasAdministradasPor(usuario).FindAll(area => area.PresentaDDJJ);
        }

        public List<Area> AreasSinDDJJInferioresA(Area area)
        {
            var repositorio = new RepositorioDeOrganigrama(Conexion());
            //return repositorio.GetOrganigrama().AreasInferioresInmediatasDe(area).FindAll(a => !a.PresentaDDJJ);
            return repositorio.GetAreaInferiorById(area.Id, false);
        }

        public List<AreaParaDDJJ104> GetAreasParaDDJJ104(int mes, int anio, int id_area, Usuario usuario)
        {
            RepositorioPersonas repoPersonas = new RepositorioPersonas();
            RepositorioDeOrganigrama repoOrganigrama = new RepositorioDeOrganigrama(Conexion());
            //var un_Organigrama = repoOrganigrama.GetOrganigrama();
            DateTime fecha = Convert.ToDateTime("15" + "/" + mes + "/" + anio);
            var un_Organigrama = repoOrganigrama.GetOrganigramaSegunFechaDesde(fecha);
            
            List<AreaParaDDJJ104> areas = new List<AreaParaDDJJ104>();
            List<Area> areas_completas;
            if (autorizador.ElUsuarioTienePermisosPara(usuario.Id, "ddjj104_mostrar_todas_las_areas"))
            {
                areas_completas = un_Organigrama.ObtenerAreas(false);
            }
            else
            {
                areas_completas = AreasConDDJJAdministradasPor(usuario);
            }

            ////FILTRO EL AREA QUE ESTOY CONSULTANDO
            //if (id_area > 0)
            //{
            //    areas_completas = areas_completas.FindAll(x => x.Id == id_area);    
            //}

            areas_completas.ForEach(a =>
            {
                if (a.Id == 0)
                    return;

                var area = new AreaParaDDJJ104();
                area.Id = a.Id;
                area.Nombre = a.Nombre;
                area.Jerarquia = a.Jerarquia;
                //area.DDJJ = new RepositorioDDJJ104().GetDDJJParaElArea(a).Find(x => x.Mes == mes && x.Anio == anio);
                List<DDJJ104_2001> listaddjj = new RepositorioDDJJ104().GetDDJJParaElArea(a, mes, anio);

                if (listaddjj.Count == 0)
                {
                    areas.Add(area);
                }
                else
                {
                    if (listaddjj.Count == 1)
                    {
                        area.DDJJ = listaddjj[0]; //new RepositorioDDJJ104().GetDDJJParaElArea(a).Find(x => x.Mes == mes && x.Anio == anio && x.Complementaria == 0);
                        areas.Add(area);
                    }
                    else
                    {
                        int contador = 0;
                        foreach (var item in listaddjj)
                        {
                            area = new AreaParaDDJJ104();
                            area.Id = a.Id;
                            area.Nombre = a.Nombre;
                            area.Jerarquia = a.Jerarquia;
                            area.DDJJ = listaddjj[contador]; //new RepositorioDDJJ104().GetDDJJParaElArea(a).Find(x => x.Mes == mes && x.Anio == anio && x.Complementaria == contador);

                            contador++;
                            areas.Add(area);
                        }
                    }
                }

                //CARGO LAS AREAS QUE DEPENDEN Y LAS PERSONAS
                //if (id_area > 0)
                //{
                //    area.Personas.AddRange(repoPersonas.GetPersonasDelAreaParaDDJJ104(mes, anio, a));
                //    //AreasSinDDJJInferioresA(a).ForEach(area_dependiente =>
                //    un_Organigrama.GetAreasInferioresDelArea(a).ForEach(area_dependiente =>
                //    {
                //        if (!area_dependiente.PresentaDDJJ)
                //        {
                //            var area_informal = new AreaParaDDJJ104();
                //            area_informal.Id = area_dependiente.Id;
                //            area_informal.Nombre = area_dependiente.Nombre;
                //            area_informal.Personas = repoPersonas.GetPersonasDelAreaParaDDJJ104(mes, anio, area_dependiente);
                //            area.AreasInformalesDependientes.Add(area_informal);
                //        }
                //    });
                //      area.DDJJ = new RepositorioDDJJ104().GetDDJJParaElArea(a).Find(x => x.Mes == mes && x.Anio == anio);

                //    var area_superior = un_Organigrama.AreaSuperiorDe(a);
                //    area.AreaSuperior = new AreaParaDDJJ104();
                //    area.AreaSuperior.Id = area_superior.Id;
                //    area.AreaSuperior.Nombre = area_superior.Nombre;
                //    area.Direccion = a.Direccion;
                //}
                //areas.Add(area);
            });


            return areas;
            //List<AreaParaDDJJ104> lista_ddjj = new List<AreaParaDDJJ104>();
            //foreach (var un_area in areas_con_ddjj)
            //{
            //    ddjj_dto = new AreaParaDDJJ104();

            //    //--- Cargo el areas Formal (ddjj = 1) y Obtengo las personas de esa Area
            //    ddjj_dto.Area = un_area;
            //    un_area.Personas = repoPersonas.GetPersonasDelAreaReducida(un_area,2);
            //    contador_de_personas += un_area.Personas.Count();

            //    //--- Cargo el areas inferiores (ddjj = 0) y Obtengo las personas de esas Areas
            //    List<Persona> personasAreaInformales = new List<Persona>();
            //    personasAreaInformales = repoPersonas.GetPersonasDelAreaReducida(un_area, 0);
            //    if (personasAreaInformales.Count != 0)
            //    {
            //        un_area.Personas.AddRange(personasAreaInformales);
            //        contador_de_personas += personasAreaInformales.Count();
            //    }

            //    ddjj_dto.CantidadPersonas = contador_de_personas;
            //    ddjj_dto.Mes = mes;
            //    ddjj_dto.Anio = anio;
            //    ddjj_dto.Estado = new RepositorioDDJJ104().GetEstadoDDJJ(ddjj_dto);

            //    lista_ddjj.Add(ddjj_dto);

            //    contador_de_personas = 0;
            //}


            //return lista_ddjj;
        }



        public List<AreaParaDDJJ104> GetAreasParaDDJJ104InferioresA(int mes, int anio, int id_area, int complementaria, Usuario usuario)
        {
            RepositorioPersonas repoPersonas = new RepositorioPersonas();
            RepositorioDeOrganigrama repoOrganigrama = new RepositorioDeOrganigrama(Conexion());

            List<Area> areas_completas = repoOrganigrama.GetAreasQueDependientesDe(id_area);
            List<AreaParaDDJJ104> areas = new List<AreaParaDDJJ104>();

            areas_completas.ForEach(a =>
            {
                if (a.Id == 0)
                    return;

                if (a.PresentaDDJJ)
                {
                    var area = new AreaParaDDJJ104();
                    area.Id = a.Id;
                    area.Nombre = a.Nombre;
                    area.Personas.AddRange(repoPersonas.GetPersonasDelAreaParaDDJJ104(mes, anio, a, complementaria).FindAll(x => x.Area.Id == id_area));

                    if (area.Personas != null && area.Personas.Count > 0 && area.Personas[0].Esta_Cargada == 1)
                    {

                        //CARGO LAS AREAS QUE DEPENDEN Y LAS PERSONAS
                        areas_completas.ForEach(area_dependiente =>
                        {
                            if (!area_dependiente.PresentaDDJJ)
                            {
                                var area_informal = new AreaParaDDJJ104();
                                area_informal.Id = area_dependiente.Id;
                                area_informal.Nombre = area_dependiente.Nombre;
                                area_informal.Personas = repoPersonas.GetPersonasDelAreaParaDDJJ104(mes, anio, a, complementaria).FindAll(x => x.Area.Id == area_informal.Id);

                                if (area_informal.Personas.Count > 0)
                                    area.AreasInformalesDependientes.Add(area_informal);
                            }
                        });
                        area.DDJJ = new RepositorioDDJJ104().GetDDJJParaElArea(a, mes, anio).Find(x => x.Mes == mes && x.Anio == anio);

                    }
                    else
                    {

                        //CARGO LAS AREAS QUE DEPENDEN Y LAS PERSONAS
                        areas_completas.ForEach(area_dependiente =>
                        {
                            if (!area_dependiente.PresentaDDJJ)
                            {
                                var area_informal = new AreaParaDDJJ104();
                                area_informal.Id = area_dependiente.Id;
                                area_informal.Nombre = area_dependiente.Nombre;
                                area_informal.Personas = repoPersonas.GetPersonasDelAreaParaDDJJ104(mes, anio, area_dependiente, complementaria).FindAll(x => x.Area.Id == area_informal.Id);

                                if (area_informal.Personas.Count > 0)
                                    area.AreasInformalesDependientes.Add(area_informal);
                            }
                        });
                        area.DDJJ = new RepositorioDDJJ104().GetDDJJParaElArea(a, mes, anio).Find(x => x.Mes == mes && x.Anio == anio);
                    }
                    //var area_superior = un_Organigrama.AreaSuperiorDe(a);
                    //area.AreaSuperior = new AreaParaDDJJ104();
                    //area.AreaSuperior.Id = area_superior.Id;
                    //area.AreaSuperior.Nombre = area_superior.Nombre;
                    //area.Direccion = a.Direccion;


                    areas.Add(area);
                }
                
            });


            return areas;
        }


        public List<DDJJ104_Consulta> GetConsultaIndividualPorPersona(int mesdesde, int aniodesde, int meshasta, int aniohasta, int nrodoc_persona, int estado, int orden, Usuario usuario)
        {
            var repositorio = new RepositorioDDJJ104();
            return repositorio.GetConsultaIndividualPorPersona(mesdesde, aniodesde, meshasta, aniohasta, nrodoc_persona, estado, orden,usuario);
        }

        public List<DDJJ104_Consulta> GetConsultaPorArea(int mesdesde, int aniodesde, int meshasta, int aniohasta, int id_area, int estado, int orden, Usuario usuario)
        {
            var repositorio = new RepositorioDDJJ104();
            return repositorio.GetConsultaPorArea(mesdesde, aniodesde, meshasta, aniohasta, id_area, estado, orden, usuario);
        }


        public List<DDJJ104_Consulta> GetPersonasSinCertificar(int mes, int anio)
        {
            var repositorio = new RepositorioDDJJ104();
            return repositorio.GetPersonasSinCertificar(mes, anio);
        }







        //public bool GenerarDDJJ104(Usuario usuario, List<AreaParaDDJJ104> lista)
        //{
        //    RepositorioDDJJ104 ddjj = new RepositorioDDJJ104();
        //    return ddjj.GenerarDDJJ104(usuario, lista);
        //}

        //public List<AreaParaDDJJ104> ImprimirDDJJ104(List<AreaParaDDJJ104> lista)
        //{
        //    RepositorioDDJJ104 ddjj = new RepositorioDDJJ104();
        //    return ddjj.ImprimirDDJJ104(lista);
        //}

        //public void MarcarDDJJ104Impresa(int nroDDJJ, int estado)
        //{
        //    RepositorioDDJJ104 ddjj = new RepositorioDDJJ104();
        //    ddjj.MarcarDDJJ104Impresa(nroDDJJ, estado);
        //}


       
    }
}
