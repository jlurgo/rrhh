﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General
{
    public class Cabecera
    {
        //datos para ambos recibos
        public int idRecibo { get; set; }
        public int Legajo { get; set; }
        public string Agente { get; set; }
        public string CUIL { get; set; }
        public int Oficina { get; set; }
        public int Orden { get; set; }
        public string Bruto { get; set; }
        public string Neto { get; set; }
        public string Descuentos { get; set; }
        public string NivelGrado { get; set; }// conjuga las propiedades de nivel y grado al mismo tiempo
        public string Area { get; set; }
        public string FechaLiquidacion { get; set; }
        public string OpcionJubilatoria { get; set; }
        public int TipoLiquidacion { get; set; }
        public int Nro_Documento { get; set; }
        public DateTime Fecha_deposito { get; set; }
        public string Nivel { get; set; }
        public string Grado { get; set; }
        public string Afjp { get; set; }
        public int mes { get; set; }
        public int anio { get; set; }

        //TODO:  REVIZAR SI van o no los campos de abajo
        //datos para el recibo del empleador
        public string Domicilio { get; set; }
        public string DescripcionTipoLiquidacionYMas { get; set; }
        //datos para el recibo del empleado
        public DateTime FechaIngreso { get; set; }
        public string CuentaBancaria { get; set; }
        public string Banco { get; set; }

        public Cabecera() { }

        public override string ToString() {
            StringBuilder s = new StringBuilder();
            //agrego la cabecera
            s.Append(this.idRecibo); s.Append("||");
            s.Append(this.Legajo); s.Append("||");
            s.Append(this.Agente); s.Append("||");
            s.Append(this.CUIL); s.Append("||");
            s.Append(this.Oficina); s.Append("||");
            s.Append(this.Orden); s.Append("||");
            s.Append(this.Bruto); s.Append("||");
            s.Append(this.Neto); s.Append("||");
            s.Append(this.Descuentos); s.Append("||");
            s.Append(this.NivelGrado); s.Append("||");
            s.Append(this.Area); s.Append("||");
            s.Append(this.FechaLiquidacion); s.Append("||");
            s.Append(this.TipoLiquidacion); s.Append("||");
            s.Append(this.Nro_Documento); s.Append("||");
            s.Append(this.Fecha_deposito); 
           
            return s.ToString();

        }
        public void reset() {
            idRecibo = 0;
            Legajo = 0;
            Agente = "";
            CUIL = "";
            Oficina = 0;
            Orden = 0;
            Bruto = "";
            Neto = "";
            Descuentos = "";
            NivelGrado = "";
            Area = "";
            FechaLiquidacion = "";
            OpcionJubilatoria = "";
            TipoLiquidacion = 0;
            Nro_Documento = 0;
            Fecha_deposito = new DateTime();
            Domicilio = "";
            DescripcionTipoLiquidacionYMas = "";
            FechaIngreso = new DateTime();
            CuentaBancaria = "";
    }

    }
}
