namespace TourismApi.Modelos
{
    public class Comentario
    {
        public int Id { get; set; }
        public int UsuarioId { get; set; }
        public int DestinoId { get; set; }
        public string Texto { get; set; }
        public double Rating { get; set; }
        public DateTime Fecha { get; set; }
        public Destino Destinos { get; set; }
    }
}
