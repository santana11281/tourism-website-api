using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;
using TourismApi.Modelos.RelationShips;

namespace TourismApi
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Destino> Destinos { get; set; }
        public DbSet<Activity> Activity { get; set; }
        public DbSet<Clima> Clima { get; set; }
        public DbSet<DestinoActividadRelacion> DestinoActividadRelacion { get; set; }
        public DbSet<ClimaDestinoRelation> ClimaDestinoRelation { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

        }

    }
}
