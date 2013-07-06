﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General
{
    public class InstanciaDeEvaluacion
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }

        public InstanciaDeEvaluacion()
        { }

        public InstanciaDeEvaluacion(int id, string descripcion)
        {
            this.Id= id;
            this.Descripcion = descripcion;
        }
    }
}
