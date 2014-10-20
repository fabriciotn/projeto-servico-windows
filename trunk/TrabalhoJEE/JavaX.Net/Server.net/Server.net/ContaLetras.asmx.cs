using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Server.net
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class ContaLetras : System.Web.Services.WebService
    {
        [WebMethod]
        public string ContarLetras(String nome)
        {
            String retorno = "O nome " + nome + " contém " + nome.Length + " letras!";
            return retorno;
        }
    }
}
