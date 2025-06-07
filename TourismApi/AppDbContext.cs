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
        public DbSet<MejorEpocaVisita> MejorEpocaVisita { get; set; }
        public DbSet<MejorEpocaVisitaDestinoRelation> MejorEpocaVisitaDestinoRelation { get; set; }
        public DbSet<Transporte> Transporte { get; set; }
        public DbSet<TransporteDestinoRelation> TransporteDestinoRelation { get; set; }
        public DbSet<Alojamiento> Alojamiento { get; set; }
        public DbSet<AlojamientoDestinoRelation> AlojamientoDestinoRelation { get; set; }
        public DbSet<DestinoDetalles> DestinoDetalles { get; set; }

     protected override void OnModelCreating(ModelBuilder modelBuilder)
{


    modelBuilder.Entity<DestinoDetalles>()
        .Ignore(d => d.ciudad)
        .Ignore(d => d.provincia);
}

    }
}
