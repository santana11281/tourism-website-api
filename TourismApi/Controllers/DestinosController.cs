using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;
using TourismApi.Services.Interfaces;

namespace TourismApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DestinosController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IDestinoService _destinoService;


        public DestinosController(AppDbContext context, IDestinoService destinoService)
        {
            _context = context;
            _destinoService = destinoService;

        }

        [HttpGet("GetDestinos")]
        public IEnumerable<Destino> GetDestinos()
        {
            var destinos = _context.Destinos;
            return destinos;
        }

        [HttpGet("GetActivities/{id}")]
        public IEnumerable<Activity> GetActivities(int id)
        {
            return _destinoService.GetActivitiesByDestino(id);

        }

        [HttpGet("GetClima/{id}")]
        public Clima GetClima(int id)
        {
            return _destinoService.GetClimaByDestino(id);
        }

        [HttpGet("GetMejorEpoca/{id}")]
        public MejorEpocaVisita GetMejorEpoca(int id)
        {
            return _destinoService.GetMejorEpocaByDestino(id);
        }

        [HttpGet("GetAlojamiento/{id}")]
        public Alojamiento GetAlojamiento(int id)
        {
            return _destinoService.GetAlojamientoByDestino(id);
        }

        [HttpGet("GetTransporte/{id}")]
        public Transporte GetTransporte(int id)
        {
            return _destinoService.GetTransporteByDestino(id);
        }

        [HttpGet("Detalles/{destino_id}")]
        public IEnumerable<DestinoDetalles> GetDetallesByDestino(int destino_id)
        {
            return _destinoService.GetDetallesByDestino(destino_id);
        }

        [HttpGet("GetDetalle/{id}")]
        public ActionResult<DestinoDetalles> GetDetalleById(int id)
        {
            var detalle = _destinoService.GetDetalleById(id);
            if (detalle == null)
            {
                return NotFound();
            }
            return detalle;
        }

        [HttpPost("Detalle")]
        public ActionResult<DestinoDetalles> CreateDetalle(DestinoDetalles detalle)
        {
            var newDetalle = _destinoService.AddDetalle(detalle);
            return CreatedAtAction(nameof(GetDetalleById), new { id = newDetalle.id }, newDetalle);
        }

        [HttpPut("Detalle/{id}")]
        public IActionResult UpdateDetalle(int id, DestinoDetalles detalle)
        {
            if (id != detalle.id)
            {
                return BadRequest();
            }

            try
            {
                _destinoService.UpdateDetalle(detalle);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (_destinoService.GetDetalleById(id) == null)
                {
                    return NotFound();
                }
                throw;
            }

            return NoContent();
        }

        [HttpDelete("Detalle/{id}")]
        public IActionResult DeleteDetalle(int id)
        {
            var detalle = _destinoService.GetDetalleById(id);
            if (detalle == null)
            {
                return NotFound();
            }

            _destinoService.DeleteDetalle(id);
            return NoContent();
        }
    }
}
