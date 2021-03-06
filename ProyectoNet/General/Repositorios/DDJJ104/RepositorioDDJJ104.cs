﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using General.Repositorios;
using General.MAU;
using General;

namespace General
{

    public class RepositorioDDJJ104
    {

        public List<DDJJ104_2001> GetDDJJParaElArea(Area area, int mes, int anio)
        {
            SqlDataReader dr;
            ConexionDB cn = new ConexionDB("dbo.PLA_GET_DDJJ_AREA");
            cn.AsignarParametro("@id_area", area.Id);

            dr = cn.EjecutarConsulta();

            List<DDJJ104_2001> listaddjj104 = new List<DDJJ104_2001>();

            while (dr.Read())
            {
                DDJJ104_2001 ddjj104 = new DDJJ104_2001();
                ddjj104.Id = dr.GetInt32(dr.GetOrdinal("Id_DDJJ"));
                ddjj104.Mes = dr.GetInt16(dr.GetOrdinal("Mes"));
                ddjj104.Anio = dr.GetInt16(dr.GetOrdinal("Año"));
                ddjj104.Estado = dr.GetInt16(dr.GetOrdinal("Estado"));
                ddjj104.FechaGeneracion = dr.GetDateTime(dr.GetOrdinal("Fecha_Generacion"));
                ddjj104.Complementaria = dr.GetInt16(dr.GetOrdinal("Complementaria"));
                listaddjj104.Add(ddjj104);
            }

            cn.Desconestar();

            var ddjj = listaddjj104.FindAll(x => x.Mes == mes && x.Anio == anio);

            return ddjj;
        }


        //public int GetEstadoDDJJ(AreaParaDDJJ104 ddjj)
        //{
        //    SqlDataReader dr;
        //    ConexionDB cn = new ConexionDB("dbo.PLA_GET_DDJJ104");
        //    cn.AsignarParametro("@Id_Area", ddjj.Area.Id);
        //    cn.AsignarParametro("@Mes", ddjj.Mes);
        //    cn.AsignarParametro("@Año", ddjj.Anio);

        //    dr = cn.EjecutarConsulta();

        //    int estado = 1;

        //    if (dr.Read())
        //    {
        //        estado = dr.GetInt16(dr.GetOrdinal("Estado"));
        //    }

        //    cn.Desconestar();

        //    return estado;
        //}


