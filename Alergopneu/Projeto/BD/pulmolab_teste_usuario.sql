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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(37) DEFAULT NULL,
  `email` varchar(37) DEFAULT NULL,
  `senha` varchar(7) DEFAULT NULL,
  `trocaSenha` varchar(1) DEFAULT NULL,
  `nivel` varchar(1) DEFAULT NULL,
  `dataUltimoLogin` datetime DEFAULT NULL,
  `acesso` varchar(1) DEFAULT NULL,
  `obs` varchar(83) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Jhonatan','jhonatan.galdino@hbatecnologia.com.br','123456','1','1','0000-00-00 00:00:00','1','Desenvolvedor HBA Tecnologia Responsável pelo desenvolvimento do site e ferramentas'),(2,'Tainara','tainara.roberta@hbatecnologia.com.br','123123','1','1','2014-03-18 21:53:48','1','Web Designer HBA Tecnologia Responsável pelo design do site'),(3,'Wilson Rocha Filho','wrocha55@terra.com.br','963696','1','1','2014-11-03 20:47:26','1','Administrador geral do site'),(4,'Simone Nabuco de Senna','snsenna@terra.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(5,'José Semionato Filho','jose.semionato@gmail.com','123456','0','2','2014-03-18 21:52:05','0',''),(9,'Luiza Cristina Gomes Delfim','ldelfim@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(10,'Francisco Caldeira Reis','fjcreis@gold.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(11,'Marcia Maria Leonardo','marciaml69@terra.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(16,'Mariana Scalco','maryscalco207@yahoo.com.br','123456','0','2','2014-03-18 21:55:02','0',''),(17,'Lorena Nunes','nuneslore@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','1',''),(18,'Carla Gervásio','carlagerva@hotmail.com','123456','0','3','0000-00-00 00:00:00','1',''),(19,'Aline Monteze Alves','alinemonteze@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','1',''),(20,'Ana Karolina Mariano Ferreira','anakarolina_mf@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','1',''),(21,'Suzana Fonseca de Oliveira Melo','sfmelo@hotmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(22,'Alessandra Trindade Cambraia','alecambraia@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(23,'Mariana Faria Scalco','maryscalco207@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(24,'Mariana Faria Scalco','mad@mmmm.com','123456','0','2','0000-00-00 00:00:00','0',''),(25,'Maria Faria Scalco','maryscalco207@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(26,'Nicole Duarte Discacciati','nicolediscacciati@hotmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(27,'Cristina Carneiro Pita','cristinacpita@yahoo.com','123456','0','3','0000-00-00 00:00:00','0',''),(29,'Cintia Cristiane Passos','cintiacpassos@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(30,'Francisco Caldeira Reis','fjcreis@gold.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(31,'José Semionato Filho','jose.semionato@gmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(32,'Luiza Cristina Gomes Delfim','ldelfim@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(33,'Marcia Maria Leonardo','marciaml69@terra.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(34,'Mariana Scalco','maryscalco207@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(35,'Simone Nabuco de Senna','snsenna@terra.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(36,'Suzana Fonseca de Oliveira Melo','sfomelo@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(37,'Rita de Cássia Guede s Azevedo','fisioritaguedes@hotmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(38,'Raquel dos Santos Malheiros','raquelmalheiros@hotmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(39,'Maria Faria Scalco','maryscalco207@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(41,'Maria Faria Scalco','maryscalco207@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(42,'Raquel dos Santos Malheiros','raquelmalheiros@hotmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(43,'CARLA DE OLIVEIRA GERVÃSIO','carlagervaped@hotmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(44,'Cintia Cristiane Passos','cintiacpassos@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(46,'Marcelo Coelho Nogueira','mcoelhonogueira@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(47,'Cintia Cristiane Passos','cintiapassos@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(48,'Angela Teresinha Soares Frossard','angelafrossard@gmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(49,'Milene Alves Gomes','Milene.enfermagem@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(50,'Fabiana Maria da Silva','fabiana3010@gmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(51,'Analice Val de Paula','analicevp@hotmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(52,'Luciana Giarolla de Matos','lugiarolla@hotmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(53,'Analice Val de Paula','analicevp@hotmail.com','123456','0','3','0000-00-00 00:00:00','0',''),(54,'Luciana Giarolla de Matos','lugiarolla@hotmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(55,'Carolina Haddad Martins','calumartins@hotmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(56,'Cristiane Cenachi Coelho','cccoelho@terra.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(57,'Evanirso da Silva Aquino','evanirso-aquino@uol.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(58,'HBA TESTE','jhonatan.galdino@hba.com.br','1234567','1','3','0000-00-00 00:00:00','0',''),(59,'Silvéster','silvester.silva@hba.com.br','993520','1','1','0000-00-00 00:00:00','1','Desenvolvedor HBA Tecnologia Responsável pelo desenvolvimento do site e ferramentas'),(60,'Marcia Regina Fantoni Torres','marciaft@medicina.ufmg.br','123456','0','2','0000-00-00 00:00:00','0',''),(61,'Luciana Zignago Moreira dos Santos','luzignago@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(62,'Eduardo Lima Leite PraÃ§a','edulima_gar@yahoo.com.br','654321','1','2','2014-03-18 22:22:52','0',''),(63,'Fernanda Junqueira Flausino','nandasvm@yahoo.com.br','123456','0','3','2014-03-23 20:18:01','0',''),(64,'Eduardo Lima Leite PraÃ§a','edulima_gar@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(65,'Sarah Costa Drumond de O Moura','sarahfisio2000@gmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(66,'Sarah Costa Drumond de Oliveira Moura','sarahfisio2000@gmail.com','123456','0','2','0000-00-00 00:00:00','0',''),(67,'Fernanda','nandasvm','123456','0','3','0000-00-00 00:00:00','0',''),(68,'Fernanda Junqueira Flausino','nandasvm@yahoo.com.br','123456','0','2','0000-00-00 00:00:00','0',''),(69,'Fernanda Junqueira Flausino','nandasvm@yahoo.com.br','123456','0','3','0000-00-00 00:00:00','0',''),(70,'NutricionistasForum','teste','654321','1','2','2014-04-07 23:05:10',NULL,NULL),(88,'Maildes','ecaptein@gmail.com','123456','0','2',NULL,NULL,NULL),(89,'informação','ecaptein@gmail.com','123456','0','2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:39:00
