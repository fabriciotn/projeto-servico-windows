using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ConsoleApplication1
{
    public class Interface
    {

        #region Interface Sorologia e NAT
        /// <summary>
        /// Classe que faz a cópia dos arquivos da SOROLOGIA E DO NAT do HBH para as unidades
        /// </summary>
        /// <param name="CaminhoOrigem">Caminho de origem</param>
        /// <param name="SiglaUnidade">Sigla da unidade</param>
        /// <param name="ServidorUnidade">Servidor da unidade</param>
        /// <param name="ServidorHBH">Caminho de destino</param>
        public void executaInterface(String ServidorHBH, String SiglaUnidade, String ServidorUnidade, String CaminhoDestino)
        {
            //Exclui o mapeamento I e K: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();

            //mapeia a unidade de origem
            System.Diagnostics.Process.Start("CMD", @"/C NET USE I: " + ServidorHBH + SiglaUnidade + " /PERSISTENT:YES");

            //Guardo o nome do arquivo
            string nomeDoArquivo = "";

            //Caminho de origem
            string caminhoDeOrigem = @"I:";

            //Caminho de destino
            //mapeia a unidade
            System.Diagnostics.Process.Start("CMD", @"/C NET USE K: " + ServidorUnidade + CaminhoDestino + " /PERSISTENT:YES").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C NET USE").WaitForExit();

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
                    if (System.IO.Path.GetExtension(s).Equals(".ENV", StringComparison.InvariantCultureIgnoreCase))
                    {
                        nomeDoArquivo = System.IO.Path.GetFileName(s);
                        arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);
                        try
                        {
                            //Executa a cópia | parâmetro false para não substituir
                            System.IO.File.Copy(s, arquivoDeDestino, false);
                        }
                        catch (UnauthorizedAccessException e)
                        {
                            //Grava o log em caso de erro de acesso negado
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (ArgumentException e)
                        {
                            //Grava o log em caso de erro de falta de atributos
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (DirectoryNotFoundException e)
                        {
                            //Grava o log em caso de erro de diretório inválido
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (FileNotFoundException e)
                        {
                            //Grava o log em caso de erro de arquivo inexistente
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (NotSupportedException e)
                        {
                            //Grava o log em caso de erro de arquivos com extensão não suportada
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

            //Exclui o mapeamentos I: e K: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();
        }
        #endregion


        #region Interface Arquivos EXP
        /// <summary>
        /// Classe que faz a cópia dos arquivos .exp das unidades para o HBH
        /// </summary>
        /// <param name="CaminhoOrigem">Caminho de origem</param>
        /// <param name="SiglaUnidade">Sigla da unidade</param>
        /// <param name="ServidorUnidade">Servidor da unidade</param>
        /// <param name="ServidorHBH">Servidor do HBH</param>
        public void copiaExp(String ServidorHBH, String SiglaUnidade, String ServidorUnidade, String CaminhoOrigem)
        {
            //Exclui o mapeamento I e K: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();

            //mapeia a unidade de Destino - HBH
            System.Diagnostics.Process.Start("CMD", @"/C NET USE I: " + ServidorHBH + SiglaUnidade + " /PERSISTENT:YES");
            Console.WriteLine("NET USE I: " + ServidorHBH + SiglaUnidade + " /PERSISTENT:YES");

            //Guardo o nome do arquivo
            string nomeDoArquivo = "";

            //Caminho de destino = HBH
            string caminhoDeDestino = @"I:";

            //Caminho de Origem - UNIDADES
            //mapeia a unidade
            System.Diagnostics.Process.Start("CMD", @"/C NET USE K: " + ServidorUnidade + CaminhoOrigem + " /PERSISTENT:YES").WaitForExit();
            Console.WriteLine("NET USE K: " + ServidorUnidade + CaminhoOrigem + " /PERSISTENT:YES");
            System.Diagnostics.Process.Start("CMD", @"/C NET USE").WaitForExit();

            string caminhoDeOrigem = @"K:\";

            // Use Path class to manipulate file and directory paths.
            string arquivoDeOrigem = System.IO.Path.Combine(caminhoDeOrigem, nomeDoArquivo);
            string arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);

            string dia = DateTime.Now.Day.ToString();
            string mes = DateTime.Now.Month.ToString();
            string ano = DateTime.Now.Year.ToString();
            string hora = DateTime.Now.Hour.ToString();
            string minuto = DateTime.Now.Minute.ToString();
            string segundos = DateTime.Now.Second.ToString();


            //Prepara a cópia dos arquivos de interfaceamento
            if (System.IO.Directory.Exists(caminhoDeOrigem))
            {
                string[] listaDeArquivos = System.IO.Directory.GetFiles(caminhoDeOrigem);

                //Verificar arquivo por arquivo para copiar
                foreach (string s in listaDeArquivos)
                {
                    //Verifica se a extensão do arquivo é .ENV
                    if (System.IO.Path.GetFileName(s).Contains("IS_EXP1") ||
                        System.IO.Path.GetFileName(s).Contains("IS_EXP4") ||
                        System.IO.Path.GetFileName(s).Contains("IS_EXP5"))
                    {
                        nomeDoArquivo = System.IO.Path.GetFileName(s);
                        arquivoDeDestino = System.IO.Path.Combine(caminhoDeDestino, nomeDoArquivo);
                        try
                        {
                            //Executa a cópia | parâmetro false para não substituir
                            System.IO.File.Copy(s, arquivoDeDestino, false);
                        }
                        catch (UnauthorizedAccessException e)
                        {
                            //Grava o log em caso de erro de acesso negado
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (ArgumentException e)
                        {
                            //Grava o log em caso de erro de falta de atributos
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (DirectoryNotFoundException e)
                        {
                            //Grava o log em caso de erro de diretório inválido
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (FileNotFoundException e)
                        {
                            //Grava o log em caso de erro de arquivo inexistente
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (NotSupportedException e)
                        {
                            //Grava o log em caso de erro de arquivos com extensão não suportada
                            GravaLog(e.Message, dia, mes, ano, hora, minuto, segundos);
                        }
                        catch (PathTooLongException e) { }
                        catch (IOException e) { }
                    }
                }
            }
            else
            {
                //Grava o log em caso de erro
                GravaLog("Pasta " + caminhoDeOrigem + " não existe!", dia, mes, ano, hora, minuto, segundos);
            }

            //Exclui o mapeamentos I: e K: se existir
            System.Diagnostics.Process.Start("CMD", @"/C net use I: /delete /y").WaitForExit();
            System.Diagnostics.Process.Start("CMD", @"/C net use K: /delete /y").WaitForExit();
        }
        #endregion



        #region GravaLog
        /// <summary>
        /// Classe que Grava o erro no arquivo de log.
        /// </summary>
        /// <param name="mensagem">Mensagem do log</param>
        /// <param name="dia">Dia</param>
        /// <param name="mes">Mês</param>
        /// <param name="ano">Ano</param>
        /// <param name="hora">Hora</param>
        /// <param name="minuto">Minuto</param>
        /// <param name="segundos">Segundo</param>
        public void GravaLog(String mensagem, String dia, String mes, String ano, String hora, String minuto, String segundos)
        {
            //Cria a pasta LogInterface se ela não existir
            System.IO.Directory.CreateDirectory(@"c:\LogInterface\");

            //cria o arquivo com os dados passados
            StreamWriter vWriter = new StreamWriter(@"c:\LogInterface\LogInterface_" + dia + "_" + mes + "_" + ano + " - " + hora + "_" + minuto + "_" + segundos + ".txt", true);
            vWriter.WriteLine(mensagem + " - " + DateTime.Now.ToString());
            vWriter.Flush();
            vWriter.Close();
        }
        #endregion
    }
}