        public DDJJ104_2001 GenerarDDJJ104(Usuario usuario, AreaParaDDJJ104 area, int mes, int anio, Persona[] lista_persona, int estado_guardado, int complementaria)
        {
            ConexionDB cn = new ConexionDB("dbo.PLA_ADD_DDJJ104_Cabecera");
            cn.AsignarParametro("@Id_Area", area.Id);
            cn.AsignarParametro("@Mes", mes);
            cn.AsignarParametro("@Año", anio);
            cn.AsignarParametro("@Usuario_Generacion", usuario.Id);
            cn.AsignarParametro("@Estado", estado_guardado);
            cn.AsignarParametro("@Complementaria", complementaria);


            //INICIO TRANSACCION
            cn.BeginTransaction();

            int id_ddjj_nuevo = 0;
            try
            {
                id_ddjj_nuevo = (int)cn.EjecutarEscalar();

                if (id_ddjj_nuevo > 0)
                {
                    int orden = 1;
                    //foreach (var personas in new RepositorioPersonas().GetPersonasDelAreaParaDDJJ104(mes, anio, area )) //new Area(id_area)
                    foreach (var personas in area.Personas)
                    {
                        string[] Cat_Mod = personas.Categoria.ToString().Split('#');
                        Persona persona_lista = lista_persona.FirstOrDefault(x => x.Id == personas.Id);

                        cn.CrearComandoConTransaccionIniciada("dbo.PLA_ADD_DDJJ104_Detalle");
                        cn.AsignarParametro("@Id_DDJJ", id_ddjj_nuevo);
                        cn.AsignarParametro("@Id_Persona", personas.Id);
                        cn.AsignarParametro("@Orden", orden);
                        cn.AsignarParametro("@Id_Area_Persona", personas.Area.Id);
                        cn.AsignarParametro("@Mod_Contratacion", Cat_Mod[1].Trim());
                        cn.AsignarParametro("@Categoria", Cat_Mod[0].Trim());

                        cn.AsignarParametro("@Certificado", (persona_lista.EstaCertificadoEnLaDDJJ == true ? "S" : "N"));
                        cn.AsignarParametro("@Hora_Desde", persona_lista.CertificaHoraDesdeDDJJ);
                        cn.AsignarParametro("@Hora_Hasta", persona_lista.CertificaHoraHastaDDJJ);
                        cn.AsignarParametro("@Usuario_Generacion", usuario.Id);
                        cn.AsignarParametro("@Tipo_DDJJ", 1);

                        cn.EjecutarSinResultado();

                        orden++;
                    }


                    foreach (var areasDependiente in area.AreasInformalesDependientes)
                    {
                        foreach (var personas in areasDependiente.Personas)
                        {
                            string[] Cat_Mod = personas.Categoria.ToString().Split('#');
                            Persona persona_lista = lista_persona.FirstOrDefault(x => x.Id == personas.Id);

                            cn.CrearComandoConTransaccionIniciada("dbo.PLA_ADD_DDJJ104_Detalle");
                            cn.AsignarParametro("@Id_DDJJ", id_ddjj_nuevo);
                            cn.AsignarParametro("@Id_Persona", personas.Id);
                            cn.AsignarParametro("@Orden", orden);
                            cn.AsignarParametro("@Id_Area_Persona", personas.Area.Id);
                            cn.AsignarParametro("@Mod_Contratacion", Cat_Mod[1].Trim());
                            cn.AsignarParametro("@Categoria", Cat_Mod[0].Trim());

                            cn.AsignarParametro("@Certificado", (persona_lista.EstaCertificadoEnLaDDJJ == true ? "S" : "N"));
                            cn.AsignarParametro("@Hora_Desde", persona_lista.CertificaHoraDesdeDDJJ);
                            cn.AsignarParametro("@Hora_Hasta", persona_lista.CertificaHoraHastaDDJJ);
                            cn.AsignarParametro("@Usuario_Generacion", usuario.Id);
                            cn.AsignarParametro("@Tipo_DDJJ", 1);

                            cn.EjecutarSinResultado();

                            orden++;
                        }
                    }


                }

            }
            catch (Exception e)
            {
                cn.RollbackTransaction();
                throw;
            }

            cn.CommitTransaction();
            cn.Desconestar();

            var ddjj = new DDJJ104_2001();
            ddjj.Anio = anio;
            ddjj.Mes = mes;
            ddjj.Id = id_ddjj_nuevo;
            ddjj.FechaGeneracion = DateTime.Now;
            return ddjj;

        }

        //public List<AreaParaDDJJ104> ImprimirDDJJ104(Usuario usuario, int id_area, int mes, int anio)
        //{
        //    SqlDataReader dr;
        //    ConexionDB cn = new ConexionDB("dbo.PLA_GET_DDJJ104");
        //    cn.AsignarParametro("@Id_Area", id_area);
        //    cn.AsignarParametro("@Mes", mes);
        //    cn.AsignarParametro("@Año", anio);

        //    dr = cn.EjecutarConsulta();

        //    AreaParaDDJJ104 ddjj104 = new AreaParaDDJJ104();

        //    List<AreaParaDDJJ104> listaddjj104 = new List<AreaParaDDJJ104>();

        //    while (dr.Read())
        //    {

        //        ddjj104 = new AreaParaDDJJ104()
        //        {
        //            Id = dr.GetInt32(dr.GetOrdinal("Id_Area")),
        //            Nombre = dr.GetString(dr.GetOrdinal("Area")),
        //            //Direccion = dr.GetString(dr.GetOrdinal("Direccion")),
        //            //Dependencias = new List<Area>() { new Area() { Nombre = dr.GetString(dr.GetOrdinal("Dependencia")) } }
        //        };

        //        ddjj104.Personas = new List<Persona>();


        //        //ddjj104.Agente = new Persona()
        //        //{
        //        //    Apellido = dr.GetString(dr.GetOrdinal("Apellido")),
        //        //    Nombre = dr.GetString(dr.GetOrdinal("Nombre")),
        //        //    Cuit = dr.GetString(dr.GetOrdinal("Cuil_Nro")),
        //        //    Categoria = dr.GetString(dr.GetOrdinal("Categoria")) + '#' + dr.GetString(dr.GetOrdinal("Mod_Contratacion"))
        //        //};
        //        ddjj104.Mes = dr.GetInt16(dr.GetOrdinal("Mes"));
        //        ddjj104.Anio = dr.GetInt16(dr.GetOrdinal("Año"));
        //        ddjj104.LeyendaPorAnio = dr.GetString(dr.GetOrdinal("Leyenda"));
        //        ddjj104.IdDDJJ = dr.GetInt32(dr.GetOrdinal("Id_DDJJ"));

