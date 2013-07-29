using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.IO;

namespace Interfaceamento
{
    public partial class Service1 : ServiceBase
    {
        Timer timer1;

        //Instancia o objeto da classe Interface
        Interface interfaceObj = new Interface();

        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            //Timer(função de callback, null, atraso de inicio, tempo entre execuções)
            timer1 = new Timer(new TimerCallback(timer1_Tick), null, 0, 300000); //300000 Milesegundos = 5 minutos
        }

        protected override void OnStop()
        {
            String dia = DateTime.Now.Day.ToString();
            String mes = DateTime.Now.Month.ToString();
            String ano = DateTime.Now.Year.ToString();
            String hora = DateTime.Now.Hour.ToString();
            String minuto = DateTime.Now.Minute.ToString();
            String segundos = DateTime.Now.Second.ToString();

            interfaceObj.GravaLog("Servico Parado em ", dia, mes, ano, hora, minuto, segundos);
        }

        private void timer1_Tick(object sender)
        {
            ENUM array = new ENUM();
            String[,] unidades = array.getUnidades();

            //Pega aquantidade de linhas do array.
            int tamanhoArray = unidades.Length;
            //tamanhoArray /= 2;
            tamanhoArray = 1;

            //Chama o método de interfaceamento passando como parâmetros os dados da Sorologia
            for (int i = 0; i < tamanhoArray; i++)
            {
                /*
                String dia = DateTime.Now.Day.ToString();
                String mes = DateTime.Now.Month.ToString();
                String ano = DateTime.Now.Year.ToString();
                String hora = DateTime.Now.Hour.ToString();
                String minuto = DateTime.Now.Minute.ToString();
                String segundos = DateTime.Now.Second.ToString();

                interfaceObj.GravaLog("Executando ", dia, mes, ano, hora, minuto, segundos);
                */
                
                interfaceObj.executaInterface(Properties.Resources.ServidorHBH, unidades[i, 0] + "$", unidades[i, 1], Properties.Resources.CaminhoDestinoSor);
                interfaceObj.executaInterface(Properties.Resources.ServidorHBH, unidades[i, 0] + "NAT", unidades[i, 1], Properties.Resources.CaminhoDestinoNat);
                interfaceObj.copiaExp(Properties.Resources.ServidorHBH, unidades[i, 0] + "$\\EXP", unidades[i, 1], Properties.Resources.CaminhoOrigemEXP);
            }
        }
    }
}
