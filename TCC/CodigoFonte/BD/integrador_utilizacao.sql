CREATE DATABASE  IF NOT EXISTS `integrador` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `integrador`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: integrador
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `utilizacao`
--

DROP TABLE IF EXISTS `utilizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilizacao` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID DA UTILIZAÇAO',
  `COD_PACIENTE` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'CODIGO DO PACIENTE',
  `COD_HEMOCOMPONENTE` varchar(12) NOT NULL DEFAULT '0' COMMENT 'CODIGO DO HEMOCOMPONENTE',
  `DATA` date NOT NULL DEFAULT '0000-00-00' COMMENT 'DATA DA UTILIZAÇAO',
  `MOTIVO` varchar(100) NOT NULL DEFAULT '' COMMENT 'MOTIVO DA UTILIZAÇAO DO HEMOCOMPONENTE',
  `RESPONSAVEL` varchar(50) NOT NULL DEFAULT '' COMMENT 'RESPONSAVEL PELO PROCENDIMENTO',
  `OBS` text COMMENT 'OBSERVAÇOES',
  `COD_INSTITUICAO` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'CODIGO DA INSTITUIÇAO',
  PRIMARY KEY (`ID`),
  KEY `FK_utilizacao_1` (`COD_PACIENTE`),
  KEY `FK_utilizacao_2` (`COD_HEMOCOMPONENTE`),
  KEY `FK_utilizacao_3` (`COD_INSTITUICAO`),
  CONSTRAINT `FK_utilizacao_1` FOREIGN KEY (`COD_PACIENTE`) REFERENCES `paciente` (`ID`),
  CONSTRAINT `FK_utilizacao_2` FOREIGN KEY (`COD_HEMOCOMPONENTE`) REFERENCES `hemocomponente` (`CODIGO`),
  CONSTRAINT `FK_utilizacao_3` FOREIGN KEY (`COD_INSTITUICAO`) REFERENCES `instituicao` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TABELA DE REGISTRO DE UTILIZAÇÃO DOS HEMOCOMPONENTES';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizacao`
--

LOCK TABLES `utilizacao` WRITE;
/*!40000 ALTER TABLE `utilizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilizacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-28 12:57:00