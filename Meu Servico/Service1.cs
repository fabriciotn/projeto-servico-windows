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

namespace Meu_Servico
{
    public partial class Service1 : ServiceBase
    {
        Timer timer1;

        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            timer1 = new Timer(new TimerCallback(timer1_Tick), null, 15000, 60000);
        }

        protected override void OnStop()
        {
            GravaLog("Servico Parado em " + DateTime.Now.ToString());
        }

        private void timer1_Tick(object sender)
        {
            /*
            StreamWriter vWriter = new StreamWriter(@"c:\testeServico.txt", true);
            vWriter.WriteLine("Servico Rodando: " + DateTime.Now.ToString());
            vWriter.Flush();
            vWriter.Close();
             */

            //Teste JFO
            String CaminhoOrigem = Properties.Resources.CaminhoOrigem;
            String SiglaUnidade = Properties.Resources.SiglaJFO;
            String ServidorUnidade = Properties.Resources.ServidorJFO;
            String CaminhoDestinoSor = Properties.Resources.CaminhoDestinoSor;


            InterfaceSorologia(CaminhoOrigem, SiglaUnidade, ServidorUnidade, CaminhoDestinoSor);
        }

        #region InterfaceSorologia
        /// <summary>
        /// Classe que faz a cópia dos arquivos da SOROLOGIA
        /// </summary>
        public void InterfaceSorologia(String CaminhoOrigem, String SiglaUnidade, String ServidorUnidade, String CaminhoDestinoSor)
        {
            //Exclui o mapeamento I: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();

            //mapeia a unidade de origem
            System.Diagnostics.Process.Start("CMD", @"/C NET USE I: " + CaminhoOrigem + SiglaUnidade +"$ /PERSISTENT:YES");

            //Guardo o nome do arquivo
            string nomeDoArquivo = "";

            //Caminho de origem
            string caminhoDeOrigem = @"I:";

            //Caminho de destino
            //mapeia a unidade
            //System.Diagnostics.Process.Start("CMD", @"/C net use k: \\10.12.175.208\hmae /persistent:yes").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C NET USE K: " + ServidorUnidade + CaminhoDestinoSor + " /PERSISTENT:YES").WaitForExit();

            string caminhoDeDestino = @"K:\";

            // Use Path class to manipulate file and directory paths.
            string arquivoDeOrigem = System.IO.Path.Combine(caminhoDeOrigem, nomeDoArquivo);
            string arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);


            //Prepara a cópia dos arquivos de interfaceamento
            if (System.IO.Directory.Exists(caminhoDeOrigem))
            {
                string[] listaDeArquivos = System.IO.Directory.GetFiles(caminhoDeOrigem);

                //Verificar arquivo por arquivo para copiar
                foreach (string s in listaDeArquivos)
                {
                    //Verifica se a extensão do arquivo é .ENV
                    if (System.IO.Path.GetExtension(s).Equals(".ENV"))
                    {
                        nomeDoArquivo = System.IO.Path.GetFileName(s);
                        arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);
                        try
                        {
                            //Executa a cópia | parâmetro false para não substituir
                            System.IO.File.Copy(s, arquivoDeDestino, false);
                        }
                        catch (Exception e)
                        {
                            //Grava o log em caso de erro
                            GravaLog(e.Message);
                        }
                    }
                }
            }
            else
            {
                //Grava o log em caso de erro
                GravaLog("Pasta " + caminhoDeOrigem + " não existe!");
            }

            //Exclui o mapeamento I: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();
        }
        #endregion


        #region InterfaceNAT
        /*
        /// <summary>
        /// Classe que faz a cópia dos arquivos da SOROLOGIA
        /// </summary>
        private static void InterfaceSorologia()
        {
            //Exclui o mapeamento I: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();

            //mapeia a unidade
            System.Diagnostics.Process.Start("CMD", @"/C net use I: \\10.14.124.11\jfo$ /persistent:yes").WaitForExit();

            //Guardo o nome do arquivo
            string nomeDoArquivo = "";

            //Caminho de origem
            string caminhoDeOrigem = @"I:";

            //Caminho de destino
            string caminhoDeDestino = @"K:\INT_SOR\ENV";

            // Use Path class to manipulate file and directory paths.
            string arquivoDeOrigem = System.IO.Path.Combine(caminhoDeOrigem, nomeDoArquivo);
            string arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);


            //Prepara a cópia dos arquivos de interfaceamento
            if (System.IO.Directory.Exists(caminhoDeOrigem))
            {
                string[] listaDeArquivos = System.IO.Directory.GetFiles(caminhoDeOrigem);

                //Verificar arquivo por arquivo para copiar
                foreach (string s in listaDeArquivos)
                {
                    //Verifica se a extensão do arquivo é .ENV
                    if (System.IO.Path.GetExtension(s).Equals(".ENV"))
                    {
                        nomeDoArquivo = System.IO.Path.GetFileName(s);
                        arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);
                        try
                        {
                            //Executa a cópia | parâmetro false para não substituir
                            System.IO.File.Copy(s, arquivoDeDestino, false);
                        }
                        catch (Exception e)
                        {
                            //Grava o log em caso de erro
                            GravaLog(e.Message);
                        }
                    }
                }
            }
            else
            {
                //Grava o log em caso de erro
                GravaLog("Pasta " + caminhoDeOrigem + " não existe!");
            }

            //Exclui o mapeamento I: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
        }
        */
        #endregion


        #region GravaLog
        /// <summary>
        /// Classe que Grava o erro no arquivo de log.
        /// </summary>
        /// <param name="mensagem">Deve receber um parâmetro com a mensagem.</param>
        private void GravaLog(String mensagem)
        {
            StreamWriter vWriter = new StreamWriter(@"c:\LogInterface.txt", true);
            vWriter.WriteLine(DateTime.Now.ToString() + " - " + mensagem);
            vWriter.Flush();
            vWriter.Close();
        }
        #endregion
    }
}
