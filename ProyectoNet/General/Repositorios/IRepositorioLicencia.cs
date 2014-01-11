﻿using System;
namespace General.Repositorios
{
    public interface IRepositorioLicencia
    {
        General.SaldoLicencia CargarSaldoLicenciaGeneralDe(General.ConceptoDeLicencia concepto, General.Persona unaPersona);
        General.SaldoLicencia CargarSaldoLicenciaOrdinariaDe(General.ConceptoDeLicencia concepto, General.ProrrogaLicenciaOrdinaria prorroga, General.Persona unaPersona);
        IConexionBD conexion_bd { get; set; }
        bool GetLicenciasQueSePisanCon(General.Licencia unaLicencia);
        bool GetSolicitudesQueSePisanCon(General.Licencia unaLicencia);
        string Guardar(General.Licencia unaLicencia);
        System.Collections.Generic.List<General.VacacionesPermitidas> GetVacacionesPermitidas( System.Collections.Generic.List<General.Persona> personas, System.Collections.Generic.List<General.Periodo> periodos );

    }
}
