CREATE DATABASE  IF NOT EXISTS `pulmolab_teste` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pulmolab_teste`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pulmolab_teste
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(62) DEFAULT NULL,
  `data` varchar(19) DEFAULT NULL,
  `noticia` varchar(1953) DEFAULT NULL,
  `imagem1` varchar(0) DEFAULT NULL,
  `imagem2` varchar(0) DEFAULT NULL,
  `autor` varchar(18) DEFAULT NULL,
  `modelo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (22,'UMIDIFICADOR PODE PIORAR ALERGIAS RESPIRATÓRIAS','2014-05-18 14:33:34','Durante o inverno, a baixa umidade do ar é causa comum de rachadura labial, pele seca e vias aéreas ressecadas. Os umidificadores melhoram o ressecamento das vias aéreas. Entretanto, se você tem alergias a alérgenos presentes nos domicílios, como mofo e poeira, os umidificadores podem causar mais malefício que benefício. Saiba como:<br />\n<br />\n1) O alérgeno  mais comum em ambiente fechado é o ácaro da poeira caseira. Os ácaros crescem melhor onde há umidade. Ao umidificar o ar, é criado o ambiente perfeito para o ácaro sobreviver e prosperar. O ideal é que a umidade de sua casa entre 30-45%. Você pode monitora-la através de um medidor de umidade (higrômetro). <br />\n<br />\n2) Esporos de mofo podem ser um problema para quem tem alergia a fungo. É importante que o filtro do umidificador seja limpo e trocado regularmente para que o mofo não cresça e seja espalhado pela casa.<br />\n <br />\n3) O alto teor de minerais na água de torneira pode facilitar o crescimento de bactérias, e resultar em uma fumaça branca  que é um irritante adicional para as vias aéreas. <br />\n<br />\nPortanto, se você tem alergias a alérgenos de ambientes fechados o umidificador pode piorar os seus sintomas respiratórios. Procure seu alergista antes de comprar umidificadores <br />\n<br />\nFonte: American Academy of Allergy, Asthma and Immunollogy<br />\n','','','Analice Val de Pau','1'),(23,'BULYNG ESCOLAR EM CRIANÇAS COM ALERGIA ALIMENTAR','2014-05-18 14:35:59','O estudo foi conduzido por pesquisadores do Instituto Jaffe de Allergia Alimentar no  Mount Sinai Medical Center, em Nova York um dos maiores centros de pesquisa de alergia alimentar no mundo. Foram estudadas 353 crianças em idade escolar, a maioria adolescentes, mas 15% tinham entre 4 e 11 anos de idade. A maior parte da pesquisa foi preenchida pelos pais e cuidadores de crianças com alergias alimentares.<br />\n<br />\nOs resultados foram publicados na revista Annals of Allergy, Asthma & Immunology:<br />\n<br />\n• Cerca de 24% dos participantes tinham sido assediados  ou molestados por causa de suas alergias.<br />\n• Entre as crianças moletadas, 86% delas relataram o abuso mais de uma vez, O abuso verbal foi a forma mais comum de buling.<br />\n• 82% destes episódios ocorreram na escola e 80% ocorreram entre os colegas.<br />\n• 79% disse que o assédio moral foi exclusivamente relacionado com alergia alimentar, enquanto outros relataram terem sido assediados por carregar medicação para a sua alergia alimentar. <br />\n• 44% das crianças  relataram que alimentos aos quais eram alérgicas foram acenados de forma agressiva na sua cara.<br />\n• 18% das crianças molestadas informaram que tinham sido provocadas por professores ou funcionários da escola <br />\n<br />\nOs autores enfatizam que crianças que são vítimas de buling podem sofrer distúrbios psicológicos graves. Este estudo mostra que eles também podem ser intimidados simplesmente pelo fato de serem portadores de alergia alimentar, uma condição médica que é potencialmente fatal. <br />\n<br />\n\"Fiquei surpreso ao saber que mesmo os professores e funcionários da escola podem estar envolvidos, disse o Dr. Scott Scherer. É de se esperar que os professores devem proporcionar apoio para as crianças com alergia alimentar.\" Uma atenção redobrada por parte de autoridades escolares deve ser realizada para que crianças com alergia alimentar se sintam seguras indo para a escola.<br />','','','Dra. Luciana Giaro','1'),(24,'EXPOSIÇÃO PRECOCE A CÃO PODE DIMINUIR INCIDÊNCIA DE ALERGIAS','2014-05-21 20:53:32','Estudo sobre os efeitos exposição a cão no desenvolvimento no desenvolvimento de alergias na infância revelou que presença de um cachorro em casa no momento do nascimento da criança pode diminuir a chance dela desenvolver alergia<br />\nO estudo foi realizado em 285 crianças. Apenas 30% das crianças que tinham um animal de estimação desenvolveram dermatite atípica comparado com 51% das que não tinham cachorro em casa. Foi observado também uma redução de teste alérgicos positivos.<br />\n<br />\nEsses achados sugerem que exposição ao cão nos primeiros meses de vida pode influenciar a resposta imunológica de crianças com hist?ria familiar de alergia, atenuando o desenvolvimento de atopia. Por outro lado, se o cachorro for introduzido no lar após os 2 anos de vida ocorre o contrário: aumenta a chance da criança desenvolver alergia.<br />\n<br />\nGern JE, Reardon CL, Hoffjan S, Nicolae D, Li Z, Roberg KA, et al. Effects of dog ownership and genotype on immune development and atopy in infancy. J Allergy Clin Immunol. <br />\n','','','Dra. Luciana Zigna','1'),(25,'ANTITUSSÍGENOS E ANTIGRIPAIS SÃO INEFICAZES PARA CRIANÇAS','2014-08-21 20:56:29','Reportagem apresentada pelo Jornal Folha de São Paulo trouxe à discussão algo muito recorrente e importante: o uso de antitussígenos e antigripais em crianças resfriado (\"viroses\").<br />\nUma revisão de 27 estudos com 5117 adultos e crianças mostrou que práticas comuns para resfriado (combinação de antialérgicos, descongestionantes e analgésicos) não têm comprovação científica.  <br />\n<br />\nPara adultos e crianças acima de 6 anos o uso desses medicamentos poderia apresentar uma melhora de apenas  20 a 30% dos sintomas mas com frequentes efeitos colaterais (cefaleia, sonolência, irritabilidade, etc.). <br />\n<br />\nPara crianças abaixo de 6 anos não há evidência de eficácia e segurança. Em outras palavras, não funcionam e os efeitos colaterais podem ser pior que o próprio resfriado!<br />\n<br />\nDa mesma forma, outra revisão, agora abordando melhora da tosse aguda que acompanha o resfriado, revisou 25 estudos onde utilizou-se xaropes vendidos sem prescrição médica. A conclusão foi a mesma: ausência de eficácia para justificar seu uso. <br />\n<br />\nPortanto, o melhor tratamento continua sendo hidratação e repouso. Além disto, estudos indicam que 1 colher de sobremesa de mel à noite pode melhorar a tosse parcialmente<br />\n','','','Dr. Eduardo Leite ','1'),(26,'PROVA PARA RESIDÊNCIA DE PNEUMOLOGIA E ALERGIA PEDIÁTRICA','2014-09-27 11:58:27','O Hospital Infantil João Paulo II - FHEMIG é um dos hospitais participantes do PSU (Processo Seletivo Unificado)  e oferece 3 vagas para área de atuação em Pneumologia Pediátrica. A residência de Pneumologia Pediátrica tem duração de 2 anos e é credenciada pelo MEC.<br />\n<br />\nFique atendo para a inscrição, no momento programada para o período de 07/10/2014 a 15/10/2014, sujeito a alterações. <u>A data prova está marcada para 16/11/2014</u><br />\n<br />\nMaiores informações no site: http://www.aremg.org.br/processo-seletivo <br />\n','','','Luciana Zignago','1'),(27,'CARIMBO <U>NÃO</U> É OBRIGATÓRIO NA PRESCRIÇÃO MÉDICA','2014-10-12 10:46:19','No entendimento do Concelho Federal de Medicina (CFM), basta que as receitas contenham a assinatura com identificação do médico em letra de forma e o respectivo CRM. O Parecer CFM aborda a diretriz que aponta a marca do carimbo médico como facultativa na prescrição, desde que o documento possua a assinatura com identificação clara e, o respectivo registro do profissional no Conselho Regional de Medicina (CRM).<br />\n<br />\nA declaração foi emitida em resposta a questionamentos do Ministério da Saúde. Na resposta: “Não há obrigatoriedade legal ou ética” para uso do carimbo e, não há “proibição expressa para eventuais autoprescrições de médicos”.<br />\n','','','Dra. Luciana Zigna','1');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:38:55
