namespace TourismApi.Modelos
{
    public class Alojamiento
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string tipo { get; set; }
        public string descripcion { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string email { get; set; }
        public decimal precio { get; set; }
        public decimal rating { get; set; }
    }
}