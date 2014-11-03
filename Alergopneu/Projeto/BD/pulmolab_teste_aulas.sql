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
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulas` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(52) DEFAULT NULL,
  `arquivo` varchar(73) DEFAULT NULL,
  `obs` varchar(105) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (21,'Tosse a visão do pneumologista','tosse-visão do pneumologista2014.pdf','Aula proferida no dia 05/04/2014 no II Simpósio de Doenças Respiratórias do Inverno em Crianças e Adolesc','2014-5-4'),(22,'Bronquite Bacteriana Protraída','bronquite bacteriana protraida.pdf','Aula programada para o dia 03/05/2014 no Congresso Brasileiro de Pneumologia Pediátrica em Porto de Galin','2014-3-5'),(23,'Pneumonias Virais','pneumonias virais-gaucho2014.pdf','Aula proferida no dia 17/05/2014 no VII Congresso Gaúcho de Atualização em Pediatria, realizado em Porto ','2014-5-17'),(29,'Novidades no diagnóstico e tratamento das alergias','novidades no diagnóstico e tratamento-curitiba2014.pdf','Aula proferida no dia 24/05/2014 na V Jornada Multidisciplinar de Inverno em Curitiba','2014-5-24'),(30,'Sí­ndrome do Crupe','crupe_28_8_2014.pdf','Aula proferida em 30/08/2014 no Curso de Atualização: Cuidando dos ouvidos, nariz e garganta das crianças','2014-8-30');
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:39:03
