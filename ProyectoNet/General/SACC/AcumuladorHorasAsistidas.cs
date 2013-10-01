﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General
{
    public abstract class Acumulador
    {
        public int Id { get; set; }
        public string Valor { get; set; }
        public DateTime Fecha { get; set; }
        public int IdCurso { get; set; }
        public int IdAlumno { get; set; }
        protected int horas_maximas;
        
        public abstract int HorasNoAsistidas();
        public abstract int HorasAsistidas();
        public abstract int AcumularHorasNoAsistidas(int valor_acumulado);
        public abstract int AcumularHorasAsistidas(int valor_acumulado);

    }
    public class AcumuladorHorasDiaCursado:Acumulador
    {
        protected int valor;
        private DateTime fecha;
        private int id_alumno;
        private int id_curso;

        public AcumuladorHorasDiaCursado(string valor, int horas_maximas)
        {
            this.Valor = valor;
            this.horas_maximas = horas_maximas;
        }

        public AcumuladorHorasDiaCursado(int id, string valor, int horas_maximas, DateTime fecha, int id_alumno, int id_curso)
        {
            this.Valor = valor;
            this.valor = int.Parse(valor);
            this.horas_maximas = horas_maximas;
            this.Fecha = fecha;
            this.IdAlumno = id_alumno;
            this.IdCurso = id_curso;
            this.Id = id;
        }
        public override int HorasNoAsistidas()
        {
            return this.horas_maximas - this.valor;
        }

        public override int AcumularHorasNoAsistidas(int valor_acumulado)
        {
            return valor_acumulado + this.HorasNoAsistidas();
        }

        public override int HorasAsistidas()
        {
            return int.Parse(this.Valor);
        }

        public override int AcumularHorasAsistidas(int valor_acumulado)
        {
            return valor_acumulado + this.HorasAsistidas();
        }
    }
    public class AcumuladorHorasDiaNoCursado : Acumulador
    {
        protected string valor;
        protected DateTime fecha;
        protected int id_alumno;
        protected int id_curso;

        public AcumuladorHorasDiaNoCursado(string valor, int horas_maximas)
        {
            this.valor = valor;
        }

        public AcumuladorHorasDiaNoCursado(int id, string valor, int horas_maximas, DateTime fecha, int id_alumno, int id_curso)
        {
            this.Valor = valor;
            this.horas_maximas = horas_maximas;
            this.Fecha = fecha;
            this.IdAlumno = id_alumno;
            this.IdCurso = id_curso;
            this.Id = id;
        }

        public override int HorasNoAsistidas()
        {
            return 0;
        }

        public override int HorasAsistidas()
        {
            return 0;
        }

        public override int AcumularHorasNoAsistidas(int valor_acumulado)
        {
            return valor_acumulado;
        }

        public override int AcumularHorasAsistidas(int valor_acumulado)
        {
            return valor_acumulado;
        }
    }
}
