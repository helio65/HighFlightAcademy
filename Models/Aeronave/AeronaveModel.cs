using HighFlightAcademy.Utils.Entidades;

namespace HighFlightAcademy.Models.Aeronave
{
    public class AeronaveModel
    {
        public int ID_Aeronave {  get; set; }
        public string Modelo { get; set; }
        public string Matricula { get; set; }
        public int Capacidade { get; set; }
        public int AnoFabricacao { get; set; }
        public string INStatus { get; set; }
        public DateTime DataCadastro { get; set; }
        public DateTime DataAteracao { get; set; }
        public int SituacaoRegistro { get; set; }

        public AeronaveModel()
        {

        }

        public AeronaveModel(Utils.Entidades.AeronaveEnt aeronave)
        {
            ID_Aeronave      = aeronave.ID_Aeronave;
            Modelo           = aeronave.Modelo;
            Matricula        = aeronave.Matricula;
            Capacidade       = aeronave.Capacidade;
            AnoFabricacao    = aeronave.AnoFabricacao;
            INStatus         = aeronave.INStatus;
            DataCadastro     = aeronave.DataCadastro;
            SituacaoRegistro = aeronave.SituacaoRegistro;
        }

        public Utils.Entidades.AeronaveEnt Getentidade()
        {
            return new Utils.Entidades.AeronaveEnt()
            {
                ID_Aeronave      = ID_Aeronave,
                Modelo           = Modelo,
                Matricula        = Matricula,
                Capacidade       = Capacidade,
                AnoFabricacao    = AnoFabricacao,
                INStatus         = INStatus,
                DataCadastro     = DataCadastro,
                SituacaoRegistro = SituacaoRegistro
            };
        }
    }
}
