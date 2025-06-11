namespace TourismApi.Modelos
{
    public class DestinoDetalles
    {
        public int id { get; set; }
        public int destino_id { get; set; }

        public string ciudad { get; set; }
        public string provincia { get; set; }
        public string detalle { get; set; }
        public string descripcion { get; set; }
        public string img_url { get; set; }

    }
}