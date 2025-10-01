-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: host.docker.internal    Database: neoprint-ura
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id` binary(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `inativo` bit(1) NOT NULL,
  `regiao` tinyint DEFAULT NULL,
  `segmento` tinyint DEFAULT NULL,
  `id_cliente` binary(16) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `descricao_material` varchar(255) DEFAULT NULL,
  `canal` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `clientes_chk_1` CHECK ((`regiao` between 0 and 3)),
  CONSTRAINT `clientes_chk_2` CHECK ((`segmento` between 0 and 6)),
  CONSTRAINT `clientes_chk_3` CHECK ((`canal` between 0 and 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conversas`
--

DROP TABLE IF EXISTS `conversas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversas` (
  `coleta_nome` bit(1) DEFAULT NULL,
  `coleta_regiao` bit(1) DEFAULT NULL,
  `coleta_segmento` bit(1) DEFAULT NULL,
  `encerrada` bit(1) DEFAULT NULL,
  `escolha_comercial` bit(1) DEFAULT NULL,
  `escolha_comercial_recontato` bit(1) DEFAULT NULL,
  `escolha_financeiro` bit(1) DEFAULT NULL,
  `escolha_logistica` bit(1) DEFAULT NULL,
  `finalizada` bit(1) DEFAULT NULL,
  `inativa` bit(1) DEFAULT NULL,
  `mensagem_inicial` bit(1) DEFAULT NULL,
  `tipo_ultima_mensagem` tinyint DEFAULT NULL,
  `data_criacao` datetime(6) DEFAULT NULL,
  `ultima_mensagem` datetime(6) DEFAULT NULL,
  `ultima_mensagem_conversa_finalizada` datetime(6) DEFAULT NULL,
  `vendedor_id_vendedor` bigint DEFAULT NULL,
  `cliente_id_cliente` binary(16) DEFAULT NULL,
  `id_conversa` binary(16) NOT NULL,
  `mensagem_coleta` varbinary(255) DEFAULT NULL,
  `mensagem_direcionamento` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id_conversa`),
  UNIQUE KEY `UKox9k01tt0dxxdwdh9yb82qsl2` (`cliente_id_cliente`),
  KEY `FKcu6q353yuyp02wfdqh8i2g9h5` (`vendedor_id_vendedor`),
  CONSTRAINT `FKcu6q353yuyp02wfdqh8i2g9h5` FOREIGN KEY (`vendedor_id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  CONSTRAINT `FKsghu45fbsxh3idaiqxs2jp8rq` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `conversas_chk_1` CHECK ((`tipo_ultima_mensagem` between 0 and 15))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conversas_agente`
--

DROP TABLE IF EXISTS `conversas_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversas_agente` (
  `id_conversa` binary(16) NOT NULL,
  `data_criacao` datetime(6) DEFAULT NULL,
  `finalizada` bit(1) DEFAULT NULL,
  `inativa` bit(1) DEFAULT NULL,
  `cliente_id_cliente` binary(16) DEFAULT NULL,
  `vendedor_id_vendedor` bigint DEFAULT NULL,
  `data_ultima_mensagem` datetime(6) DEFAULT NULL,
  `recontato` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_conversa`),
  UNIQUE KEY `UKkoswwkurhtundj6gs1rtq8t95` (`cliente_id_cliente`),
  KEY `FKgaynr6vui45qff47snif7mxb8` (`vendedor_id_vendedor`),
  CONSTRAINT `FK1a0gtx2idaegeyiirc2xf7dh8` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `FKgaynr6vui45qff47snif7mxb8` FOREIGN KEY (`vendedor_id_vendedor`) REFERENCES `vendedores` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensagens_conversa`
--

DROP TABLE IF EXISTS `mensagens_conversa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagens_conversa` (
  `id_mensagem_conversa` binary(16) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `conteudo` varchar(2000) NOT NULL,
  `id_conversa` binary(16) NOT NULL,
  `data` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_mensagem_conversa`),
  KEY `id_conversa` (`id_conversa`),
  CONSTRAINT `mensagens_conversa_ibfk_1` FOREIGN KEY (`id_conversa`) REFERENCES `conversas_agente` (`id_conversa`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outros_contatos`
--

DROP TABLE IF EXISTS `outros_contatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outros_contatos` (
  `setor` tinyint DEFAULT NULL,
  `id_outro_contato` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_outro_contato`),
  CONSTRAINT `outros_contatos_chk_1` CHECK ((`setor` between 0 and 3))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `inativo` bit(1) DEFAULT NULL,
  `id_vendedor` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `regioes` varbinary(255) DEFAULT NULL,
  `segmentos` varbinary(255) DEFAULT NULL,
  `prioritario` bit(1) DEFAULT NULL,
  `valor` int DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-01 16:22:00
