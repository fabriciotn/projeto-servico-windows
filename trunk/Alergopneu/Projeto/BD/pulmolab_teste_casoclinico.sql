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
-- Table structure for table `casoclinico`
--

DROP TABLE IF EXISTS `casoclinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casoclinico` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(83) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  `data_cadastro` varchar(19) DEFAULT NULL,
  `texto` varchar(3) DEFAULT NULL,
  `arquivo` varchar(49) DEFAULT NULL,
  `imagem2` varchar(3) DEFAULT NULL,
  `autor` varchar(33) DEFAULT NULL,
  `modelo` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casoclinico`
--

LOCK TABLES `casoclinico` WRITE;
/*!40000 ALTER TABLE `casoclinico` DISABLE KEYS */;
INSERT INTO `casoclinico` VALUES (4,'FEVEREIRO 2014:<b> DERRAME PLEURAL COM PREDOMÍNIO DE LINFÓCITOS </b>','2014-02-28','2014-05-21 20:42:45','','02-2014-PNM micoplasma_21_5_2014.pdf',NULL,'Dra. Fernanda Junqueira Flausino',NULL),(5,'MARÇO 2014:<b> LACTENTE COM TAQUIPNÉIA DESDE AS PRIMEIRAS SEMANAS DE VIDA</b>','2014-03-31','2014-05-21 20:44:07','','03-2014-enfisema lobar congênito_21_5_2014.pdf',NULL,'Dra. Renata Guedes de Castro Cunh',NULL),(6,'ABRIL 2014: <b>LACTENTE COM LESÕES PULMONARES CÍSTICAS</b>','2014-04-30','2014-05-21 20:49:03','','04-2014-Histiocitose_21_5_2014.pdf',NULL,'Dra. Renata Guedes de Castro Cunh',NULL),(7,'MAIO 2014: <b>ESCOLAR COM TOSSE CRÔNICA</b>','2014-05-31','2014-06-02 20:32:17','','05-2014-acalasia_2_6_2014.pdf',NULL,'Dra. Andréia Neves',NULL),(8,'JUNHO 2014: <b> PNEUMONIA DE DIFÍCIL RESOLUÇÃO','2014-06-30','2014-08-19 21:54:06','','06-2014 - corpo estranho_19_8_2014.pdf',NULL,'Dra. Andréia Neves',NULL),(11,'JULHO 2014: <b>PRE ESCOLAR COM PNEUMONIA INTERSTICIAL,</b>','2014-07-30','2014-08-19 22:04:41','','07-2014-proteinose alveolar_19_8_2014.pdf',NULL,'Dra. Lorena Girardi',NULL),(12,'AGOSTO 2014:<b> PNM DE EVOLUÇÃO ARRASTADA</b>','2014-08-30','2014-10-03 18:14:56','','08-2014-pnm de evolução arrastada_3_10_2014.pdf',NULL,'Dra. Lorena Girardi',NULL),(13,'SETEMBRO 2014:<b>NÓDULO PRÉ-AURICULAR DE EVOLUÇÃO ARRASTADA</b>','2014-09-30','2014-10-13 21:24:20','','09-2014 tuberculose ganglionar_13_10_2014.pdf',NULL,'Dra. Renata Guedes de Castro Cunh',NULL),(14,'OUTUBRO 2014: LACTENTE COM EVENTO AMEAÇADOR A VIDA','2014-10-31','2014-11-03 20:49:31','','10-2014 ALTE_3_11_2014.pdf',NULL,'Dra. Renata Guedes de Castro Cunh',NULL);
/*!40000 ALTER TABLE `casoclinico` ENABLE KEYS */;
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
