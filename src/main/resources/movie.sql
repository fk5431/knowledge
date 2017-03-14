-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ename` varchar(255) NOT NULL,
  `birth` date DEFAULT NULL,
  `fan` int(11) DEFAULT '0',
  `boxoffice` double DEFAULT '0',
  `works` varchar(255) NOT NULL,
  `introduce` varchar(255) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `constellation` varchar(255) NOT NULL,
  `prizeIds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'','','1956-05-25',0,0,'','','','','','');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forthcoming`
--

DROP TABLE IF EXISTS `forthcoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forthcoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `forthcoming_ibfk_1` FOREIGN KEY (`id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forthcoming`
--

LOCK TABLES `forthcoming` WRITE;
/*!40000 ALTER TABLE `forthcoming` DISABLE KEYS */;
/*!40000 ALTER TABLE `forthcoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotmovie`
--

DROP TABLE IF EXISTS `hotmovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotmovie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `hotmovie_ibfk_1` FOREIGN KEY (`id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotmovie`
--

LOCK TABLES `hotmovie` WRITE;
/*!40000 ALTER TABLE `hotmovie` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotmovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexshow`
--

DROP TABLE IF EXISTS `indexshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  CONSTRAINT `indexshow_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexshow`
--

LOCK TABLES `indexshow` WRITE;
/*!40000 ALTER TABLE `indexshow` DISABLE KEYS */;
INSERT INTO `indexshow` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `indexshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isthefile`
--

DROP TABLE IF EXISTS `isthefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isthefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `isthefile_ibfk_1` FOREIGN KEY (`id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isthefile`
--

LOCK TABLES `isthefile` WRITE;
/*!40000 ALTER TABLE `isthefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `isthefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `etitle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `showtime` date NOT NULL,
  `lookcount` int(11) DEFAULT '0',
  `score` double DEFAULT '0',
  `boxoffice` int(11) DEFAULT '0',
  `introduce` text NOT NULL,
  `directorId` int(11) NOT NULL,
  `performerIds` varchar(255) NOT NULL,
  `prizeIds` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `atlas` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directorId` (`directorId`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`directorId`) REFERENCES `director` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'一条狗的使命','A Dog\'s Purpose','4!=end=!2','美国','101分钟','2017-03-03',0,9.2,3980,'',1,'','','/movie/image/h1.jpg',''),(2,'金刚狼3：殊死一战','Wolverine: Logan','8!=end=!11!=end=!7','美国','123分钟 ','2017-03-03',0,8.8,30,'',1,'','','/movie/image/h2.jpg',''),(3,'美女与野兽','Beauty and the Beast','1!=end=!13!=end=!22','美国','101分钟','2017-03-17',0,0,0,'',1,'','','/movie/image/h3.jpg',''),(4,'生化危机：终章','Resident Evil: The Final Chapter','6!=end=!7','美国','99分钟','2017-02-24',0,9.6,10,'',1,'','','/movie/image/h4.jpg',''),(5,'金刚：骷髅岛','Kong: Skull Island','1!=end=!8','美国','119分钟 ','2017-03-24',0,0,0,'',1,'','','/movie/image/h5.jpg',''),(6,'最终幻想15：王者之剑','Kingsglaive Final Fantasy XV','4!=end=!2','美国','116分钟','2017-03-10',0,8,23,'',1,'','','/movie/image/h6.jpg',''),(7,'天才捕手','Genius','4','英国','101分钟','2017-03-10',0,8.2,25,'',1,'','','/movie/image/h7.jpg',''),(8,'碟仙诡谭2','Death Ouija 2','6!=end=!9','美国','86分钟 ','2017-03-10',0,4,830,'',1,'','','/movie/image/h8.jpg','');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `time` date DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'专访《最终幻想》导演野末武志：成龙的电影不也很中二嘛','2017-03-09',0,'/movie/image/1.jpg',''),(2,'《生化危机》电影怪兽图鉴，想把最后一只抱回家养','2017-02-23',0,'/movie/image/2.jpg',''),(3,'《金刚：骷髅岛》 孤岛惊魂预告展现史上最残酷生物链','2017-03-14',0,'/movie/image/3.jpg',''),(4,'专访林宥嘉：如果有机会演电影想做个禁欲系变种人！','2017-03-02',0,'/movie/image/4.jpg','');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer`
--

DROP TABLE IF EXISTS `performer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ename` varchar(255) NOT NULL,
  `birth` date DEFAULT NULL,
  `fan` int(11) DEFAULT '0',
  `boxoffice` double DEFAULT '0',
  `works` varchar(255) NOT NULL,
  `introduce` varchar(255) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `constellation` varchar(255) NOT NULL,
  `prizeIds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer`
--

LOCK TABLES `performer` WRITE;
/*!40000 ALTER TABLE `performer` DISABLE KEYS */;
/*!40000 ALTER TABLE `performer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prize`
--

DROP TABLE IF EXISTS `prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prize`
--

LOCK TABLES `prize` WRITE;
/*!40000 ALTER TABLE `prize` DISABLE KEYS */;
/*!40000 ALTER TABLE `prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'爱情'),(2,'喜剧'),(3,'动画'),(4,'剧情'),(5,'恐怖'),(6,'惊悚'),(7,'科幻'),(8,'动作'),(9,'悬疑'),(10,'犯罪'),(11,'冒险'),(12,'战争'),(13,'奇幻'),(14,'运动'),(15,'家庭'),(16,'古装'),(17,'武侠'),(18,'西部'),(19,'历史'),(20,'传记'),(21,'情色'),(22,'歌舞'),(23,'黑色电影'),(24,'短片'),(25,'纪录片'),(26,'其他');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-14 18:07:52
