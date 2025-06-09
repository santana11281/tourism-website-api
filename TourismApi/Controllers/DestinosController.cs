using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using TourismApi.Modelos;
using TourismApi.Services.Interfaces;

namespace TourismApi.Controllers
{
    /// <summary>
    /// Controller for managing tourist destinations and their details
    /// </summary>
    [ApiController]
    [Route("[controller]")]
    [Produces("application/json")]
    public class DestinosController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IDestinoService _destinoService;


        public DestinosController(AppDbContext context, IDestinoService destinoService)
        {
            _context = context;
            _destinoService = destinoService;

        }

        /// <summary>
        /// Gets a list of tourist destinations
        /// </summary>
        /// <returns>A list of destinations</returns>
        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<Destino>), 200)]
        public IActionResult GetBase()
        {
            return Ok(new { status = "on" });
        }

        /// <summary>
        /// Gets a list of tourist destinations
        /// </summary>
        /// <returns>A list of destinations</returns>
        [HttpGet("GetDestinos")]
        [ProducesResponseType(typeof(IEnumerable<Destino>), 200)]
        public IEnumerable<Destino> GetDestinos()
        {
            var destinos = _context.Destinos;
            return destinos.Take(4);
        }

        /// <summary>
        /// Gets activities for a specific destination
        /// </summary>
        /// <param name="id">The destination ID</param>
        /// <returns>A list of activities</returns>
        [HttpGet("GetActivities/{id}")]
        [ProducesResponseType(typeof(IEnumerable<Activity>), 200)]
        public IEnumerable<Activity> GetActivities([FromRoute] int id)
        {
            return _destinoService.GetActivitiesByDestino(id);

        }

        /// <summary>
        /// Gets climate information for a destination
        /// </summary>
        /// <param name="id">The destination ID</param>
        /// <returns>Climate information</returns>
        [HttpGet("GetClima/{id}")]
        [ProducesResponseType(typeof(Clima), 200)]
        public ActionResult<Clima> GetClima([FromRoute] int id)
        {
            return _destinoService.GetClimaByDestino(id);
        }

        /// <summary>
        /// Gets the best time to visit a destination
        /// </summary>
        /// <param name="id">The destination ID</param>
        /// <returns>Best visit time information</returns>
        [HttpGet("GetMejorEpoca/{id}")]
        [ProducesResponseType(typeof(MejorEpocaVisita), 200)]
        public ActionResult<MejorEpocaVisita> GetMejorEpoca([FromRoute] int id)
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

        /// <summary>
        /// Gets details for a specific destination
        /// </summary>
        /// <param name="destino_id">The destination ID</param>
        /// <returns>A list of destination details</returns>
        [HttpGet("Detalles/{destino_id}")]
        [ProducesResponseType(typeof(IEnumerable<DestinoDetalles>), 200)]
        public IEnumerable<DestinoDetalles> GetDetallesByDestino([FromRoute] int destino_id)
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

        /// <summary>
        /// Creates a new destination detail
        /// </summary>
        /// <param name="detalle">The destination detail to create</param>
        /// <returns>The created destination detail</returns>
        [HttpPost("Detalle")]
        [ProducesResponseType(typeof(DestinoDetalles), 201)]
        [ProducesResponseType(400)]
        public ActionResult<DestinoDetalles> CreateDetalle([FromBody] DestinoDetalles detalle)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var newDetalle = _destinoService.AddDetalle(detalle);
            return CreatedAtAction(
                actionName: nameof(GetDetalleById),
                routeValues: new { id = newDetalle.id },
                value: newDetalle);
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

        /// <summary>
        /// Gets route information for a specific destination
        /// </summary>
        /// <param name="destino_id">The destination ID</param>
        /// <returns>Route information including paradas, transport options, and tips</returns>
        [HttpGet("Rutas/{destino_id}")]
        [ProducesResponseType(typeof(List<TourismApi.Services.Interfaces.RutaInfoDto>), 200)]
        public IActionResult GetRutasByDestino([FromRoute] int destino_id)
        {
            var rutas = _destinoService.GetRutasByDestino(destino_id);
            return Ok(rutas);
        }
    }
}
