/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ogtech
-- ------------------------------------------------------
-- Server version	11.4.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `ogtech`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ogtech` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `ogtech`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(64) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Brand` varchar(64) NOT NULL,
  `Description` varchar(512) NOT NULL,
  `Category` int(11) NOT NULL,
  `SellingPrice` float NOT NULL,
  `QuantityInStock` int(11) NOT NULL,
  `Image` varchar(512) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES
(3,'RTX 3070 PC - Best price to performance PC (16GB Ram 1TB SSD)','Mixed','CPU: INTEL CORE i5-10400F,\r\nCooler: CRYORIG H7 QUAD LUMI,\r\nMOBO: ASUS TUF Gaming B460-PRO WIFI, \r\nRAM: G.SKILL TRIDENT Z ROYAL 2X8GB CL18 DDR4 3600MHZ,\r\nGPU: EVGA GeForce RTX 3070 XC3 ULTRAGAMING 2x8GB GDDR6,\r\nPSU: GIGABYTE P650B 80+ BRONZE NON-MODULAR,\r\nCase: ANTEC NX410 BLACK, \r\nSSD: CORSAIR Force Series MP510 1TB M.2 NVMe, \r\nHDD: Western Digital WD BLUE 1TB SATA,\r\nFREE Lamptron Flexlight Multi Programmable ARGB LED Strip                                               ',0,6950,29,'3070 pc.jpg'),
(4,'OGTECH EPIC All-Rounder RTX 3060TI PC (16GB Ram 1TB SSD)','Mixed','CPU: INTEL i5-10400F MOBO: GIGABYE B450M DS3H V2, \r\nRAM: G.SKILL AEGIS Series 8GB DDR4 3200MHz x2,\r\nGPU: GIGABYTE GeForce RTX 3060TI EAGLE OC 8G DDR6,\r\nPSU: ANTEC NE550C V2 80+ BRONZE,\r\nCASE: ANTEC NX410 BLACK\r\nSSD: GIGABYTE 1TB SATA,\r\nWIFI: ASUS PCE-AX3000 WIFI6 PCIE,\r\nFREE Lamptron Flexlight Multi Programmable ARGB LED Strip                                                ',0,5991,15,'3060 ti pc.jpg'),
(5,'Nvidia Geforce RTX 3080 PC King Value (16 GB Ram)','Mixed','CPU: AMD RYZEN 7 3700X, \r\nCooler: CRYORIG H7 MOBO: GIGABYTE B450 AORUS PRO WIFI,\r\nRAM: G.SKILL TRIDENT Z NEO 2X8GB CL16 DDR4 3200MHZ, \r\nGPU: GIGABYTE GeForce RTX 3080 GAMING OC 10GB GDDR6X,\r\nPSU: ANTEC HCG Gold Series 850W 80+ GOLD FULLY MODULAR,\r\nCase: ANTEC DF700 FLUX, \r\nSSD: CORSAIR Force Series MP510 480GB M.2 NVMe,\r\nFREE Cablemod Premium Sleeved Cables,\r\nFREE Lamptron Flexlight Multi Programmable ARGB LED Strip                                ',0,8668,20,'3080 pc.jpg'),
(6,'OGTech Best Value AMD RTX? 3060 PC (16GB Ram)','Mixed','Graphic Card : GIGABYTE GeForce RTX? 3060 12GB EAGLE OC,\r\nProcessor : AMD Ryzen 5 3600,\r\nMotherboard : MSI B450M-A Pro Max,\r\nRAM : GSKILL AEGIS DDR4 3200Mhz (2x8gb),\r\nSSD: GIGABYTE NVMe SSD 256GB,\r\nPower Supply :ANTEC CSK550 Bronze,\r\nCasing : ANTEC NX410 Black or White                ',0,4599,35,'pc-rtx3060.jpg'),
(7,'OGTECH STREAMER PC NVIDIA GTX1660 SUPER w 32GB RAM','Mixed','CPU: INTEL i5 10400F MOBO: GIGABYTE B460M DS3H AC RAM: G.SKILL TridentZ RGB 2x16GB DDR4 3200MHz GPU: GIGABYTE GeForce GTX1660 SUPER WF OC PSU: ANTEC CSK550 GB 80+ BRONZE CASE: ZALMAN K1 ATX RGB CASE SSD: XPG SX8200 PRO M.2 1TB SSD HDD: WESTERN DIGITAL 2TB CAVIAR BLUE',0,3899,5,'RM4761_SE580E-scaled.jpg'),
(8,'Asus VG258QR (24.5\')','Asus','                                    Panel size 24.5?. IPS Panel. Non-glare display surface. 16:9 aspect ratio. 1920 x 1080 resolution. Refresh rate 165hz, 0.5ms reponse time. Anti-Flicker.                                ',1,888,25,'asus_monitor.jpg'),
(9,'OGTECH GEFORCE ESPORTS PC GTX1050Ti','Mixed','Processor : INTEL  Core I3-10105F Graphic Card : AFOX GEFORCE GTX1050TI 4GB Motherboard :GIGABYTE B460M DS3H V2 RAM : GSKILL AEGIS DDR4 3200Mhz (1 x8gb) SSD: GIGABYTE NVMe SSD 256GB Power Supply: ANTEC CSK550 Bronze Casing : ANTEC DP301M (x2 fans included)',0,2399,5,'pc-1050ti.png'),
(10,'OGTech Entry RTX? PC NVIDIA? GeForce RTX? 3050','Mixed','Graphic Card :Nvidia Geforce RTX? 3050 8GB Processor : INTEL Core I3-10105F Motherboard : GIGABYTE B460M DS3H V2 RAM : GSKILL AEGIS 8GB DDR4 3200Mhz SSD: GIGABYTE NVMe SSD 256GB Power Supply :ANTEC CSK550 Bronze Casing : ANTEC NX270 RGB',0,3299,50,'pc-rtx3050.jpg'),
(11,'Viewsonic XG2401 (24\')','Viewsonic','1ms response time. AMD FreeSync? technology. SmartSync technology. Black stabilisation. 144Hz Refresh Rate',1,799.99,10,'view monitor.png'),
(12,'ACER Predator Aethon 500 keyboard','Acer','Blue switch mechanical keys.  70 million keystroke-rated. Rgb controlled software. ',2,399,2,'acer keyboard.png'),
(13,'ACER basic speakers','Acer','                  Sufficient for daily use. Stylish design.                 ',1,39.99,15,'acer speaker.jpg'),
(14,'ASUS ROG Strix Magnus Mic @ Studio grade mic','Asus','ROG Strix Magnus USB condenser gaming microphone with AURA RGB lighting and environmental noise cancellation (ENC) for gaming/streaming  Three studio-grade condenser capsules for enhanced clarity and sensitivity Designed for live streamers with compact form factor and environmental noise cancellation (ENC) Stylish and customizable Aura RGB lighting effects Auxiliary port for recording audio from musical instruments and mobile devices Comes with external USB hub for connecting additional devices',2,699,2,'asus mic.jpg'),
(15,'CORSAIR VIRTUOSO RGB WIRELESS headset','Corsair','                  A matched pair of precisely tuned 50mm high-density neodymium drivers boast a frequency range of 20Hz-40,000Hz ',1,737,15,'corsair headset.png'),
(16,'CORSAIR rgb mouse','Corsair','                                                      Premium comfort mouse. Outstanding corsair rgb logo on lit. Rubber grip for more comfort.                                                ',2,50,15,'corsair mouse.jpg'),
(17,'HYPERX cloud stinger headset','HyperX','                  Outstanding mic and audio quality. Made from premium hard plastic for light weight. Comfortability is a must.                ',1,299,15,'hyper headset.jpg'),
(18,'HyperX Quadcast RGB mic','HyperX','                  Built-in headphone jack. Internal pop filter. Convenient gain control adjustment. Four selectable polar patterns. Tap-to-Mute sensor with LED indicator. Dynamic RGB lighting effects customizable with HyperX NGENUITY Software. Anti-Vibration shock mount.                 ',2,599,18,'hyper mic.jpg'),
(19,'LOGITECH G550 RGB Headset','Logitech','                  More ear room for maximum comfort. Made from light weight plastic for comfort. Premium mic and audio quality. RGB is pog.                ',1,399,15,'logi headset.jfif'),
(20,'Logitech G850 Wireless RGB Tournament Keyboard','Logitech','                                    Premium blue keycaps made from overseas. Customizable RGB with software. 87 keys for more mouse room. Made from premium aluminium.                                ',2,899,15,'logi keyboard.png'),
(21,'LOGITECH entry desktop mic','Logitech','                  Good audio quality. Anti vibration pad. Adjustable mic.                 ',2,39.99,10,'logi mic.jpg'),
(22,'LOGITECH Z250 RGB Speakers','Logitech','                  Simple yet stylish speakers. RGB makes listening music more fun. RGB can sync along music with logitech software.                ',1,299.99,15,'logi speaker.png'),
(23,'MSI DS502 gaming headset','MSI','Enhanced Virtual 7.1 Surround Sound. Intelligent Vibration System. Smart Audio Controller. Enhanced 40mm High Quality Drivers. Cool LED Light. Light weight & Self-adjusting Headband Design.',1,249.99,20,'msi headset.png'),
(24,'MSI Optix MPG341CQR Smart RGB Curved Gaming Monitor (34\')','MSI','                  34 inch 3440x1440 Frameless design ',1,2888,15,'msi monitor 2.jpg'),
(25,'RAZER Kraken V2 Pro Headset','Razer','Custom-tuned 50 mm Drivers. Cooling Gel-Infused Cushions. Retractable Unidirectional Microphone. Clear & Powerful Sound Thicker Headband Padding Play Comfortably for Hours',1,399.99,20,'razer headset 2.jpg'),
(26,'RAZER Blackwidow Keyboard Green Switch 2019','Razer','                                    Razer Green Mechanical Switches designed for gaming 80 million keystroke lifespan Razer Chroma customizable backlighting with 16.8 million color options Hybrid On-Board Memory and Cloud Storage ',2,269.99,15,'razer keyboard.jfif'),
(27,'RAZER Seir?n X - Black','Razer','Ultra-Precise Pickup Pattern Shock Resistant Compact Form Factor',2,319.99,10,'razer mic.jfif'),
(28,'RAZER RAPTOR 27 1440P 165 HZ','Razer','VESA COMPATIBLE and cable management. WORLD',1,3199.99,2,'razer monitor.jpg'),
(29,'RAZER BASILISK V3','Razer','                  PERFECTING SCROLLING. FULL SPECTRUM CUSTOMIZABILITY. 10+1 PROGRAMMABLE BUTTONS. Profile switching.                 ',2,259,15,'razer mouse.jfif'),
(30,'RAZER Nommo Pro','Razer','SOLID, UNRESTRICTED BASS. THX CERTIFIED PREMIUM AUDIO. Top notch Studio grade quality audio. POWERFUL CINEMATIC IMMERSION dolby audio certified.',1,3098,2,'razer speaker.jfif'),
(32,'Viewsonic Elite XG350R-C 35','Viewsonic','                  100Hz refresh rate. ClearMotion backlight strobing technology. 3440 X 1440 Ultra Wide QHD resolution. ELITE RGB Alliance. Adaptive Sync & AMD FreeSync? technology.                 ',1,2077,15,'viewsonic monitor.png'),
(33,'Logitech G102 RGB mouse','Logitech','                  8,000 DPI. LIGHTSYNC RGB featuring color wave effects customizable across ~16.8 million colors.                ',2,69.99,30,'logi mouse.jpg'),
(34,'LOGITECH G502 Gaming Mouse','Logitech','The best selling mouse in the world, featuring customizable weight. 5 programmable buttons with rgb logo. Durable materials and comfortable engineered grip. 70 millions clicks life span.',2,159,50,'g502.jpg'),
(35,'ACER Nitro VG270 27\" 75hz','Acer','1920x1080p IPS Freesync 1ms with virtual response boost up to 0.5ms',1,719.99,28,'acer monitor.jfif'),
(36,'Acer Aopen 24CV1Y Monitor (23.8\")','Acer','Full HD, VA Panel, 5ms(GTG) Respond Time, 75Hz Refresh Rate',1,499,30,'acer budget monitor.jfif'),
(37,'Steelseries QCK EDGE L - 450mm x 400mm x 2mm ','Steelseries','                  One of the best selling Cloth Gaming Mouse Pad in the world. Extremely smooth yet durable.                ',2,60,30,'steelseries l.png'),
(38,'Steelseries QCK EDGE - XL 900mm x 300mm x 2mm','Steelseries','One of the best selling mouse mat in the world. Made from premium woven and rubber. Anti slip back and smooth surface.',2,119,50,'steelseries xl.jfif'),
(39,'OGTECH OFFICE PC COMPACT','Mixed','Processor : AMD Ryzen 5 PRO 4650G Motherboard : ASROCK B550M ITX/AC (Wifi) RAM : GSKILL AEGIS DDR4 3200Mhz (1 x8gb) SSD: GIGABYTE NVMe SSD 256GB Casing : ANTEC ISK310-150 Mini-ITX CASE with psu',0,2099,10,'compact pc.png');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(64) NOT NULL,
  `Password` varchar(512) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `PrivilegeLevel` int(11) NOT NULL DEFAULT 0,
  `Attempt` int(11) DEFAULT NULL,
  `RegisteredDate` date DEFAULT NULL,
  `FullName` varchar(128) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES
