﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General
{
    /// <summary>
    /// Es un caso particular de creador de "periodos imputables" que devolvera
    ///     más de un período imputable, por cortarse la licencia en 2 partes (en primero de diciembre)
    /// </summary>
    public class CreadorDePeriodosImputablesDivisibles : CreadorDePeriodosImputables
    {
        public override List<CantidadDeDiasPorPeriodo> AnioMaximoImputable(SolicitudesDeVacaciones aprobadas)
        {
            var dias_primer_periodo = (new DateTime(GetAnioimputable(aprobadas.Hasta()), 11, 30) - aprobadas.Desde()).Days + 1;
            var dias_segundo_periodo = (aprobadas.Hasta() - new DateTime(GetAnioimputable(aprobadas.Hasta()), 12, 01)).Days + 1;

            return new List<CantidadDeDiasPorPeriodo>() { new CantidadDeDiasPorPeriodo(GetAnioimputable(aprobadas.Desde()), dias_primer_periodo), new CantidadDeDiasPorPeriodo(GetAnioimputable(aprobadas.Hasta()), dias_segundo_periodo) };
        }
    }
}
