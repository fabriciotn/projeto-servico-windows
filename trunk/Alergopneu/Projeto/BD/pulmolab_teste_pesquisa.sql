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
-- Table structure for table `pesquisa`
--

DROP TABLE IF EXISTS `pesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesquisa` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(61) DEFAULT NULL,
  `data` varchar(19) DEFAULT NULL,
  `texto` varchar(1678) DEFAULT NULL,
  `imagem1` varchar(0) DEFAULT NULL,
  `imagem2` varchar(0) DEFAULT NULL,
  `autor` varchar(22) DEFAULT NULL,
  `modelo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesquisa`
--

LOCK TABLES `pesquisa` WRITE;
/*!40000 ALTER TABLE `pesquisa` DISABLE KEYS */;
INSERT INTO `pesquisa` VALUES (1,'VACINA ORAL PARA PACIENTES ALÉRGICOS A LEITE DE VACA','05/07/2011 19:12:26','Alergia alimentar em crianças é muito freqüente no Brasil. Acredita-se que cerca de 5% das crianças brasileiras possuem algum tipo de alergia alimentar. No Brasil ovo e leite são responsáveis por mais de 90% das alergias alimentares. Crianças com alergia à proteína do leite apresentam reações variadas que vão desde urticárias até choque anafilático. <br />\n<br />\nO único tratamento eficaz disponível é colocar a criança em dieta livre de leite e derivados até que o paciente desenvolva tolerância imunológica. Como a proteína do leite faz parte de inúmeros alimentos industrializados é muito difícil evitá-la completamente. Mesmo com educação e treinamento, a maioria dos pacientes com alergia ao leite terá ingestão acidental de alimentos que contém leite. Essa ingestão acidental pode causar desde sintomas como urticária até anafilaxia e óbito. <br />\n<br />\nPortanto, um tratamento para induzir uma tolerância imunológica, permitindo ao paciente ingerir leite de vaca e derivados sem problemas, teria um impacto significativo na qualidade de vida do paciente e sua família. Este tratamento já existe!<br />\n<br />\nA equipe de Pneumologia e Alergia do Hospital João Paulo II e Hospital Felício Rocho, em parceria com a Universidade Federal de Minas Gerais, está desenvolvendo um estudo, cujo objetivo é ajudar crianças alérgicas a leite de vaca a desenvolver tolerância ao leite mais rapidamente. Este tratamento consiste em administrar por via oral vacina com a proteína do leite de vaca.  A duração do tratamento é de aproximadamente 2 anos sendo totalmente <u>sem ônus</u> para a família envolvida.  <br />\n<br />\nPara maiores informações entre em contato conosco<br />','','','Wilson Rocha Filho','1'),(2,'DIETA EXTENSAMENTE AQUECIDA NO TRATAMENTO DA ALERGIA ALIMENAR','14/02/2013 10:02:39','Uma vez diagnosticada alergia alimentar, o único tratamento comprovado é a eliminação do alimento da dieta. Dietas restritivas afetam negativamente a qualidade de vida da criança, seus familiares e cuidadores.<br />\n<br />\nEstudos indicam que até 70% das crianças alérgicas à proteína do leite de vaca ou à do ovo toleram o alimento assado em altas temperaturas. Além disto, pacientes que toleram o alimento assado a altas temperaturas tendem a perder a alergia mais rapidamente.<br />\n<br />\nEstudo em andamento em nosso serviço tem o objetivo de oferecer alimentos que contem leite de vaca ou ovo extensamente aquecidos a pacientes alérgicos a estes alimentos.Tratata-se de uma nova forma de tratamento que pode beneficiar muito a criança alérgica a leite ou ovo, melhorando a qualidade de vida do paciente e toda a família<br />\n<br />\nOs interessados devem entrar em contato pelo telefone +31-9216-0523','','','Dra. Lorena Girardi','1');
/*!40000 ALTER TABLE `pesquisa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:38:54
