using System.ComponentModel.DataAnnotations.Schema;

namespace TourismApi.Modelos
{
    [Table("DestinosActivityRelation")]
    public class DestinoActividadRelacion
    {
        public int id { get; set; }
        public int destino_id { get; set; }
        public int activity_id { get; set; }
    }
}