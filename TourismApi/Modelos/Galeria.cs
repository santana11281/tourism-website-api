namespace TourismApi.Modelos
{
    public class Galeria
    {
        public int Id { get; set; }
        public int DestinoId { get; set; }
        public string ImagenUrl { get; set; }
        public string Descripcion { get; set; }

        public Destino Destino { get; set; }
    }

}
