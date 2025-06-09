namespace TourismApi.Modelos
{
    public class Ruta
    {
        public int id { get; set; }
        public string origen { get; set; }
        public string destino { get; set; }
        public int distancia_km { get; set; }
        public string duracion { get; set; }
    }

    public class RutaParada
    {
        public int id { get; set; }
        public int ruta_id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string tiempo { get; set; }
        public string icono { get; set; }
    }

    public class TransporteOpcion
    {
        public int id { get; set; }
        public int ruta_id { get; set; }
        public string tipo { get; set; }
        public string duracion { get; set; }
        public decimal precio_min { get; set; }
        public decimal precio_max { get; set; }
        public string icono { get; set; }
    }

    public class TipsViaje
    {
        public int id { get; set; }
        public int ruta_id { get; set; }
        public string texto { get; set; }
    }

    public class RutasDestinoRelation
    {
        public int id { get; set; }
        public int ruta_id { get; set; }
        public int destino_id { get; set; }
    }
}
