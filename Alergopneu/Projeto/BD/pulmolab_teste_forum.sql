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
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) DEFAULT NULL,
  `ativo` varchar(3) DEFAULT NULL,
  `respondido` varchar(1) DEFAULT NULL,
  `data` varchar(19) DEFAULT NULL,
  `pergunta` varchar(251) DEFAULT NULL,
  `id_pessoa` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'2','\\N','0','11/06/2012 11:13:21','Durante o inverno, o uso de umidifcadores e /ou vaporizadores é eficaz?','0'),(2,'2','\\N','0','11/10/2012 19:02:46','qual e a duração do teste do suor?','0'),(3,'2','\\N','0','02/04/2013 01:31:20','Meu filho sofre de Asma tem tbm dermatite atópica além de ter alergia a lete de vaca. Diante desse quadro. Como posso identificar uma reação anafilática imediatamente?','223'),(4,'2','\\N','0','13/04/2013 18:21:49','Existe indicação para nebulização com clenil a ?','223'),(5,'2','\\N','0','25/04/2013 16:55:22','minha filha tem dermatite atopica e ja passei por 2 medicos en sao joao del rei,so derao hidratante de ureia ,e ela esta muito atacada esta ate ferindo,sera que tem um bom medico que possa me ajudar ja nao aguento mais ver ela cossar e sofrer\nobrigada','223'),(6,'2','\\N','0','17/06/2013 11:57:57','','223'),(7,'2','\\N','0','17/06/2013 11:57:58','','223'),(8,'2','\\N','0','26/06/2013 23:42:09','','223'),(9,'2','\\N','0','26/06/2013 23:42:14','','223'),(10,'2','\\N','0','03/08/2013 18:06:41','','223'),(11,'2','\\N','0','03/08/2013 18:06:47','','223'),(12,'2','\\N','0','15/08/2013 07:04:29','','223'),(13,'2','\\N','0','15/08/2013 07:04:34','','223'),(14,'2','\\N','0','23/12/2013 07:23:17','O meu filho tem uma tosse estridente semelhante a tosse de cachorro, sempre a noite e quando ele dorme ouço a respiração dele que parece ronco.já o levei em varios medicos mais nenhum resolve, qual medicameto devo usar.Obrigado','223'),(15,'2',NULL,'0','2014-03-23 02:44:10','teste','223'),(16,'2',NULL,'0','2014-03-23 02:45:41','teste','223'),(17,'2',NULL,'0','2014-09-11 07:25:17','Minha filha é alérgica mediada por IgE a leite, já teve  episodios de anafilaxia, ela completa  anos dia 25/10/2014, gostaria de saber como está os testes da dessensibilização.','223'),(18,'2',NULL,'0','2014-09-11 07:25:27','Minha filha é alérgica mediada por IgE a leite, já teve  episodios de anafilaxia, ela completa  anos dia 25/10/2014, gostaria de saber como está os testes da dessensibilização.','223');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:38:59
