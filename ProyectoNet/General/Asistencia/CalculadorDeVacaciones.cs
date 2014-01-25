﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.Repositorios;
using General;

namespace General
{
    public class CalculadorDeVacaciones
    {
        protected IRepositorioLicencia _repositorio_licencia;
        //private int IdConceptoVacaciones = 1;

        public CalculadorDeVacaciones(IRepositorioLicencia repo_licencia)
        {
            this._repositorio_licencia = repo_licencia;
        }

        public List<VacacionesPermitidas> GetVacacionesPermitidas() 
        {
            return _repositorio_licencia.GetVacacionesPermitidas();
        }

        //public List<VacacionesPermitidas> ObtenerLicenciasPermitidasPara(Persona persona)
        //{

        //    //List<VacacionesPermitidas> vacaciones_permitidas_gral = GetVacacionesPermitidas();

        //    _repositorio_licencia.GetVacacionPermitidaPara(

        //    List<VacacionesPermitidas> vacaciones_permitidas_particular = vacaciones_permitidas_gral.FindAll(v => v.Persona.Equals(persona) && v.Concepto.Equals(this.IdConceptoVacaciones));

        //    return vacaciones_permitidas_particular;
 
        //}

        public List<VacacionesPermitidas> ObtenerLicenciasPermitidasPara(Persona persona, Periodo periodo, Licencia licencia)
        {
            return _repositorio_licencia.GetVacacionPermitidaPara(persona, periodo, licencia);// ObtenerLicenciasPermitidasPara(persona);

            //return vacaciones_permitidas.Find(v => v.Periodo.anio.Equals(periodo.anio) && v.Concepto.Equals(this.IdConceptoVacaciones));
        }

        public List<VacacionesAprobadas> ObtenerLicenciasAprobadasPara(Persona persona, Periodo periodo, Licencia licencia)
        {
            return _repositorio_licencia.GetVacacionesAprobadasPara(persona, periodo, licencia);
        }

        public int CalcularTotalPermitido(List<VacacionesPermitidas> lista)
        {

            int total = 0;
            var vacaciones = lista.FindAll(licencias => licencias.Concepto.Equals(CodigosDeLicencias.Vacaciones));

            return vacaciones.Select(v => v.CantidadDeDias()).Sum();
        }

        public List<VacacionesPermitidas> ObtenerLicenciasPermitidasPara(Persona persona)
        {
            ConceptoDeLicencia concepto = new ConceptoDeLicencia();
            concepto.Id = CodigosDeLicencias.Vacaciones;
            Licencia licencia_por_vacaciones = new Licencia();
            licencia_por_vacaciones.Concepto = concepto;
            return _repositorio_licencia.GetVacacionPermitidaPara(persona, licencia_por_vacaciones);// ObtenerLicenciasPermitidasPara(persona);
        }

        public object DiasRestantes(VacacionesPermitidas permitidas, VacacionesAprobadas aprobadas, VacacionesPendientesDeAprobacion pendientes_de_aprobar)
        {
            return permitidas.CantidadDeDias() - aprobadas.CantidadDeDias() - pendientes_de_aprobar.CantidadDeDias();
        }

        public object DiasRestantes(List<VacacionesPermitidas> permitidas, List<VacacionesAprobadas> aprobadas, List<VacacionesPendientesDeAprobacion> pendientes)
        {
            return permitidas.Select(permit => permit.CantidadDeDias()).Sum() - aprobadas.Select(aprob => aprob.CantidadDeDias()).Sum() - pendientes.Select(pend => pend.CantidadDeDias()).Sum();
        }

        public List<VacacionesSolicitables> DiasSolicitables(List<VacacionesPermitidas> permitidas, List<VacacionesAprobadas> aprobadas, List<VacacionesPendientesDeAprobacion> pendientes_de_aprobar)
        {
            var vacaciones_solicitables = new List<VacacionesSolicitables>();
                        
            var vacas_aprob = aprobadas.Select(aprob => aprob.CantidadDeDias()).Sum();
            var vacas_pend = pendientes_de_aprobar.Select(pend => pend.CantidadDeDias()).Sum();

            permitidas.ForEach(
                (permit) =>
                {

                    var vacas_a_restar = permit.CantidadDeDias() - vacas_aprob - vacas_pend;
                    var dias_vigentes_para_el_perido = permit.CantidadDeDias() - vacas_aprob - vacas_pend;
                    if (vacas_a_restar < 0)
                    {
                        vacas_a_restar = permit.CantidadDeDias();
                        dias_vigentes_para_el_perido = 0;
                    } else { 
                        vacas_a_restar = vacas_aprob; 
                    };

                    vacaciones_solicitables.Add(new VacacionesSolicitables(permit.Periodo, dias_vigentes_para_el_perido));
                    
                    vacas_aprob -= vacas_a_restar;
                    if (vacas_aprob < 0) vacas_aprob = 0;
                }
                );

            return vacaciones_solicitables;
        }

        public List<VacacionesPermitidas> DiasPerdidos(List<VacacionesPermitidas> vacaciones_permitidas, List<VacacionesAprobadas> vacaciones_aprobadas, List<VacacionesPendientesDeAprobacion> vacaciones_pendientes_de_aprobacion)
        {
            List<VacacionesPermitidas> licencias_perdidas = new List<VacacionesPermitidas>();

            var licencias_solicitadas = ObtenerLicenciasSolicitadas(vacaciones_aprobadas, vacaciones_pendientes_de_aprobacion);
            var licencias_permitidas = vacaciones_permitidas;
            //ME FALTA ORDENARLAS

            var primer_licencia_solicitada = licencias_solicitadas.First();
            var primer_licencia_permitida = licencias_permitidas.First();

            if ((primer_licencia_permitida.Periodo - primer_licencia_solicitada.Periodo()) < 0 )
            {
                var prorroga_del_primer_usufructo = licencias_permitidas.Find(lic_permitida => lic_permitida.Periodo == primer_licencia_solicitada.Periodo()).Prorroga;
                var anio_vigente = primer_licencia_solicitada.Periodo() - prorroga_del_primer_usufructo;

                licencias_perdidas = licencias_permitidas.FindAll(lic_permitida => lic_permitida.Periodo < anio_vigente);

            }


            return licencias_perdidas;
        }

        private List<CantidadDeDiasPorPeriodo> ObtenerLicenciasSolicitadas(List<VacacionesAprobadas> vacaciones_aprobadas, List<VacacionesPendientesDeAprobacion> vacaciones_pendientes_de_aprobacion)
        {
            List<CantidadDeDiasPorPeriodo> licencias_solicitadas = new List<CantidadDeDiasPorPeriodo>();

            foreach (var aprobada in vacaciones_aprobadas)
            {
                licencias_solicitadas.AddRange(aprobada.AnioMaximoImputable());
            }

            //HARÍA EXACTAMENTE LO MISMO QUE LAS APROBADAS
            //foreach (var pendientes_de_aprobar in vacaciones_pendientes_de_aprobacion)
            //{
            //    licencias_solicitadas.AddRange(pendientes_de_aprobar.AnioMaximoImputable());
            //}

            return licencias_solicitadas;
        }
    }
}
