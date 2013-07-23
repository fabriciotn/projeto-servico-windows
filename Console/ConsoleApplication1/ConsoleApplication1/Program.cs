using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ConsoleApplication1
{
    public class Program
    {
        static void Main(string[] args)
        {
            ENUM array = new ENUM();
            String[,] unidades = array.getUnidades();

            //Pega aquantidade de linhas do array.
            int tamanhoArray = unidades.Length;
            tamanhoArray /= 2;
            //tamanhoArray = 4;

            String CaminhoOrigem = Properties.Resources.CaminhoOrigem;
            String CaminhoDestinoSor = Properties.Resources.CaminhoDestinoSor;
            String CaminhoDestinoNat = Properties.Resources.CaminhoDestinoNat;

            //Instancia o objeto da classe Interface
            Interface executaInterface = new Interface();

            
            //Chama o método de interfaceamento passando como parâmetros os dados da Sorologia
            for (int i = 0; i < tamanhoArray; i++)
            {
                executaInterface.Interfaceamento(CaminhoOrigem, unidades[i, 0] + "$", unidades[i, 1], CaminhoDestinoSor);
                executaInterface.Interfaceamento(CaminhoOrigem, unidades[i, 0] + "NAT", unidades[i, 1], CaminhoDestinoNat);
            }
            Console.ReadKey();
        }
    }
}
