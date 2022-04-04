namespace MaxDev.Prode.Entidades
{
    public partial class ApuestaFixtureCompleto
    {
        public string Ganador
        {
            get
            {
                if (ApuestaLocal == true)
                    return "L";

                if (ApuestaVisitante == true)
                    return "V";

                if (ApuestaEmpate == true)
                    return "E";

                return string.Empty;
            }
        }

        public string ClassGanador
        {
            get
            {
                if (AcertoGanador == true)
                    return "success";

                if (AcertoGanador == false)
                    return "danger";

                return string.Empty;
            }
        }


        public string ClassGolLocal
        {
            get
            {
                if (AcertoLocal == true && EvaluarLocal && EvaluarVisitante)
                    return "success";

                if (AcertoLocal == false && EvaluarLocal && EvaluarVisitante)
                    return "danger";

                return string.Empty;
            }
        }

        public string ClassGolVisitante
        {
            get
            {
                if (AcertoVisitante == true && EvaluarLocal && EvaluarVisitante)
                    return "success";

                if (AcertoVisitante == false && EvaluarLocal && EvaluarVisitante)
                    return "danger";

                return string.Empty;
            }
        }
    }
}
