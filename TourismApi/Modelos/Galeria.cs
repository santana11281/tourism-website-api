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

    public class GaleriaCategorias
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
    }

    public class GaleriaImagenes
    {
        public int Id { get; set; }
        public int DestinoId { get; set; }
        public int CategoriaId { get; set; }
        public string Url { get; set; }
        public string Descripcion { get; set; }

        public Destino Destino { get; set; }
        public GaleriaCategorias Categoria { get; set; }
    }
}