        //        listaddjj104.Add(ddjj104);
        //    }

        //    cn.Desconestar();

        //    return listaddjj104;
        //}


        //public void MarcarDDJJ104Impresa(int nroDDJJ, int estado)
        //{
        //    SqlDataReader dr;
        //    ConexionDB cn = new ConexionDB("dbo.PLA_UPD_DDJJ104_Cabecera");
        //    cn.AsignarParametro("@id_ddjj", nroDDJJ);
        //    cn.AsignarParametro("@id_estado", estado);

        //    dr = cn.EjecutarConsulta();

        //    cn.Desconestar();
        //}


        public List<DDJJ104_2001> GetMesesGenerados()
        {
            SqlDataReader dr;
            ConexionDB cn = new ConexionDB("dbo.PLA_GET_Meses_Generados");
            //cn.AsignarParametro("@Usuario_Generacion", ddjj.Agente.Id);
            //cn.AsignarParametro("@Mes", ddjj.Mes);
            //cn.AsignarParametro("@Año", ddjj.Anio);

            dr = cn.EjecutarConsulta();

            DDJJ104_2001 ddjj104;
            List<DDJJ104_2001> listaddjj104 = new List<DDJJ104_2001>();

            while (dr.Read())
            {
                ddjj104 = new DDJJ104_2001();
                ddjj104.Mes = dr.GetInt16(dr.GetOrdinal("Mes"));
                ddjj104.Anio = dr.GetInt16(dr.GetOrdinal("Año"));
                //ddjj104.IdDDJJ = dr.GetInt32(dr.GetOrdinal("Id_DDJJ"));

                listaddjj104.Add(ddjj104);
            }

            cn.Desconestar();

            return listaddjj104;
        }




        internal List<DDJJ104_Consulta> GetConsultaIndividualPorPersona(int mesdesde, int aniodesde, int meshasta, int aniohasta, int nrodoc_persona, int estado, int orden, Usuario usuario)
        {
            SqlDataReader dr;
            ConexionDB cn = new ConexionDB("dbo.PLA_GET_DDJJ104_PorPersona");
            cn.AsignarParametro("@mesDesde", mesdesde);
            cn.AsignarParametro("@anioDesde", aniodesde);
            cn.AsignarParametro("@mesHasta", meshasta);
            cn.AsignarParametro("@anioHasta", aniohasta);
            cn.AsignarParametro("@persona", nrodoc_persona);
            cn.AsignarParametro("@estado", estado);
            cn.AsignarParametro("@orden", orden);

            dr = cn.EjecutarConsulta();

            List<DDJJ104_Consulta> listaddjj104 = new List<DDJJ104_Consulta>();

            while (dr.Read())
            {
                DDJJ104_Consulta ddjj104 = new DDJJ104_Consulta();
                ddjj104.id = dr.GetInt32(dr.GetOrdinal("Id_DDJJ"));
                ddjj104.mes = dr.GetInt32(dr.GetOrdinal("Mes"));
                ddjj104.anio = dr.GetInt32(dr.GetOrdinal("Año"));
                ddjj104.area_generacion = new Area();
                ddjj104.area_generacion.Id = dr.GetInt32(dr.GetOrdinal("Id_Area"));
                ddjj104.area_generacion.Nombre = dr.GetString(dr.GetOrdinal("Area")).ToString();
                ddjj104.fecha_generacion = dr.GetString(dr.GetOrdinal("Fecha_Generacion")).ToString();
                ddjj104.usuario_generacion = dr.GetString(dr.GetOrdinal("Usuario_Generacion")).ToString();
                ddjj104.recepcionada = dr.GetBoolean(dr.GetOrdinal("Recepcionada"));
                ddjj104.fecha_recibido = dr.GetString(dr.GetOrdinal("Fecha_Recibido")).ToString();
                ddjj104.usuario_recibido = dr.GetString(dr.GetOrdinal("Usuario_Recibido")).ToString();
                ddjj104.firmante = dr.GetString(dr.GetOrdinal("Firmante")).ToString();
                ddjj104.persona = new Persona();
                ddjj104.persona.Id = dr.GetInt32(dr.GetOrdinal("Id_Persona"));
                ddjj104.persona.Apellido = dr.GetString(dr.GetOrdinal("Apellido")).ToString();
                ddjj104.persona.Nombre = dr.GetString(dr.GetOrdinal("Nombre")).ToString();
                ddjj104.persona.Categoria = dr.GetString(dr.GetOrdinal("Categoria")).ToString();
                ddjj104.mod_contratacion = dr.GetString(dr.GetOrdinal("Mod_Contratacion")).ToString();
                ddjj104.estado = dr.GetInt16(dr.GetOrdinal("Estado"));
                ddjj104.estado_descrip = dr.GetString(dr.GetOrdinal("Estado_Descrip")).ToString();

                listaddjj104.Add(ddjj104);
            }

            cn.Desconestar();

            return listaddjj104;
        }


