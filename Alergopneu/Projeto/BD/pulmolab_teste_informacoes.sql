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
-- Table structure for table `informacoes`
--

DROP TABLE IF EXISTS `informacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacoes` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(72) DEFAULT NULL,
  `titulo` varchar(48) DEFAULT NULL,
  `texto` varchar(123) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  `titulo_arquivo` varchar(3) DEFAULT NULL,
  `cod_categoria_informacoes` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacoes`
--

LOCK TABLES `informacoes` WRITE;
/*!40000 ALTER TABLE `informacoes` DISABLE KEYS */;
INSERT INTO `informacoes` VALUES (46,'PICADAS_DE_INSETOS_2011_10_31_20_12_19.pdf','PICADAS DE INSETOS','Dicas para tratar alergia a picadas de inseto!','31/10/2011','\\N','\\N'),(48,'ANAFILAXIA__FATORES_DE_RISCO_2011_10_31_20_34_43.pdf','FATORES DE RISCO','Saiba quais os fatores de risco para um choque anafilático e quais os riscos de uma reação anafilática grave!','31/10/2011','\\N','1'),(49,'ANAFILAXIA__PLANO_DE_AÇÃO_2011_10_31_20_38_30.pdf','PLANO DE AÇÃO','Saiba o que fazer diante de um choque anafilático','31/10/2011','\\N','1'),(50,'ANAFILAXIA__TRATAMENTO_2011_10_31_20_40_11.pdf','TRATAMENTO','Dicas sobre o tratamento do choque anafilático','31/10/2011','\\N','1'),(52,'ANAFILAXIA__COMO_IDENTIFICAR_2011_10_31_20_48_8.pdf','COMO IDENTIFICAR','Aqui você fica sabendo como detectar se uma pessoa está tendo um choque anafilático!','31/10/2011','\\N','1'),(74,'ANTIBIÓTICOS__USOS_E_ABUSOS_2012_1_11_20_32_46.pdf','ANTIBIÓTICOS: USOS E ABUSOS','Saiba porque os antibíóticos, muitas vezes, são prescritos desnecessariamente','11/01/2012','\\N','\\N'),(82,'ALIMENTOS_RICOS_EM_CÁLCIO_2012_7_4_20_34_40.pdf','ALIMENTOS RICOS EM CÁLCIO','Se você não pode ingerir leite e derivados, saiba como repor o cálcio na sua dieta','04/07/2012','\\N','2'),(83,'ADITIVOS_ALIMENTARES__FATO_OU_FICÇÃO_2012_7_4_20_38_9.pdf','ADITIVOS ALIMENTARES: FATO OU FICÇÃO','Não se preocupe com aditivos e corantes. Saiba porque!','04/07/2012','\\N','2'),(84,'ALERGIA_ALIMENTAR_E_REÇÃO_COM_OUTROS_ALIMENTOS_2012_7_4_20_42_59.pdf','ALERGIA ALIMENTAR E REÇÃO COM OUTROS ALIMENTOS','Se você é alérgico a um determinado alimento, saiba qual a possibilidade de você reagir com outro alimento - reação cruzada','04/07/2012','\\N','2'),(85,'BISCOITOS_SEM_LEITE_E_OVO_2012_7_4_20_48_28.pdf','BISCOITOS SEM LEITE E OVO','Confira lista de biscoitos que não contem leite nem ovo','04/07/2012','\\N','2'),(88,'TESTE_DE_CONTROLE_DE_ASMA_-_4_a_11_anos_2012_7_23_20_50_16.pdf','TESTE DE CONTROLE DE ASMA - 4 a 11 anos','Avalia se crianças entre 4 e 11 anos estão com a asma sob controle','23/07/2012','\\N','3'),(89,'TESTE_DE_CONTROLE_DE_ASMA_-_a_partir_dos_12_anos__2012_7_23_21_35_53.pdf','TESTE DE CONTROLE DE ASMA - a partir dos 12 anos','Avalia se pacientes igual ou maiores de 12 anos estão com a asma sob controle','23/07/2012','\\N','3'),(90,'ALERGIAS_RESPIRATÓRIAS_-_E_AGORA?_2012_7_23_21_53_38.pdf','ALERGIAS RESPIRATÓRIAS - E AGORA?','Informções básicas importantes sobre asma e outras alergias respiratórias','23/07/2012','\\N','3'),(112,'FUNGOS_DO_AR_-_MOFOS_2012_8_10_9_2_10.pdf','FUNGOS DO AR - MOFOS','Se você é alérgico a mofo estas inoformações vão lhe ajudar!','10/08/2012','\\N','4'),(114,'ANIMAIS_DE_ESTIMAÇÃO_2012_8_10_9_9_36.pdf','ANIMAIS DE ESTIMAÇÃO','Nem sempre é necessário eliminar cães e gatos. Confira !','10/08/2012','\\N','4'),(119,'PISCINA,_CLORO_E_DOENÇAS_RESPIRATÓRIAS_2012_8_10_9_32_57.pdf','PISCINA, CLORO E DOENÇAS RESPIRATÓRIAS','Você não precisa para de nadar! Saiba porque','10/08/2012','\\N','4'),(122,'ANTIBIÓTICOS__USOS_E_ABUSOS_2014_1_20_22_12_58.pdf','ANTIBIÓTICOS: USOS E ABUSOS','Saiba quando e porque antibióticos são prescritos desnecessariamente','20/01/2014','\\N','0'),(125,'alergia alimentar - guia para leigos_21_5_2014.pdf','ALERGIA ALIMENTAR: O QUE VOCÊ PRECISA SABER!','Um guia para pais e cuidadores','2014-05-21',NULL,'2'),(126,'anafilaxia na escola_21_5_2014.pdf','ANAFILAXIA NA ESCOLA','Um guia para professores e demais funcionários','2014-05-21',NULL,'1'),(128,'1','COMO CONDUZIR','Um guia para todos envolvidos nos cuidados de crianças alérgicas','2014-05-21',NULL,'1'),(129,'ATB - uso e abusos_21_5_2014.pdf','USOS E ABUSOS NA PRESCRIÇÃO DE ANTIBIÓTICOS','Saiba porque se prescreve antibióticos com muita frequência e sem necessidade','2014-05-21',NULL,''),(130,'baratas_21_5_2014.pdf','BARATAS','Algumas pessoas podem ser alérgicas a baratas. Se este é o seu caso, saiba o que fazer','2014-05-21',NULL,'4'),(131,'controle ambiental - ácaro_21_5_2014.pdf','POEIRAS E ÁCAROS','Confira aqui o que você pode fazer para evitar os ácaros domiciliares','2014-05-21',NULL,'4'),(133,'alimentos extensamente aquecidos_1_10_2014.pdf','ALIMENTOS EXTENSAMENTE AQUECIDOS','Algumas crianças alérgicas a leite e/ou a ovo conseguem ingerir alimentos quando aquecidos extensamente, melhorando a quali','2014-10-01',NULL,'2'),(134,'dermatite atópica_16_10_2014.pdf','DERMATITE ATÓPICA','Aqui você encontra as informações mais importantes no diagnóstico e manejo da Dermatite Atópica','2014-10-16',NULL,'');
/*!40000 ALTER TABLE `informacoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-03 21:39:02
