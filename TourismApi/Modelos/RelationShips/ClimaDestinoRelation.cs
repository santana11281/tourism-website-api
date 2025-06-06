using Microsoft.AspNetCore.Http.HttpResults;

namespace TourismApi.Modelos.RelationShips
{
    public class ClimaDestinoRelation
    {

        public int id { get; set; }
        public int destino_id { get; set; }
        public int clima_id { get; set; }
    }
}
