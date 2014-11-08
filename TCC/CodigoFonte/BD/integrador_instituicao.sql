CREATE DATABASE  IF NOT EXISTS `integrador` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `integrador`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
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
-- Table structure for table `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instituicao` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'CODIGO DA INSTITUIÇAO',
  `NOME` varchar(100) NOT NULL DEFAULT '' COMMENT 'NOME DA INSTITUIÇAO',
  `ENDERECO` varchar(100) DEFAULT NULL COMMENT 'ENDEREÇO DA INSTITUIÇAO',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Tabela de Instituição';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicao`
--

LOCK TABLES `instituicao` WRITE;
/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
INSERT INTO `instituicao` VALUES (2,'FUNCAÇÃO HEMOMINAS','ALAMEDA EZEQUIEL DIAS, 321'),(3,'HOSP JOAO XXIII','Avenida Dr. Cristiano Rezende, 2505, Araguaia (Barreiro de Cima)'),(4,'HOSP JULIA KUBISTCHEK','Rua Gabirobas, 01, Vila Clóris'),(5,'HOSP MADRE TERESA','Rua Felizarda Esquerda, 45, Bairro Ilha Recreio'),(6,'HOSP LUXEMBURGO','Rua Salvador Gonçalves Diniz, 191, Bairro Jardim Brasília'),(7,'HOSP MAT ERNESTO GAZOLLI','Rua da Glória, 469, Bairro Centro'),(8,'HOSP MAT ODETE VALADARES','Rua José Gabriel Medef, 221, Bairro Padre Libério'),(9,'HOSP MAT SANTA FE','Rua Antônio de Paula, 160, Bairro Centro'),(10,'HOSP MILITAR','Rua Rui Barbosa, 149, Bairro Centro'),(11,'HOSP MUNICIPAL ODILON BEHRENS','Rua 5 A (entre 38 e 40), s/n, Bairro Progresso');
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-08 13:18:13
