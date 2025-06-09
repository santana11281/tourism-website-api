using Microsoft.EntityFrameworkCore;
using TourismApi.Modelos;
using System.Collections.Generic;

namespace TourismApi.Services.Interfaces
{
    public class RutaInfoDto
    {
        public Ruta Ruta { get; set; }
        public List<RutaParada> Paradas { get; set; }
        public List<TransporteOpcion> TransporteOpciones { get; set; }
        public List<TipsViaje> Tips { get; set; }
    }

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
        List<RutaInfoDto> GetRutasByDestino(int destinoId);
    }
}
