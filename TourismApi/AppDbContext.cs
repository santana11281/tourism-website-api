using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;

namespace TourismApi
{
    public class AppDbContext : DbContext
    {
        public DbSet<Destino> Destinos { get; set; }
        public DbSet<Comentario> Comentarios { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Galeria> Galeria { get; set; }
        // Agrega los demás DbSet...

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite("Data Source=turismo.db");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configuraciones adicionales como relaciones muchos a muchos, etc.
        }
    }
}
