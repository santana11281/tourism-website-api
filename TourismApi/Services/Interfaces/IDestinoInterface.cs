using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;

namespace TourismApi.Services.Interfaces
{
    public interface IDestinoService
    {
        IEnumerable<Destino> GetDestinos();


        IEnumerable<Activity> GetActivitiesByDestino(int id);
        Clima GetClimaByDestino(int id);
        MejorEpocaVisita GetMejorEpocaByDestino(int id);
        Transporte GetTransporteByDestino(int id);
        Alojamiento GetAlojamientoByDestino(int id);
        IEnumerable<DestinoDetalles> GetDetallesByDestino(int destino_id);
        DestinoDetalles GetDetalleById(int id);
        DestinoDetalles AddDetalle(DestinoDetalles detalle);
        void UpdateDetalle(DestinoDetalles detalle);
        void DeleteDetalle(int id);
    }
}
