﻿using System;
using System.Collections.Generic;

namespace General
{
    public class CursoDto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Docente Docente { get; set; }
        public Materia Materia { get; set; }
        public List<HorarioDto> Horarios { get; set; }
        public List<Alumno> Alumnos { get; set; } //cambiado por Bel
        public EspacioFisico EspacioFisico { get; set; }
        public string EstadoDelAlumno { get; set; }
        public string FechaInicio { get; set; }
        public string FechaFin { get; set; }
        public string Observaciones { get; set; }
        public bool EnCurso { get; set; }
    }
}
