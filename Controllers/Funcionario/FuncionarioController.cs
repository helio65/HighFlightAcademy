using Microsoft.AspNetCore.Mvc;
using HighFlightAcademy.Utils.Entidades;
using HighFlightAcademy.Models.Funcionario;
using HighFlightAcademy.Models.Aeronave;

namespace HighFlightAcademy.Controllers.Funcionario
{
    public class FuncionarioController : Controller
    {
        public IActionResult Index()
        {
            var model = new FuncionariosModel();
            model.Funcionarios = new List<FuncionarioModel>();

            var Funcionarios = FuncionarioEnt.GetAll();

            foreach (var funcionario in Funcionarios)
            {
                model.Funcionarios.Add(new FuncionarioModel()
                {
                    ID_Funcionario   = funcionario.ID_Funcionario,
                    ID_Cargo         = funcionario.ID_Cargo,
                    ID_Titulacao     = funcionario.ID_Titulacao,
                    ID_Cidade_End    = funcionario.ID_Cidade_End,
                    Nome             = funcionario.Nome,
                    Cpf              = funcionario.Cpf,
                    Sexo             = funcionario.Sexo,
                    DataNascimento   = funcionario.DataNascimento,
                    End_Cep          = funcionario.End_Cep,
                    End_Logradouro   = funcionario.End_Logradouro,
                    End_Complemento  = funcionario.End_Complemento,
                    End_Numero       = funcionario.End_Numero,
                    End_Bairro       = funcionario.End_Bairro,
                    Telefone         = funcionario.Telefone,
                    Email            = funcionario.Email,
                    SituacaoRegistro = funcionario.SituacaoRegistro,
                    DataCadastro     = funcionario.DataCadastro
                });
            }
            return View(model);
        }

        // Adiciona uma novo Funcionário           
        public IActionResult Create()
        {
            var model = new FuncionarioModel();
            return View(model);
        }

        public IActionResult Editar(int? id)
        {
            var model = new FuncionarioModel();

            if (id.HasValue)
            {
                model = new FuncionarioModel(FuncionarioEnt.Get(id.Value));
            }

            return View(model);
        }

        [HttpPost]
        public IActionResult Gravar(FuncionarioModel model)
        {
            FuncionarioEnt funcionario = model.Getentidade();
            {
                funcionario.Create();
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Update(FuncionarioModel model)
        {
            FuncionarioEnt funcionario = model.Getentidade();
            {
                funcionario.Update();
            }
            return RedirectToAction("Index");
        }

        public IActionResult Delete(FuncionarioModel model)
        {
            FuncionarioEnt funcionario = model.Getentidade();
            {
                funcionario.Delete();
            }
            return RedirectToAction("Index");
        }
    }
}