(2,'admin','$2y$10$wq746a0dn0wmcPzHXfEMhe80xZQc9/1PBJID9Ri4AHbfmwT9xn9Xi','admin@gmail.com',1,3,'2022-03-27','the fuck','1234567','桃園市八德區大信里30鄰大興路1045巷30號'),
(5,'test1','$2y$10$GlhvBkMPi19b3tGoGUzEzOu3GDazDogOzd.eoAvNc0ID8PB9n7E7K','test@gmail.com',0,3,'2022-03-27','',NULL,NULL),
(6,'test2','$2y$10$Q.624Ef8zdpsWryToDFJZONz7XopgMQZwQeLXwzFUBa07/DNdFfUO','test123@gmail.com',0,3,'2022-03-27','',NULL,NULL),
(7,'test3','$2y$10$YZJ3hA4zgVjaKdMJHR5EWuUk8ujPDlqXP7IzEd.kD9.lLcUAbH5Su','test3@gmail.com',0,3,'2022-03-27','',NULL,NULL),
(8,'test4','$2y$10$07FJA8uhFxA0aAnMBoP59uAs4CNhyQ/yHqIT69UgrH6l2nsZGa5Y.','test4@gmail.com',0,3,'2022-03-27','',NULL,NULL),
(9,'test5','$2y$10$CYsI.DmaPc5EXpjRRfQTIeYkbC0ngtucxVHRHgV5SJ0z1/2cwB4mu','test5@gmail.com',0,3,'2022-03-25','',NULL,NULL),
(10,'test6','$2y$10$ieSbXKrOc4tmF.kSUtTCyO69Xp13lNCs.Fl.agTLYm3N0FAKdRWkC','test6@gmail.com',0,3,'2022-03-24','',NULL,NULL),
(15,'test7','$2y$10$wYZtt0RY/443JBq5UO0iGuDbUia/lIEWI0/iSGrDJ4Yrv3WpD5J1.','test7@gmail.com',0,3,'2022-03-25','',NULL,NULL),
(16,'test8','$2y$10$qYaWx7z6VHxgBtQxLm7leuo2sKv76Cg28UhmJaKZiF0eHXiMMcKCa','test8@gmail.com',0,3,'2022-03-27','',NULL,NULL),
(19,'test9','$2y$10$VDEN6GE/49oMJ6GIwCL/2Op6K6iTeuZbbf7QFn8Oj7WTPzTG3E2Nq','test9@gmail.com',0,3,'2022-03-26','',NULL,NULL),
(22,'admin2','$2y$10$4DtSUM142G/dEiZOfO2xS.1VptEJ0rzRh1AFM6EH/Wf.1MediuCUm','admin@mail.com',1,3,'2022-03-27','',NULL,NULL),
(29,'jason','$2y$10$Oc31.TraKSPVlDDHZ6ZKGe9ExLep04lvuPfkvDQ9Rm.ccNRiG7rz2','jason@gmail.com',0,NULL,'2024-12-11','jason','123456789','嘉義南華大學'),
(30,'k1ck1ck1c','$2y$10$vZ2PlhF8EY0mTkHEMdhTQuE7d/U3Mrky//9leYKmQjwCetd.nvaE2','k1ck1c@gmail.com',0,NULL,'2024-12-16','k1ck1c','0800000123','台北市大安區羅斯福路四段1號'),
(31,'12345','$2y$10$rSc84pLnamb1HyAFc9WSQ.cauoe93w1NF3fU3jW3K0u1q1/mQI1qe','123@gmail.com',0,NULL,'2024-12-16','456','444','666'),
(32,'11124235','$2y$10$84z/EduLvL.IBpPNpcEzYuhQqBge8eeZk9m7GIrIyAHt45AlbcuuK','zx0989030601@gmail.com',0,NULL,'2024-12-16','吳易軒','0938399202',''),
(33,'11124114','$2y$10$ArkZ6dUU5Iia7vRxAlB1PORK6f36pZLu9WsRZFSEXQNQ2mrUU4J/.','ande20040331@gmail.com',0,NULL,'2024-12-16','Ande','Fuck','Fuck'),
(34,'江趙德','$2y$10$cxe55aAR6aPYs/l6Xq.zY.w99mrPAcD7PlYCiFBfUQEzTufak64jO','cmwu@nhu.edu.tw',0,NULL,'2024-12-18','江趙德','09123456789','天安門 中國北京市东城区 邮政编码: 100051'),
(35,'chatgpt','$2y$10$9qie2xJ5OPbnTw4ujK6kse02M4fBixgfhXNaK123tSqpmKypUb7HW','123456789@123456789',0,NULL,'2024-12-18','chatgpt','0945782168','宇宙中的某顆星球上');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `AddedDatetime` datetime NOT NULL,
  `Feedback` varchar(512) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `RatingDateTime` datetime NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES
