using HighFlightAcademy.Utils.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Net.NetworkInformation;

namespace HighFlightAcademy.Models.Funcionario
{
    public class FuncionarioModel
    {       
        public int ID_Funcionario { get; set; }
        public int ID_Cargo { get; set; }
        public int ID_Titulacao { get; set; }
        public int ID_Cidade_End { get; set; }
        public string Nome { get; set; }
        public string Sexo { get; set; }
        public string Cpf { get; set; }
        public DateTime DataNascimento { get; set; }
        public string End_Cep { get; set; }
        public string End_Logradouro { get; set; }
        public string End_Complemento { get; set; }
        public int End_Numero { get; set; }
        public string End_Bairro { get; set; }
        public string Telefone { get; set; }
        public string Email { get; set; }
        public DateTime DataCadastro { get; set; }
        public DateTime DataAteracao { get; set; }
        public int SituacaoRegistro { get; set; }
        public List<SelectListItem> Cidades { get; set; }
        public List<SelectListItem> Cargos { get; set; }
        public List<SelectListItem> Titulacoes { get; set; }

        public FuncionarioModel()
        {

        }

        public FuncionarioModel(Utils.Entidades.FuncionarioEnt funcionario)
        {
            ID_Funcionario   = funcionario.ID_Funcionario;
            ID_Cargo         = funcionario.ID_Cargo;
            ID_Titulacao     = funcionario.ID_Titulacao;
            ID_Cidade_End    = funcionario.ID_Cidade_End;
            Nome             = funcionario.Nome;
            Cpf              = funcionario.Cpf;
            Sexo             = funcionario.Sexo;
            DataNascimento   = funcionario.DataNascimento;           
            End_Cep          = funcionario.End_Cep;
            End_Logradouro   = funcionario.End_Logradouro;
            End_Complemento  = funcionario.End_Complemento;
            End_Numero       = funcionario.End_Numero;
            End_Bairro       = funcionario.End_Bairro;
            Telefone         = funcionario.Telefone;
            Email            = funcionario.Email;
            SituacaoRegistro = funcionario.SituacaoRegistro;
            DataCadastro     = funcionario.DataCadastro;
        }

        public Utils.Entidades.FuncionarioEnt Getentidade()
        {
            return new Utils.Entidades.FuncionarioEnt()
            {
                ID_Funcionario   = ID_Funcionario,
                ID_Cargo         = ID_Cargo,
                ID_Titulacao     = ID_Titulacao,
                ID_Cidade_End    = ID_Cidade_End,
                Nome             = Nome,
                Cpf              = Cpf,
                Sexo             = Sexo,
                DataNascimento   = DataNascimento,
                End_Cep          = End_Cep,
                End_Logradouro   = End_Logradouro,
                End_Complemento  = End_Complemento,
                End_Numero       = End_Numero,
                End_Bairro       = End_Bairro,
                Telefone         = Telefone,
                Email            = Email,
                SituacaoRegistro = SituacaoRegistro,
                DataCadastro     = DataCadastro
            };
        }                
    }
}
