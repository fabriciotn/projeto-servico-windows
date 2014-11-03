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
-- Table structure for table `protocolos`
--

DROP TABLE IF EXISTS `protocolos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocolos` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(34) DEFAULT NULL,
  `arquivo` varchar(68) DEFAULT NULL,
  `obs` varchar(220) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocolos`
--

LOCK TABLES `protocolos` WRITE;
/*!40000 ALTER TABLE `protocolos` DISABLE KEYS */;
INSERT INTO `protocolos` VALUES (44,'ASMA DE DIFÍCIL CONTROLE','ASMA_DE_DIFÍCIL_CONTROLE_2011_2_13_18_38_40.pdf','','13/02/2011'),(46,'DERMATITE ATÓPICA: ESCORE CLÍNICO','DERMATITE_ATÓPICA__ESCORE_CLÍNICO_2011_2_15_21_0_19.pdf','','15/02/2011'),(47,'FIBROSE CÍSTICA: ESCORE SHWACHMAN','FIBROSE_CÍSTICA__ESCORE_DE_SHWACHMAN_2011_2_15_21_17_3.pdf','','15/02/2011'),(49,'RISCO CIRÚRGICO PULMONAR','RISCO_CIRÚRGICO_PULMONAR_2011_2_16_21_13_5.pdf','','16/02/2011'),(50,'PNEUMOTÓRAX: COMO CONDUZIR','PNEUMOTÓRAX__COMO_CONDUZIR_2011_2_18_19_57_12.pdf','','18/02/2011'),(53,'URTICÁRIA CRÕNICA: PROPEDÊUTICA','URTICÁRIA_CRÕNICA__PROPEDÊUTICA_2011_2_18_20_18_5.pdf','','18/02/2011'),(55,'TUBERCULOSE: DIAGNÓSTICO','TUBERCULOSE__DIAGNÓSTICO_2011_3_1_20_46_43.pdf','','01/03/2011'),(57,'PNEUMONIA - QUANDO INTERNAR','PNEUMONIA_-_QUANDO_INTERNAR_2011_3_6_8_40_54.pdf','','06/03/2011'),(58,'PNEUMONIA: VÍRUS OU BACTÉRIA','PNEUMONIA__VÍRUS_OU_BACTÉRIA_2011_3_26_17_3_4.pdf','','26/03/2011'),(59,'PICO DE FLUXO EM CRIANÇAS','PICO_DE_FLUXO_2011_4_2_10_31_6.pdf','','02/04/2011'),(60,'AMIGDALITE: CRITÉRIOS DIAGNÓSTICOS','AMIGDALITE_BACTERIANA__CRITÉRIOS_DIAGNÓSTICOS_2012_5_22_21_12_57.pdf','O diagnóstico de amigdalite bacteriana frequentemene é feito de forma errada levando ao uso desnecessário de antibióticos. Usando os critérios acima você diagnosticará com mais critério, aumentando a sua margem de acerto','22/05/2012');
/*!40000 ALTER TABLE `protocolos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:38:58
