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
            //Instancia o objeto da classe Interface
            Interface interfaceObj = new Interface();

            ENUM array = new ENUM();
            String[,] unidades = array.getUnidades();

            //Pega aquantidade de linhas do array.
            int tamanhoArray = unidades.Length;
            //tamanhoArray /= 2;
            tamanhoArray = 1;

            //Chama o método de interfaceamento passando como parâmetros os dados da Sorologia
            for (int i = 0; i < tamanhoArray; i++)
            {
                Console.WriteLine("Inicio Sor Unidade: " + unidades[i, 0]);
                interfaceObj.executaInterface(Properties.Resources.ServidorHBH, unidades[i, 0] + "$", unidades[i, 1], Properties.Resources.CaminhoDestinoSor);
                Console.WriteLine("Fim Sor Unidade: " + unidades[i, 0]);
                Console.WriteLine("-----------");
                Console.WriteLine("Inicio NAT Unidade: " + unidades[i, 0]);
                interfaceObj.executaInterface(Properties.Resources.ServidorHBH, unidades[i, 0] + "NAT", unidades[i, 1], Properties.Resources.CaminhoDestinoNat);
                Console.WriteLine("Fim NAT Unidade: " + unidades[i, 0]);
                Console.WriteLine("-----------");
                Console.WriteLine("Inicio EXP Unidade: " + unidades[i, 0]);
                interfaceObj.copiaExp(Properties.Resources.ServidorHBH, unidades[i, 0] + "$\\EXP", unidades[i, 1], Properties.Resources.CaminhoOrigemEXP);
                Console.WriteLine("Fim EXP Unidade: " + unidades[i, 0]);
                Console.WriteLine("-----------");
            }
            Console.ReadKey();
        }
    }
}
