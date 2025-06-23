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
        public DbSet<Ruta> Rutas { get; set; }
        public DbSet<RutaParada> RutaParadas { get; set; }
        public DbSet<TransporteOpcion> TransporteOpciones { get; set; }
        public DbSet<TipsViaje> TipsViaje { get; set; }
        public DbSet<RutasDestinoRelation> RutasDestinoRelation { get; set; }
        public DbSet<GaleriaCategorias> GaleriaCategorias { get; set; }
        public DbSet<GaleriaImagenes> GaleriaImagenes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DestinoDetalles>()
                .Ignore(d => d.ciudad)
                .Ignore(d => d.provincia);

            modelBuilder.Entity<GaleriaImagenes>()
                .Property(g => g.CategoriaId)
                .HasColumnName("categoria_id");

            //destino_id
            modelBuilder.Entity<GaleriaImagenes>()
                .Property(g => g.DestinoId)
                .HasColumnName("destino_id");
        }

    }
}
