-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: chop
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `category_of_guard`
--

DROP TABLE IF EXISTS `category_of_guard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_of_guard` (
  `category_id` int NOT NULL,
  `category_of_guard` int NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_of_guard`
--

LOCK TABLES `category_of_guard` WRITE;
/*!40000 ALTER TABLE `category_of_guard` DISABLE KEYS */;
INSERT INTO `category_of_guard` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `category_of_guard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator`
--

DROP TABLE IF EXISTS `curator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curator` (
  `name` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `military_grade` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `address` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `curator_id` int NOT NULL,
  PRIMARY KEY (`curator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator`
--

LOCK TABLES `curator` WRITE;
/*!40000 ALTER TABLE `curator` DISABLE KEYS */;
INSERT INTO `curator` VALUES ('Исаев Максим Максимович','полковник',121424124,'Берлин Принц-Альбрехтштрассе',1);
/*!40000 ALTER TABLE `curator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `name` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `head` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `e-mail` varchar(50) DEFAULT NULL,
  `customers_id` int NOT NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE KEY `customers_id_UNIQUE` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('Трейд','Ядучев Онуфрий Андронович',74922961470,'brenda94@maxwell.com',1),('КроссОрион','Ульянин Евлампий Прокофиевич',74742599017,'thompsonjason@oconnell-perkins.net',2),('Восток','Веточкин Игорь Измаилович',74812858773,'ashley05@yahoo.com',3),('Контур','Шишлов Вячеслав Феоктистович',73435795863,'robertpatel@mcdonald.com',4),('Деталь','Фененко Лавр Евгениевич',73955583596,'matthew25@hotmail.com',5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `equipment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'униформа'),(2,'рация'),(3,'телефон'),(4,'наручники'),(5,'палка резиновая'),(6,'газовый баллончик'),(7,'электрошокер'),(8,'пистолет ИЖ-71'),(9,'травматический пистоле МР-471'),(10,'самозарядный карабин Вепрь-12 Молот'),(11,'Самозарядное ружье Сайга-20');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `guard`
--

DROP TABLE IF EXISTS `guard`;
/*!50001 DROP VIEW IF EXISTS `guard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guard` AS SELECT 
 1 AS `name`,
 1 AS `guard`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information` (
  `start_licenses_date` date DEFAULT NULL,
  `end_licenses_date` date DEFAULT NULL,
  `curator_curator_id` int NOT NULL,
  PRIMARY KEY (`curator_curator_id`),
  CONSTRAINT `fk_information_curator1` FOREIGN KEY (`curator_curator_id`) REFERENCES `curator` (`curator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES ('2016-12-31','2021-12-31',1);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses_of_employees`
--

DROP TABLE IF EXISTS `licenses_of_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses_of_employees` (
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `licenses_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`licenses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses_of_employees`
--

LOCK TABLES `licenses_of_employees` WRITE;
/*!40000 ALTER TABLE `licenses_of_employees` DISABLE KEYS */;
INSERT INTO `licenses_of_employees` VALUES ('2018-11-02','2021-11-02',1,10),('2017-12-21','2020-08-20',2,9),('2017-12-20','2020-12-20',3,7),('2019-11-20','2021-11-20',4,6),('2018-12-03','2021-09-22',5,5),('2019-11-19','2024-07-08',6,4),('2019-07-23','2023-07-03',7,3),('2020-02-24','2023-03-02',8,2),('2019-08-29','2024-07-26',9,1),('2018-10-25','2024-03-13',10,8);
/*!40000 ALTER TABLE `licenses_of_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `licenses_of_guard`
--

DROP TABLE IF EXISTS `licenses_of_guard`;
/*!50001 DROP VIEW IF EXISTS `licenses_of_guard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `licenses_of_guard` AS SELECT 
 1 AS `name`,
 1 AS `end_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `promotion_or_ punishment`
--

DROP TABLE IF EXISTS `promotion_or_ punishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_or_ punishment` (
  `promotion` varchar(250) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `punishment` varchar(250) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `date_of_promotion` date DEFAULT NULL,
  `date_of_ punishmentcol` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_or_ punishment`
--

LOCK TABLES `promotion_or_ punishment` WRITE;
/*!40000 ALTER TABLE `promotion_or_ punishment` DISABLE KEYS */;
INSERT INTO `promotion_or_ punishment` VALUES ('None','None',1,NULL,'0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `promotion_or_ punishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_objects`
--

DROP TABLE IF EXISTS `protected_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protected_objects` (
  `name` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `contact_person` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  ` start_contract` date DEFAULT NULL,
  ` end_contract` date DEFAULT NULL,
  `objects_id` int NOT NULL,
  `customers_customers_id` int NOT NULL,
  `videocontrol` varchar(45) DEFAULT NULL,
  `alarm_system` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`objects_id`,`customers_customers_id`),
  UNIQUE KEY `objects_id_UNIQUE` (`objects_id`),
  KEY `fk_protected_objects_customers1_idx` (`customers_customers_id`),
  CONSTRAINT `fk_protected_objects_customers1` FOREIGN KEY (`customers_customers_id`) REFERENCES `customers` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_objects`
--

LOCK TABLES `protected_objects` WRITE;
/*!40000 ALTER TABLE `protected_objects` DISABLE KEYS */;
INSERT INTO `protected_objects` VALUES ('база Партнер',' город Клин, бульвар Будапештсткая, 64','Алистратов Ефим Ерофеевич','2008-07-24','2022-09-12',1,2,'Yes','No'),('Синтезбаза Алтай',' город Орехово-Зуево, пер. Косиора, 69','Дасаев Бронислав Артемович','2008-03-18','2021-08-23',2,1,'Yes','No'),('база Лес','город Воскресенск, шоссе Домодедовская, 93','Янкевич Яков Пахомович','2014-04-08','2021-08-04',3,3,'No','No'),('Комбаза Копи',' город Шатура, пл. Славы, 81','Блинов Сергей Маркович','2014-01-09','2022-07-07',4,4,'No','Yes'),('база Корона','город Ступино, проезд Космонавтов, 51','Молодцова Елизавета Марковна','2001-10-09','2022-06-23',5,5,'No','Yes'),('база Монтаж',' город Солнечногорск, пл. Домодедовская, 45','Нотович Агафья Мефодиевна','2005-03-16','2025-03-18',6,3,'Yes','No'),('Артельсклад',' город Чехов, наб. Чехова, 79','Туржанский Казимир Игнатиевич','2003-10-28','2021-09-24',7,2,'Yes','Yes'),('Хаузсклад','город Озёры, ул. Будапештсткая 1','Бортник Елизар Елисеевич','2002-04-23','2023-11-15',8,5,'No','Yes');
/*!40000 ALTER TABLE `protected_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `name` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci NOT NULL,
  `phone` bigint NOT NULL,
  `birthdata` date NOT NULL,
  `Id` int NOT NULL AUTO_INCREMENT,
  `staff_list_id` int NOT NULL,
  `licenses_of_employees_licenses_id` int NOT NULL,
  `promotion_or_ punishment_id` int NOT NULL,
  `category_of_guard_category_id` int NOT NULL,
  `protected_objects_objects_id` int NOT NULL,
  `protected_objects_customers_customers_id` int NOT NULL,
  `employment_date` date DEFAULT NULL,
  PRIMARY KEY (`Id`,`staff_list_id`,`licenses_of_employees_licenses_id`,`promotion_or_ punishment_id`,`category_of_guard_category_id`,`protected_objects_objects_id`,`protected_objects_customers_customers_id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_staff_staff_list_idx` (`staff_list_id`),
  KEY `fk_staff_licenses_of_employees1_idx` (`licenses_of_employees_licenses_id`),
  KEY `fk_staff_promotion_or_ punishment1_idx` (`promotion_or_ punishment_id`),
  KEY `fk_staff_category_of_guard1_idx` (`category_of_guard_category_id`),
  KEY `fk_staff_protected_objects1_idx` (`protected_objects_objects_id`,`protected_objects_customers_customers_id`),
  CONSTRAINT `fk_staff_category_of_guard1` FOREIGN KEY (`category_of_guard_category_id`) REFERENCES `category_of_guard` (`category_id`),
  CONSTRAINT `fk_staff_licenses_of_employees1` FOREIGN KEY (`licenses_of_employees_licenses_id`) REFERENCES `licenses_of_employees` (`licenses_id`),
  CONSTRAINT `fk_staff_promotion_or_ punishment1` FOREIGN KEY (`promotion_or_ punishment_id`) REFERENCES `promotion_or_ punishment` (`id`),
  CONSTRAINT `fk_staff_protected_objects1` FOREIGN KEY (`protected_objects_objects_id`, `protected_objects_customers_customers_id`) REFERENCES `protected_objects` (`objects_id`, `customers_customers_id`),
  CONSTRAINT `fk_staff_staff_list` FOREIGN KEY (`staff_list_id`) REFERENCES `staff_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('Кравец Егор Ефремович','Plekhanova, bld. 19А, appt. 2',78467180188,'1962-12-24',1,1,10,1,4,1,2,'2016-03-10'),('Туполев Святослав Артемович','Kosareva, bld. 52, appt. ',78635869469,'1966-11-08',2,1,9,1,4,2,1,'2018-02-20'),('Яценко Клавдий Ерофеевич','Festivalnaya Ul., bld. 46К. 1, appt. 108',73462736677,'1970-04-01',3,1,8,1,4,3,3,'2012-11-22'),('Вишняков Агафон Викентиевич','Krasnoyarskiy Rabochiy Pr., bld. 43, appt.',74812244224,'1985-05-23',4,2,7,1,6,1,2,'2000-05-17'),('Лапухин Иван Владимирович','Komsomolskaya Ul., bld. 78, appt. 65',78464797748,'1996-08-22',5,1,6,1,4,2,1,'2000-03-21'),('Берлунов Евстигней Епифанович','Selezneva, bld. 136, appt. 231',73517632862,'1977-03-18',6,1,5,1,4,4,4,'2002-09-26'),('Черенчиков Захар Герасимович','Stankostroitelnaya, bld. 16, appt. 23',78313336070,'1987-11-05',7,1,4,1,4,5,5,'2007-03-19'),('Щавлев Фока Кондратиевич','Pr Lenina, bld. 66А, appt. 1',73522660516,'1969-12-16',8,2,3,1,6,6,3,'2000-12-12'),('Колпаков Аркадий Остапович','Stavropolskaya, bld. 179, appt. 59',78652297183,'1967-06-23',9,3,2,1,6,7,2,'2005-08-25'),('Репин Самуил Пахомович',' Izmaylova, bld. 10А, appt. 6',78631425796,'1967-03-29',10,1,1,1,4,8,5,'2019-04-22');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_has_equipment`
--

DROP TABLE IF EXISTS `staff_has_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_has_equipment` (
  `staff_Id` int NOT NULL,
  `equipment_equipment_id` int NOT NULL,
  PRIMARY KEY (`staff_Id`,`equipment_equipment_id`),
  KEY `fk_staff_has_equipment_equipment1_idx` (`equipment_equipment_id`),
  KEY `fk_staff_has_equipment_staff1_idx` (`staff_Id`),
  CONSTRAINT `fk_staff_has_equipment_equipment1` FOREIGN KEY (`equipment_equipment_id`) REFERENCES `equipment` (`equipment_id`),
  CONSTRAINT `fk_staff_has_equipment_staff1` FOREIGN KEY (`staff_Id`) REFERENCES `staff` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_has_equipment`
--

LOCK TABLES `staff_has_equipment` WRITE;
/*!40000 ALTER TABLE `staff_has_equipment` DISABLE KEYS */;
INSERT INTO `staff_has_equipment` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(1,5),(2,5),(3,5),(5,5),(6,5),(7,5),(10,5),(1,6),(2,6),(3,6),(5,6),(6,6),(7,6),(10,6),(3,7),(5,7),(6,7),(7,7),(10,7),(4,8),(8,8),(9,8),(4,9),(8,9),(9,9),(4,10),(8,10),(9,11);
/*!40000 ALTER TABLE `staff_has_equipment` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_equipment` BEFORE INSERT ON `staff_has_equipment` FOR EACH ROW BEGIN
        IF(((select equipment_equipment_id from staff_has_equipment) > 7) AND (select category_of_guard_category_id from staff) < 4) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Категория у охранника недостаточная для выдачи оружия';
        END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff_list`
--

DROP TABLE IF EXISTS `staff_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_list` (
  `guard` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_list`
--

LOCK TABLES `staff_list` WRITE;
/*!40000 ALTER TABLE `staff_list` DISABLE KEYS */;
INSERT INTO `staff_list` VALUES ('охранник',1),('старший охранник',2),('начальник караула',3);
/*!40000 ALTER TABLE `staff_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `guard`
--

/*!50001 DROP VIEW IF EXISTS `guard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `guard` (`name`,`guard`) AS select `staff`.`name` AS `name`,`staff_list`.`guard` AS `guard` from (`staff` join `staff_list`) where (`staff`.`staff_list_id` = `staff_list`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `licenses_of_guard`
--

/*!50001 DROP VIEW IF EXISTS `licenses_of_guard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `licenses_of_guard` (`name`,`end_date`) AS select `staff`.`name` AS `name`,`lic`.`end_date` AS `end_date` from (`staff` left join `licenses_of_employees` `lic` on((`lic`.`licenses_id` = `staff`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-28 21:16:35