        internal List<DDJJ104_Consulta> GetConsultaPorArea(int mesdesde, int aniodesde, int meshasta, int aniohasta, int id_area, int estado, int orden, Usuario usuario)
        {
            SqlDataReader dr;
            ConexionDB cn = new ConexionDB("dbo.PLA_GET_DDJJ104_PorArea");
            cn.AsignarParametro("@mesDesde", mesdesde);
            cn.AsignarParametro("@anioDesde", aniodesde);
            cn.AsignarParametro("@mesHasta", meshasta);
            cn.AsignarParametro("@anioHasta", aniohasta);
            cn.AsignarParametro("@area", id_area);
            cn.AsignarParametro("@estado", estado);
            cn.AsignarParametro("@orden", orden);

            dr = cn.EjecutarConsulta();

            List<DDJJ104_Consulta> listaddjj104 = new List<DDJJ104_Consulta>();

            while (dr.Read())
            {
                DDJJ104_Consulta ddjj104 = new DDJJ104_Consulta();
                //ddjj104.id = dr.GetInt32(dr.GetOrdinal("Id_DDJJ"));
                ddjj104.mes = dr.GetInt32(dr.GetOrdinal("Mes"));
                ddjj104.anio = dr.GetInt32(dr.GetOrdinal("Año"));
                ddjj104.area_generacion = new Area();
                ddjj104.area_generacion.Id = dr.GetInt32(dr.GetOrdinal("Id_Area"));
                ddjj104.area_generacion.Nombre = dr.GetString(dr.GetOrdinal("Area")).ToString();
                ddjj104.fecha_generacion = dr.GetString(dr.GetOrdinal("Fecha_Generacion")).ToString();
                ddjj104.usuario_generacion = dr.GetString(dr.GetOrdinal("Usuario_Generacion")).ToString();
                ddjj104.recepcionada = dr.GetBoolean(dr.GetOrdinal("Recepcionada"));
                ddjj104.fecha_recibido = dr.GetString(dr.GetOrdinal("Fecha_Recibido")).ToString();
                ddjj104.usuario_recibido = dr.GetString(dr.GetOrdinal("Usuario_Recibido")).ToString();
                ddjj104.firmante = dr.GetString(dr.GetOrdinal("Firmante")).ToString();
                //ddjj104.persona = new Persona();
                //ddjj104.persona.Id = dr.GetInt32(dr.GetOrdinal("Id_Persona"));
                //ddjj104.persona.Apellido = dr.GetString(dr.GetOrdinal("Apellido")).ToString();
                //ddjj104.persona.Nombre = dr.GetString(dr.GetOrdinal("Nombre")).ToString();
                //ddjj104.persona.Categoria = dr.GetString(dr.GetOrdinal("Categoria")).ToString();
                //ddjj104.mod_contratacion = dr.GetString(dr.GetOrdinal("Mod_Contratacion")).ToString();
                ddjj104.estado = dr.GetInt16(dr.GetOrdinal("Estado"));
                ddjj104.estado_descrip = dr.GetString(dr.GetOrdinal("Estado_Descrip")).ToString();

                listaddjj104.Add(ddjj104);
            }

            cn.Desconestar();

            return listaddjj104;
        }



