using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace TourismApi.Modelos
{
    // table name valoraciones
    [Table("valoraciones")]
    public class Valoracion
    {
        public int Id { get; set; }
        [Column("destino_id")]
        public int DestinoId { get; set; }
        public string Usuario { get; set; }
        [Column("fecha_visita")]
        public DateTime FechaVisita { get; set; }
        [Column("rating_general")]
        public int RatingGeneral { get; set; }
        public string Comentario { get; set; }
        [JsonIgnore]
        public Destino? Destino { get; set; } // Nullable
        public ICollection<ValoracionCategoria> Categorias { get; set; }
    }
    // table name ValoracionCategorias
    [Table("valoracioncategorias")]
    public class ValoracionCategoria
    {
        public int Id { get; set; }
        [Column("valoracion_id")]
        public int ValoracionId { get; set; }
        public string Categoria { get; set; }
        public int Rating { get; set; }
        [JsonIgnore]
        [ValidateNever]
        public Valoracion? Valoracion { get; set; } // Nullable
    }
}
