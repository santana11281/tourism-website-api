using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace TourismApi.Controllers
{
    public class DestinosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public DestinosController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetDestinos()
        {
            var destinos = await _context.Destinos
                .Include(d => d.Galeria)
                .Include(d => d.Comentarios)
                .ToListAsync();

            return Ok(destinos);
        }
    }
}
