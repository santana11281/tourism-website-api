using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;

namespace TourismApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ValoracionesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ValoracionesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Valoracion>> GetAll()
        {
            return _context.Valoraciones.Include(v => v.Categorias).ToList();
        }

        [HttpGet("{id}")]
        public ActionResult<Valoracion> GetById(int id)
        {
            var valoracion = _context.Valoraciones.Include(v => v.Categorias).FirstOrDefault(v => v.Id == id);
            if (valoracion == null) return NotFound();
            return valoracion;
        }

        [HttpGet("PorDestino/{destinoId}")]
        public ActionResult<IEnumerable<Valoracion>> GetByDestinoId(int destinoId)
        {
            var valoraciones = _context.Valoraciones
                .Include(v => v.Categorias)
                .Where(v => v.DestinoId == destinoId)
                .ToList();
            return valoraciones;
        }

        [HttpPost]
        public ActionResult<Valoracion> Create([FromBody] Valoracion valoracion)
        {
            _context.Valoraciones.Add(valoracion);
            _context.SaveChanges();
            return CreatedAtAction(nameof(GetById), new { id = valoracion.Id }, valoracion);
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] Valoracion valoracion)
        {
            if (id != valoracion.Id) return BadRequest();
            _context.Entry(valoracion).State = EntityState.Modified;
            _context.SaveChanges();
            return NoContent();
        }


    }
}
