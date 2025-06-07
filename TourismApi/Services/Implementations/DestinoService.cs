using TourismApi.Modelos;
using TourismApi.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

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

        public Clima GetClimaByDestino(int id)
        {
            var clima = _context.Clima.ToList();
            var destinos = _context.Destinos.ToList();
            var relations = _context.ClimaDestinoRelation.ToList();

            return clima.FirstOrDefault(c => relations.Any(r => r.clima_id == c.id && r.destino_id == id))!;
        }

        public MejorEpocaVisita GetMejorEpocaByDestino(int id)
        {
            var epocas = _context.MejorEpocaVisita.ToList();
            var relations = _context.MejorEpocaVisitaDestinoRelation.ToList();

            return epocas.FirstOrDefault(e => relations.Any(r => r.epoca_id == e.Id && r.destino_id == id))!;
        }

        public Alojamiento GetAlojamientoByDestino(int id)
        {
            var alojamientos = _context.Alojamiento.ToList();
            var relations = _context.AlojamientoDestinoRelation.ToList();

            return alojamientos.FirstOrDefault(a => relations.Any(r => r.alojamiento_id == a.id && r.destino_id == id))!;
        }

        public Transporte GetTransporteByDestino(int id)
        {
            var transportes = _context.Transporte.ToList();
            var relations = _context.TransporteDestinoRelation.ToList();

            return transportes.FirstOrDefault(t => relations.Any(r => r.transporte_id == t.id && r.destino_id == id))!;
        }

        public IEnumerable<DestinoDetalles> GetDetallesByDestino(int destino_id)
        {
            return _context.DestinoDetalles
                .Where(d => d.destino_id == destino_id)
                .ToList();
        }

        public DestinoDetalles GetDetalleById(int id)
        {
            var destino = _context.Destinos.Find(id);
            if (destino == null)
            {
                return null!;
            }

            var DestinoDetalles = _context.DestinoDetalles
                .FirstOrDefault(d => d.id == id);

            if (DestinoDetalles == null)
            {
                return null!;
            }
            DestinoDetalles.ciudad = destino.ciudad;
            DestinoDetalles.provincia = destino.provincia;
            return DestinoDetalles;
        }

        public DestinoDetalles AddDetalle(DestinoDetalles detalle)
        {
            var destino = _context.Destinos.Find(detalle.destino_id);
            if (destino != null)
            {
                detalle.ciudad = destino.ciudad;
                detalle.provincia = destino.provincia;
            }
            _context.DestinoDetalles.Add(detalle);
            _context.SaveChanges();
            return detalle;
        }

        public void UpdateDetalle(DestinoDetalles detalle)
        {
            var destino = _context.Destinos.Find(detalle.destino_id);
            if (destino != null)
            {
                detalle.ciudad = destino.ciudad;
                detalle.provincia = destino.provincia;
            }
            _context.DestinoDetalles.Update(detalle);
            _context.SaveChanges();
        }

        public void DeleteDetalle(int id)
        {
            var detalle = _context.DestinoDetalles.Find(id);
            if (detalle != null)
            {
                _context.DestinoDetalles.Remove(detalle);
                _context.SaveChanges();
            }
        }
    }
}
