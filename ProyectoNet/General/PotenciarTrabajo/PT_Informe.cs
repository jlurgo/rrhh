using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General.PotenciarTrabajo
{
    public class PT_Informe
    {       
        public PT_Entidad Entidad { get; set; }
        public PT_Personas Persona { get; set; }
        public PT_Participacion Participacion { get; set; }
        public int Ent_SinCarga { get; set; }
        public int Ent_EnProceso { get; set; }
        public int Ent_ConInforme { get; set; }
        public int Partic_SinCarga { get; set; }
        public int Partic_EnProceso { get; set; }
        public int Partic_ConInforme { get; set; }
        public int Cant_Personas { get; set; }
        
    }
}
