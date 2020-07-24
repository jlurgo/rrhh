using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General.PotenciarTrabajo
{
    public class PT_Entidad
    {
        public int Id_Entidad { get; set; }
        public string Nombre_Entidad { get; set; }
        public int Mes { get; set; }
        public int Anio { get; set; }
        public int? Id_Informe { get; set; }
        public string Estado { get; set; }
        
    }
}
