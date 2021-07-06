-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: prison_management
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Dumping data for table `new_details`
--

LOCK TABLES `new_details` WRITE;
/*!40000 ALTER TABLE `new_details` DISABLE KEYS */;
INSERT INTO `new_details` VALUES (13,19,NULL,1),(12,20,NULL,2),(13,21,NULL,3),(12,22,'B',4),(12,23,'B',5),(13,24,'C',6),(12,25,'B',7),(13,26,'C',8),(12,27,'B',9),(13,28,'C',10),(12,29,'B',11),(12,30,'B',12),(13,31,'C',13),(13,32,'C',14),(12,33,'B',15);
/*!40000 ALTER TABLE `new_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `prisoner`
--

LOCK TABLES `prisoner` WRITE;
/*!40000 ALTER TABLE `prisoner` DISABLE KEYS */;
INSERT INTO `prisoner` VALUES (1,'Jack',1234598764,'California',9),(2,'Jack',1234598764,'California',9),(3,'Jack',1234598764,'California',9),(4,'Jack',1234598764,'California',9),(5,'Jack',1234598764,'California',9),(6,'Jack',1234598764,'California',9),(7,'Jack',1234598764,'California',9),(8,'Jack',1234598764,'California',9),(9,'Jack',1234598764,'California',9),(10,'Jack',1234598764,'California',9),(11,'Jack',1234598764,'California',9),(12,'Jack',1234598764,'California',9),(13,'Jack',1234598764,'California',9),(14,'Jack',1234598764,'California',9),(15,'Jack',1234598764,'California',9),(19,'pam',123123456,'panchetta',7),(20,'Stanley',420420,'Mumbai',4),(21,'Mike',123876456,'Vancouver',8),(22,'Michael',987654321,'LA',3),(23,'prisoner',9865,'prisoner',3),(24,'Jacob',99452267,'London',8),(25,'Raj Kumar',96451295,'Bnagalore',5),(27,'Rashmi',12341234,'Bangalore',3),(28,'Rashmi',12341234,'Bangalore',4),(29,'Pooja',12345123,'Bangalore',3),(30,'Rafael',9868996,'LA',6),(31,'Vijay',12345321,'Bangalore',2),(32,'Mahesh',123451234,'Bangalore',8),(33,'vikas',7406615255,'bangalore',5);
/*!40000 ALTER TABLE `prisoner` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prisoner_AFTER_INSERT` AFTER INSERT ON `prisoner` FOR EACH ROW BEGIN
DECLARE v_wardenid INT;
DECLARE v_blockid CHAR(1);	
SELECT warden_id, block_id INTO v_wardenid, v_blockid 
FROM wardens
order by rand()
LIMIT 1;
INSERT INTO new_details(warden_id, prisoner_id, block_id) 
VALUES (v_wardenid, NEW.prisoner_id, v_blockid);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES ('Jason',96285577,'Michael',4,'Friend','Talking'),('Oscar',99806623,'Mike',3,'Lawyer','Bail document signature'),('Amy',86183476,'Jacob',6,'Sister','General visit'),('Vinay',12341234,'Pooja',11,'Father','General'),('Sriram',12312345,'Rashmi',28,'Brother','General'),('Sriram',12312345,'Rashmi',28,'Brother','General'),('Sriram',12312345,'Rashmi',28,'Brother','General'),('prajwal',987987,'pooja',11,'friend','general'),('Vinay',987987,'pooja',NULL,'friend','Talking'),('Vinay',987987,'pooja',11,'friend','General'),('Vinay',987987,'pooja',11,'friend','General'),('Vinay',45680234,'pooja',11,'friend','General'),('Vikram',2342343,'Vijay',13,'Father','General'),('Prajwal',654123,'Mahesh',12,'Friend','General'),('adam',6562124521,'vikas',22,'friend','general');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wardens`
--

LOCK TABLES `wardens` WRITE;
/*!40000 ALTER TABLE `wardens` DISABLE KEYS */;
INSERT INTO `wardens` VALUES (11,'John','A'),(12,'Jack','B'),(13,'James','C');
/*!40000 ALTER TABLE `wardens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-06 20:15:04
