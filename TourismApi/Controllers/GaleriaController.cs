using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;

namespace TourismApi.Controllers
{
    [ApiController]
    [Route("[controller]/Galeria")]
    public class GaleriaController : ControllerBase
    {
        private readonly AppDbContext _context;
        public GaleriaController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("Categorias")]
        public ActionResult<IEnumerable<GaleriaCategorias>> GetCategorias()
        {
            return _context.GaleriaCategorias.ToList();
        }

        [HttpGet("Imagenes/{destinoId}")]
        public ActionResult<IEnumerable<GaleriaImagenes>> GetImagenesByDestino(int destinoId)
        {
            return _context.GaleriaImagenes
                .Include(g => g.Categoria)
                .Where(g => g.DestinoId == destinoId)
                .ToList();
        }
    }
}
