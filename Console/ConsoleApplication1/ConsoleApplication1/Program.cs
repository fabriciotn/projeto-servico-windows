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
            //Teste JFO
            String CaminhoOrigem = Properties.Resources.CaminhoOrigem;
            String SiglaUnidade = Properties.Resources.SiglaJFO;
            String ServidorUnidade = Properties.Resources.ServidorJFO;
            String CaminhoDestinoSor = Properties.Resources.CaminhoDestinoSor;
            String CaminhoDestinoNat = Properties.Resources.CaminhoDestinoNat;


            InterfaceSorologia(CaminhoOrigem, SiglaUnidade, ServidorUnidade, CaminhoDestinoSor);
        }



        /*
         * VERIFICAR AS CONDIÇÕES DE CHAMADA TANTO DO NAT QUANTO DA SOROLOGIA
         * SIGLAS DAS UNIDADES
         * 
         */

        #region InterfaceSorologia e NAT
        /// <summary>
        /// Classe que faz a cópia dos arquivos da SOROLOGIA E DO NAT
        /// ATENÇÃO: DEPENDE DO CAMINHO PASSADO. CHAMAR COM CaminhoDestino
        /// </summary>
        public static void InterfaceSorologia(String CaminhoOrigem, String SiglaUnidade, String ServidorUnidade, String CaminhoDestinoSor)
        {
            //Exclui o mapeamento I e K: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();
            Console.WriteLine("Exclui os mapeamentos I e K: se existir");
            Console.ReadKey();

            //mapeia a unidade de origem
            System.Diagnostics.Process.Start("CMD", @"/C NET USE I: " + CaminhoOrigem + SiglaUnidade + " /PERSISTENT:YES");
            Console.WriteLine("mapeia a unidade de origem --- NET USE I: " + CaminhoOrigem + SiglaUnidade + " /PERSISTENT:YES");
            Console.ReadKey();

            //Guardo o nome do arquivo
            string nomeDoArquivo = "";

            //Caminho de origem
            string caminhoDeOrigem = @"I:";

            //Caminho de destino
            //mapeia a unidade
            //System.Diagnostics.Process.Start("CMD", @"/C net use k: \\10.12.175.208\hmae /persistent:yes").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C NET USE K: " + ServidorUnidade + CaminhoDestinoSor + " /PERSISTENT:YES").WaitForExit();
            Console.WriteLine("mapeia a unidade de destino --- NET USE K: " + ServidorUnidade + CaminhoDestinoSor + " /PERSISTENT:YES");
            Console.ReadKey();

            string caminhoDeDestino = @"K:\";

            // Use Path class to manipulate file and directory paths.
            string arquivoDeOrigem = System.IO.Path.Combine(caminhoDeOrigem, nomeDoArquivo);
            string arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);

            String dia = DateTime.Now.Day.ToString();
            String mes = DateTime.Now.Month.ToString();
            String ano = DateTime.Now.Year.ToString();
            String hora = DateTime.Now.Hour.ToString();
            String minuto = DateTime.Now.Minute.ToString();
            String segundos = DateTime.Now.Second.ToString();


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
                            Console.WriteLine("copiando arquivo: " + arquivoDeDestino);
                        }
                        catch (Exception e)
                        {
                            //Grava o log em caso de erro
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                    }
                }
            }
            else
            {
                //Grava o log em caso de erro
                GravaLog("Pasta " + caminhoDeOrigem + " não existe!", dia, mes, ano, hora, minuto, segundos);
            }

            //Exclui o mapeamento I: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();
            Console.WriteLine("deleta mapeamentos I: e K:");
            Console.ReadKey();
        }
        #endregion

        #region GravaLog
        /// <summary>
        /// Classe que Grava o erro no arquivo de log.
        /// </summary>
        /// <param name="mensagem">Deve receber um parâmetro com a mensagem.</param>
        private static void GravaLog(String mensagem, String dia, String mes, String ano, String hora, String minuto, String segundos)
        {
            StreamWriter vWriter = new StreamWriter(@"c:\Log\LogInterface_" + dia + "_" + mes + "_" + ano + " - " + hora + "_" + minuto + "_" + segundos + ".txt", true);
            vWriter.WriteLine(DateTime.Now.ToString() + " - " + mensagem);
            vWriter.Flush();
            vWriter.Close();
        }
        #endregion
    }
}
