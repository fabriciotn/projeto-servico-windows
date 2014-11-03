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
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(38) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `pagina` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'Pneumotox','Site mais completo que existe em relação a doenças pulmonares induzidas por drogas.','http://pneumotox.com/'),(2,'SBPT','Site da Sociedade Brasileira de Pneumologia e Tisiologia.','#'),(3,'SBAI','Site da Associação Brasileira de Alergia e Imunologia.','#'),(4,'FDA','Site do Food and Drug Administration, o famoso FDA. Possui informações preciosas e atualizadas em todos os campos da medicina e da nutrição.','http://www.fda.gov/'),(5,'Ped Lung','Site do PEDLUNG. Ótima opção para quem quer se manter atualizado na área de Pneumologia Pediátrica. Trata-se de uma lista de discussão onde são apresentadas as mais diferentes questões da área que são discutidas pelos maiores especialistas Pneumologia Ped','http://www.ped-lung.org/'),(6,'CDC','Site do Center of Disease Control, o famoso CDC americano. Contem as mais recentes informações na área de infectologia e epidemiologia. Acesse a publicação principal deles: MMWR. Trata-se de revistra gratuíta com o que há mais de atualizado na área.','http://www.cdc.gov/'),(7,'Emedicine','Site com vários artigos de revisão periodicamente atualizados. Além disto apresenta um ótimo arquivo de imagens.','http://emedicine.medscape.com/'),(8,'AAAAI','Site da Academia Americana de Alergia Asma e Imunologia.','http://www.aaaai.org/'),(9,'Anatomia Humana em imagens e ilustraes','Site simplesmente fantástico, com anatomia radiológica do torax e tudo mais. Imperdível!','http://www.imaios.com/en/e-Anatomy');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:38:57
