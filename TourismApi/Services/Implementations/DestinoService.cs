using TourismApi.Modelos;
using TourismApi.Services.Interfaces;

namespace TourismApi.Services.Implementations
{
    public class DestinoService : IDestinoService
    {
        private readonly AppDbContext _context;

        public DestinoService(AppDbContext context)
        {
            _context = context;
        }

        public IEnumerable<Destino> GetDestinos()
        {
            return _context.Destinos.ToList();
        }

        public IEnumerable<Activity> GetActivitiesByDestino(int id)
        {
            var relations = _context.DestinoActividadRelacion.ToList();
            var destinos = _context.Destinos.ToList();
            var actividades = _context.Activity.ToList();

            var activities = from r in relations
                             join d in destinos on r.destino_id equals d.id
                             join a in actividades on r.activity_id equals a.id
                             where d.id == id
                             select a;
            return activities.ToList();

        }

    }
}
