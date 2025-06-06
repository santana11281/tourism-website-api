using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;

namespace TourismApi.Services.Interfaces
{
    public interface IDestinoService
    {
        IEnumerable<Destino> GetDestinos();


        IEnumerable<Activity> GetActivitiesByDestino(int id);
    }
}
