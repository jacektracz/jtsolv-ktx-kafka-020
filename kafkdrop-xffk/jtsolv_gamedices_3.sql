-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 192.168.55.103    Database: jtsolv_gamedices_03
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lkdg_commerce_user`
--

DROP TABLE IF EXISTS `lkdg_commerce_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_commerce_user` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_commerce_user`
--

LOCK TABLES `lkdg_commerce_user` WRITE;
/*!40000 ALTER TABLE `lkdg_commerce_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lkdg_commerce_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_commerce_user_seq`
--

DROP TABLE IF EXISTS `lkdg_commerce_user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_commerce_user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_commerce_user_seq`
--

LOCK TABLES `lkdg_commerce_user_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_commerce_user_seq` DISABLE KEYS */;
INSERT INTO `lkdg_commerce_user_seq` VALUES (1);
/*!40000 ALTER TABLE `lkdg_commerce_user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_dice`
--

DROP TABLE IF EXISTS `lkdg_dice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_dice` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_dice`
--

LOCK TABLES `lkdg_dice` WRITE;
/*!40000 ALTER TABLE `lkdg_dice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lkdg_dice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_dice_seq`
--

DROP TABLE IF EXISTS `lkdg_dice_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_dice_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_dice_seq`
--

LOCK TABLES `lkdg_dice_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_dice_seq` DISABLE KEYS */;
INSERT INTO `lkdg_dice_seq` VALUES (1);
/*!40000 ALTER TABLE `lkdg_dice_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_game`
--

DROP TABLE IF EXISTS `lkdg_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_game` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_game`
--

LOCK TABLES `lkdg_game` WRITE;
/*!40000 ALTER TABLE `lkdg_game` DISABLE KEYS */;
INSERT INTO `lkdg_game` VALUES (1,'email-1','name-1');
/*!40000 ALTER TABLE `lkdg_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_game_seq`
--

DROP TABLE IF EXISTS `lkdg_game_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_game_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_game_seq`
--

LOCK TABLES `lkdg_game_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_game_seq` DISABLE KEYS */;
INSERT INTO `lkdg_game_seq` VALUES (51);
/*!40000 ALTER TABLE `lkdg_game_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_item`
--

DROP TABLE IF EXISTS `lkdg_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_item` (
  `attempts` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_item`
--

LOCK TABLES `lkdg_item` WRITE;
/*!40000 ALTER TABLE `lkdg_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `lkdg_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_item_result`
--

DROP TABLE IF EXISTS `lkdg_item_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_item_result` (
  `hits_cumulatively` double DEFAULT NULL,
  `percentage_cumulatively` double DEFAULT NULL,
  `state_value_percentage` double DEFAULT NULL,
  `achieved` bigint DEFAULT NULL,
  `game_step_def_id` bigint DEFAULT NULL,
  `game_step_result_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `number_of_attempts` bigint DEFAULT NULL,
  `state_combinations` bigint DEFAULT NULL,
  `state_value` bigint DEFAULT NULL,
  `state_value_achieved` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `game_result_item_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9gbqsh86x4tjivk2or28h12t5` (`game_step_def_id`),
  KEY `FK3pg40xgehksfdjcdnp239qbwp` (`game_step_result_id`),
  CONSTRAINT `FK3pg40xgehksfdjcdnp239qbwp` FOREIGN KEY (`game_step_result_id`) REFERENCES `lkdg_step_result` (`id`),
  CONSTRAINT `FK9gbqsh86x4tjivk2or28h12t5` FOREIGN KEY (`game_step_def_id`) REFERENCES `lkdg_step_def` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_item_result`
--

LOCK TABLES `lkdg_item_result` WRITE;
/*!40000 ALTER TABLE `lkdg_item_result` DISABLE KEYS */;
INSERT INTO `lkdg_item_result` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,62,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,64,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,65,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,66,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,77,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,79,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,80,NULL,NULL,0,NULL,'',NULL,''),(NULL,NULL,NULL,NULL,NULL,NULL,81,NULL,NULL,0,NULL,'',NULL,''),(0,0,0,0,1,1,82,4,4,2,0,'','g',' attempts:4 dices:2 walls:3 min:2 max:6 Percentage cumulatively :0 hits cumulatively:0.0'),(0,0,0,0,1,1,83,4,4,3,0,'','g',' attempts:4 dices:2 walls:3 min:2 max:6 Percentage cumulatively :0 hits cumulatively:0.0'),(4,100,100,4,1,1,84,4,4,4,4,'','g',' attempts:4 dices:2 walls:3 min:2 max:6 Percentage cumulatively :100 hits cumulatively:4.0'),(4,100,0,0,1,1,85,4,4,5,0,'','g',' attempts:4 dices:2 walls:3 min:2 max:6 Percentage cumulatively :100 hits cumulatively:4.0'),(4,100,0,0,1,1,86,4,4,6,0,'','g',' attempts:4 dices:2 walls:3 min:2 max:6 Percentage cumulatively :100 hits cumulatively:4.0');
/*!40000 ALTER TABLE `lkdg_item_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_item_result_seq`
--

DROP TABLE IF EXISTS `lkdg_item_result_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_item_result_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_item_result_seq`
--

LOCK TABLES `lkdg_item_result_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_item_result_seq` DISABLE KEYS */;
INSERT INTO `lkdg_item_result_seq` VALUES (151);
/*!40000 ALTER TABLE `lkdg_item_result_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_item_seq`
--

DROP TABLE IF EXISTS `lkdg_item_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_item_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_item_seq`
--

LOCK TABLES `lkdg_item_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_item_seq` DISABLE KEYS */;
INSERT INTO `lkdg_item_seq` VALUES (1);
/*!40000 ALTER TABLE `lkdg_item_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_object`
--

DROP TABLE IF EXISTS `lkdg_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_object` (
  `game_step_def_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `number_of_parts` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhhq5sowns58y0amwsomu35yct` (`game_step_def_id`),
  CONSTRAINT `FKhhq5sowns58y0amwsomu35yct` FOREIGN KEY (`game_step_def_id`) REFERENCES `lkdg_step_def` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_object`
--

LOCK TABLES `lkdg_object` WRITE;
/*!40000 ALTER TABLE `lkdg_object` DISABLE KEYS */;
INSERT INTO `lkdg_object` VALUES (NULL,1,2,'','a1'),(NULL,2,3,'','d2'),(NULL,52,3,'','as'),(NULL,102,2,'','g2'),(NULL,152,6,'','asd');
/*!40000 ALTER TABLE `lkdg_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_object_part`
--

DROP TABLE IF EXISTS `lkdg_object_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_object_part` (
  `game_object_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrfrft1ib9g2kse0qp4eh9wam6` (`game_object_id`),
  CONSTRAINT `FKrfrft1ib9g2kse0qp4eh9wam6` FOREIGN KEY (`game_object_id`) REFERENCES `lkdg_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_object_part`
--

LOCK TABLES `lkdg_object_part` WRITE;
/*!40000 ALTER TABLE `lkdg_object_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `lkdg_object_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_object_part_seq`
--

DROP TABLE IF EXISTS `lkdg_object_part_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_object_part_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_object_part_seq`
--

LOCK TABLES `lkdg_object_part_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_object_part_seq` DISABLE KEYS */;
INSERT INTO `lkdg_object_part_seq` VALUES (1);
/*!40000 ALTER TABLE `lkdg_object_part_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_object_seq`
--

DROP TABLE IF EXISTS `lkdg_object_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_object_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_object_seq`
--

LOCK TABLES `lkdg_object_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_object_seq` DISABLE KEYS */;
INSERT INTO `lkdg_object_seq` VALUES (251);
/*!40000 ALTER TABLE `lkdg_object_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_part`
--

DROP TABLE IF EXISTS `lkdg_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_part` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_part`
--

LOCK TABLES `lkdg_part` WRITE;
/*!40000 ALTER TABLE `lkdg_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `lkdg_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_part_seq`
--

DROP TABLE IF EXISTS `lkdg_part_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_part_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_part_seq`
--

LOCK TABLES `lkdg_part_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_part_seq` DISABLE KEYS */;
INSERT INTO `lkdg_part_seq` VALUES (1);
/*!40000 ALTER TABLE `lkdg_part_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_sec2_user`
--

DROP TABLE IF EXISTS `lkdg_sec2_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_sec2_user` (
  `lkd_activated` bit(1) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reset_date` datetime(6) DEFAULT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `lang_key` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `lkd_login` varchar(255) DEFAULT NULL,
  `lkd_name` varchar(255) DEFAULT NULL,
  `lkd_user_name` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_sec2_user`
--

LOCK TABLES `lkdg_sec2_user` WRITE;
/*!40000 ALTER TABLE `lkdg_sec2_user` DISABLE KEYS */;
INSERT INTO `lkdg_sec2_user` VALUES (_binary '\0',1,NULL,NULL,'u1','u1',NULL,'pl','u1','u1','u1','u1','$2a$10$axruzTcHYNRIyiWPAHt0W.iwfvEdr4MW9sBsLTi2xdwm95CMD6g1y',NULL),(_binary '\0',2,NULL,NULL,'u2','u2',NULL,'pl','u2','u2','u2','u2','$2a$10$7AeJGNQT4YzVafqNnMxK3OLTWZWPhu5lrTEJ13QIENVdwUToOI2Jq',NULL);
/*!40000 ALTER TABLE `lkdg_sec2_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_step`
--

DROP TABLE IF EXISTS `lkdg_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_step` (
  `attempts` bigint DEFAULT NULL,
  `game_step_def_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKch354qaegyqamy3t2vshmrw09` (`game_step_def_id`),
  CONSTRAINT `FKch354qaegyqamy3t2vshmrw09` FOREIGN KEY (`game_step_def_id`) REFERENCES `lkdg_step_def` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_step`
--

LOCK TABLES `lkdg_step` WRITE;
/*!40000 ALTER TABLE `lkdg_step` DISABLE KEYS */;
INSERT INTO `lkdg_step` VALUES (4,1,1,'','d1');
/*!40000 ALTER TABLE `lkdg_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_step_def`
--

DROP TABLE IF EXISTS `lkdg_step_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_step_def` (
  `attempts` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `objects_number` bigint DEFAULT NULL,
  `primary_game_object_id` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlcybc0jv8h8p058dkc9xwr33d` (`primary_game_object_id`),
  CONSTRAINT `FKlcybc0jv8h8p058dkc9xwr33d` FOREIGN KEY (`primary_game_object_id`) REFERENCES `lkdg_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_step_def`
--

LOCK TABLES `lkdg_step_def` WRITE;
/*!40000 ALTER TABLE `lkdg_step_def` DISABLE KEYS */;
INSERT INTO `lkdg_step_def` VALUES (2,1,2,2,'','a1');
/*!40000 ALTER TABLE `lkdg_step_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_step_def_seq`
--

DROP TABLE IF EXISTS `lkdg_step_def_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_step_def_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_step_def_seq`
--

LOCK TABLES `lkdg_step_def_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_step_def_seq` DISABLE KEYS */;
INSERT INTO `lkdg_step_def_seq` VALUES (51);
/*!40000 ALTER TABLE `lkdg_step_def_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_step_result`
--

DROP TABLE IF EXISTS `lkdg_step_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_step_result` (
  `game_step_def_id` bigint DEFAULT NULL,
  `game_step_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqaaxgyyfwh6lvyl8kqi64yj23` (`game_step_id`),
  CONSTRAINT `FKqaaxgyyfwh6lvyl8kqi64yj23` FOREIGN KEY (`game_step_id`) REFERENCES `lkdg_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_step_result`
--

LOCK TABLES `lkdg_step_result` WRITE;
/*!40000 ALTER TABLE `lkdg_step_result` DISABLE KEYS */;
INSERT INTO `lkdg_step_result` VALUES (NULL,1,1,'','r1');
/*!40000 ALTER TABLE `lkdg_step_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_step_result_seq`
--

DROP TABLE IF EXISTS `lkdg_step_result_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_step_result_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_step_result_seq`
--

LOCK TABLES `lkdg_step_result_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_step_result_seq` DISABLE KEYS */;
INSERT INTO `lkdg_step_result_seq` VALUES (51);
/*!40000 ALTER TABLE `lkdg_step_result_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_step_seq`
--

DROP TABLE IF EXISTS `lkdg_step_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_step_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_step_seq`
--

LOCK TABLES `lkdg_step_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_step_seq` DISABLE KEYS */;
INSERT INTO `lkdg_step_seq` VALUES (51);
/*!40000 ALTER TABLE `lkdg_step_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_user`
--

DROP TABLE IF EXISTS `lkdg_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_user` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_user`
--

LOCK TABLES `lkdg_user` WRITE;
/*!40000 ALTER TABLE `lkdg_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lkdg_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkdg_user_seq`
--

DROP TABLE IF EXISTS `lkdg_user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkdg_user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkdg_user_seq`
--

LOCK TABLES `lkdg_user_seq` WRITE;
/*!40000 ALTER TABLE `lkdg_user_seq` DISABLE KEYS */;
INSERT INTO `lkdg_user_seq` VALUES (1);
/*!40000 ALTER TABLE `lkdg_user_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-02  0:35:13