        public List<DDJJ104_Consulta> GetPersonasSinCertificar(int mes, int anio)
        {
            SqlDataReader dr;
            ConexionDB cn = new ConexionDB("dbo.PLA_GET_Persona_No_Certificadas_DDJJ104");
            cn.AsignarParametro("@mes", mes);
            cn.AsignarParametro("@año", anio);

            dr = cn.EjecutarConsulta();

            DDJJ104_Consulta ddjj104;
            List<DDJJ104_Consulta> lista = new List<DDJJ104_Consulta>();

            while (dr.Read())
            {
                ddjj104 = new DDJJ104_Consulta();
                ddjj104.mes = dr.GetInt16(dr.GetOrdinal("Mes"));
                ddjj104.anio = dr.GetInt16(dr.GetOrdinal("Año"));

                ddjj104.persona = new Persona();
                ddjj104.persona.Id = dr.GetInt32(dr.GetOrdinal("Id_Persona"));
                ddjj104.persona.Documento = dr.GetInt32(dr.GetOrdinal("NroDocumento"));
                ddjj104.persona.Apellido = dr.GetString(dr.GetOrdinal("Apellido")).ToString();
                ddjj104.persona.Nombre = dr.GetString(dr.GetOrdinal("Nombre")).ToString();
                ddjj104.persona.EstaCertificadoEnLaDDJJ = false;

                //AREA QUE NO CERTIFICO EN LA DDJJ104
                ddjj104.area_generacion = new Area();
                ddjj104.area_generacion.Id = dr.GetInt32(dr.GetOrdinal("id"));
                ddjj104.area_generacion.Nombre = dr.GetString(dr.GetOrdinal("descripcion")).ToString();
                ddjj104.persona.MotivoNoCertificar = dr.GetString(dr.GetOrdinal("Motivo")).ToString();
                ddjj104.persona.CCONoCertificar = dr.GetString(dr.GetOrdinal("CCO")).ToString();
                //AREA QUE CERTIFICA A LOS NO CERTIFICADOS
                ddjj104.persona.Area = new Area();
                ddjj104.persona.Area.Id = dr.GetInt32(dr.GetOrdinal("Id_Area_Certifica"));
                ddjj104.persona.Area.Nombre = dr.GetString(dr.GetOrdinal("Area_Certifica")).ToString();

                lista.Add(ddjj104);
            }

            cn.Desconestar();

            return lista;

        }



        public void GenerarMotivoEnPersonasNoCertificadas(int mes, int anio, DDJJ104_Consulta[] lista_DDJJ104, Usuario usuario)
        {

            ConexionDB cn = new ConexionDB("dbo.PLA_ADD_DDJJ104_Personas_No_Certificadas");

            //INICIO TRANSACCION
            cn.BeginTransaction();

            try
            {

                foreach (var DDJJ104 in lista_DDJJ104)
                {
                    if (DDJJ104.persona.MotivoNoCertificar != "" || DDJJ104.persona.CCONoCertificar != "")
                    {
                        cn.AsignarParametro("@Id_Persona", DDJJ104.persona.Id);
                        cn.AsignarParametro("@Mes", mes);
                        cn.AsignarParametro("@Año", anio);
                        cn.AsignarParametro("@Motivo", DDJJ104.persona.MotivoNoCertificar);
                        cn.AsignarParametro("@CCO", DDJJ104.persona.CCONoCertificar);
                        cn.AsignarParametro("@Usuario_Motivo", usuario.Id);

                        cn.EjecutarSinResultado();
                    }

                }
            }
            catch (Exception e)
            {
                cn.RollbackTransaction();
                throw;
            }

            cn.CommitTransaction();
            cn.Desconestar();

        }


        public void AsignaAreaAPersonasNoCertificadas(int mes, int anio, DDJJ104_Consulta[] lista_DDJJ104, int id_area, Usuario usuario)
        {

            ConexionDB cn = new ConexionDB("dbo.PLA_ADD_DDJJ104_Personas_No_Certificadas_Asig_Area");

            //INICIO TRANSACCION
            cn.BeginTransaction();

            try
            {

                foreach (var DDJJ104 in lista_DDJJ104)
                {

                    cn.AsignarParametro("@Id_Persona", DDJJ104.persona.Id);
                    cn.AsignarParametro("@Mes", mes);
                    cn.AsignarParametro("@Año", anio);
                    cn.AsignarParametro("@Id_Area_Certifica", id_area);
                    cn.AsignarParametro("@Usuario_Certifica", usuario.Id);

                    cn.EjecutarSinResultado();
                }
            }
            catch (Exception e)
            {
                cn.RollbackTransaction();
                throw;
            }

            cn.CommitTransaction();
            cn.Desconestar();

        }


    }

}
