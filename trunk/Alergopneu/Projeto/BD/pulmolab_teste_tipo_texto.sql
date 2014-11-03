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
-- Table structure for table `tipo_texto`
--

DROP TABLE IF EXISTS `tipo_texto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_texto` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_texto`
--

LOCK TABLES `tipo_texto` WRITE;
/*!40000 ALTER TABLE `tipo_texto` DISABLE KEYS */;
INSERT INTO `tipo_texto` VALUES (1,'Estrutura'),(2,'Estrutura-Pós'),(3,'Pós-Graduação'),(4,'Consultas SUS'),(5,'Consultas Convênios'),(6,'Pulmolab - Laboratório de Alergia e Pneumologia'),(7,'Exames Laboratoriais - Outros'),(8,'Fibrose Cística'),(9,'Doença de Gaucher'),(10,'Resumo das Atividades da Pós Graduação'),(11,'ESTÁGIO ENFERMARIA – HOSPITAL INFANTIL JOAO PAULO II - Obrigações do residente'),(12,'ESTÁGIO AMBULATÓRIO HOSPITAL INFANTIL JOAO PAULO II R1 - Obrigações do residente'),(13,'ESTÁGIO ESPECIALIDADE 1 - Obrigações do residente'),(14,'ESTÁGIO ENFERMARIA  HFR / PULMOLAB - Obrigações do residente'),(15,'ESTÁGIO AMBULATÓRIO R2 - Obrigações do residente'),(16,'ESTÁGIO ESPECIALIDADES 2 - Obrigações do residente'),(17,'CARGA HORÁRIA – 1º ANO'),(18,'CARGA HORÁRIA – 2º ANO');
/*!40000 ALTER TABLE `tipo_texto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:39:01
