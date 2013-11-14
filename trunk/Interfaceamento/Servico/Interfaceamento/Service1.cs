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
            
        }
    }
}
