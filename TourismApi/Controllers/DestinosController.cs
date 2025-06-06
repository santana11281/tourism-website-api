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


    }
}
