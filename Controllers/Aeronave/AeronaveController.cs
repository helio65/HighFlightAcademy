using Microsoft.AspNetCore.Mvc;
using System.Reflection.PortableExecutable;
using HighFlightAcademy.Utils.Entidades;
using HighFlightAcademy.Models.Aeronave;

namespace HighFlightAcademy.Controllers
{
    public class AeronaveController : Controller
    {
        public IActionResult Index()
        {
            var model = new AeronavesModel();
            model.Aeronaves = new List<AeronaveModel>();

            var Aeronaves = AeronaveEnt.GetAll();
            
            foreach (var aeronave in Aeronaves)
            {
                model.Aeronaves.Add(new AeronaveModel()
                {
                    ID_Aeronave      = aeronave.ID_Aeronave,
                    Modelo           = aeronave.Modelo,
                    Matricula        = aeronave.Matricula,
                    Capacidade       = aeronave.Capacidade,
                    AnoFabricacao    = aeronave.AnoFabricacao,
                    INStatus         = aeronave.INStatus,
                    DataCadastro     = aeronave.DataCadastro,                   
                    SituacaoRegistro = aeronave.SituacaoRegistro
                });
            }         
            return View(model);
        }

        // Adiciona uma nova Aeronave           
        public IActionResult Create()
        {
            var model = new AeronaveModel();        
            return View(model);
        }

        public IActionResult Editar(int? id)
        {
            var model = new AeronaveModel();

            if (id.HasValue)
            {
                model = new AeronaveModel(AeronaveEnt.Get(id.Value));
            }

            return View(model);
        }

        [HttpPost]
        public IActionResult Gravar(AeronaveModel model)
        {
            AeronaveEnt aeronave = model.Getentidade();             
            {
                aeronave.Create();
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Update(AeronaveModel model)
        {
            AeronaveEnt aeronave = model.Getentidade();
            {
                aeronave.Update();
            }
            return RedirectToAction("Index");
        }
        
        public IActionResult Delete(AeronaveModel model)
        {
            AeronaveEnt aeronave = model.Getentidade();
            {
                aeronave.Delete();
            }
            return RedirectToAction("Index");
        }
    }
}
