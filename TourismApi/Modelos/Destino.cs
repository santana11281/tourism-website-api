namespace TourismApi.Modelos
{
    public class Destino
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Galeria> Galeria { get; set; }
        public ICollection<Comentario> Comentarios { get; set; } // Add this property to fix the error
    }
}