(37,24,3,6950,1,'2022-03-13 00:43:58','Best PC that i ever purchased. Thanks OGTECH for your service.',5,'2022-03-13 19:36:36'),
(56,28,3,6950,1,'2022-03-13 23:49:08','The PC is good as its name, best price to performance PC. The GPU is TOP 10 currently for best price to performance. Anyways, good service must buy from this shop.',5,'2022-03-14 00:35:25'),
(57,28,5,8668,1,'2022-03-13 23:49:39','EZ KATKA. GOOD SERVICE. BEST VALUE. KING OF PC. THANKS OGTECH',5,'2022-03-14 00:35:51'),
(58,28,6,4599,1,'2022-03-13 23:49:45','Best value PC ever. Thanks OGTECH for the good service and good parts and good prices. Everything works fine.',5,'2022-03-14 00:36:24'),
(59,28,10,3299,1,'2022-03-13 23:52:19','Best entry PC. 3050 basically can run cyberpunk is max settings 1080p 60fps lol. Thanks OGTECH',5,'2022-03-14 00:37:06'),
(60,28,35,719.99,2,'2022-03-13 23:53:25','No deadpixel or dead color. Good service and fast delivery. Thanks OGTECH',5,'2022-03-14 00:37:51'),
(61,29,3,6950,1,'2022-03-14 11:07:27','Shipping is a bit late due to Chinese New Year. Minus one star for that, while everything else is okay. Thanks OGTECH',4,'2022-03-14 11:08:40');
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `TotalAmount` float NOT NULL,
  `Status` varchar(32) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`OrderID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(1,2,'2024-12-11 12:42:14',5991,'Pending'),
(2,2,'2024-12-11 12:45:15',5991,'Pending'),
(3,2,'2024-12-11 12:46:18',15189,'Pending'),
(4,29,'2024-12-11 12:48:56',3299,'Pending'),
(5,30,'2024-12-16 07:54:59',13900,'Pending'),
(6,33,'2024-12-16 08:08:09',13900,'Pending'),
(7,31,'2024-12-17 04:44:26',17336,'Pending'),
(8,34,'2024-12-18 09:30:52',6690,'Pending'),
(9,34,'2024-12-18 09:31:13',3199.99,'Pending'),
(10,34,'2024-12-18 09:31:33',18618200,'Pending'),
(11,34,'2024-12-18 09:32:36',6.41024e22,'Pending'),
(12,35,'2024-12-18 11:21:53',16614,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES
(6,24,'2022-03-13'),
(7,28,'2022-03-14'),
(8,29,'2022-03-14');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-23  3:13:03
