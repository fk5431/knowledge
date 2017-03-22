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
  `othername` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'拉斯·霍尔斯道姆','Lasse Hallström','1946-06-02',49,0,'1!=end=!2','拉斯·霍尔斯道姆，莱塞·霍尔斯道姆，瑞典电影导演。曾因电影《狗脸的岁月》和《苹果酒屋的法则》获得奥斯卡最佳导演奖提名。霍尔斯道姆生于瑞典斯德哥尔摩，父亲是牙医，母亲是瑞典作家KarinLyberg(1907–2000)。外祖父ErnstLyberg曾任瑞典财政部长。他一开始的职业是拍MV，尤其是为ABBA工作。《狗脸的岁月》大获成功后，他进军好莱坞。他在美国首部获得成功的电影是《不一样的天空》（1993）。1999年他的影片《苹果酒屋的法则》获奥斯卡最佳导演奖和最佳影片奖提名，他的声望达到了顶峰。','瑞典斯德哥尔摩','男','双子座','男','Lars Hallström','瑞典','184cm','/movie/image/director/1.jpeg!=end=!/movie/image/director/2.jpeg','/movie/image/director/3.jpeg');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forthcoming`
--

LOCK TABLES `forthcoming` WRITE;
/*!40000 ALTER TABLE `forthcoming` DISABLE KEYS */;
INSERT INTO `forthcoming` VALUES (1,8,3),(2,8,9),(3,8,10),(4,8,11),(5,8,12),(6,8,13),(7,8,14),(8,8,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotmovie`
--

LOCK TABLES `hotmovie` WRITE;
/*!40000 ALTER TABLE `hotmovie` DISABLE KEYS */;
INSERT INTO `hotmovie` VALUES (1,8,1),(2,8,2),(3,8,3),(4,8,4),(5,8,5),(6,8,6),(7,8,7),(8,8,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isthefile`
--

LOCK TABLES `isthefile` WRITE;
/*!40000 ALTER TABLE `isthefile` DISABLE KEYS */;
INSERT INTO `isthefile` VALUES (1,7,1),(2,7,2),(3,7,6),(4,7,4),(5,7,3),(6,7,7),(7,7,5);
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
  `scorenum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `directorId` (`directorId`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`directorId`) REFERENCES `director` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'一条狗的使命','A Dog\'s Purpose','1','美国','101分钟','2017-03-03',22,9.2,3980,'影片讲述了一条狗经历多次重生，在一次次生命的轮回中寻找不同的使命，最后又回到了最初的主人身边的故事。一个温顺可爱的狗狗贝利与主人意外的相遇开始了主人和汪星人的四世宠物情缘。贝利在成长过程中，帮助主人找到人生的伴侣，在危难之际拯救全家人的生命，到之后化身警犬破案，狗狗为主人奉献了自己的全部...',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h1.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(2,'金刚狼3：殊死一战','Wolverine: Logan','1','美国','123分钟 ','2017-03-03',0,8.8,30,'故事将发生在很久很久之后的未来世界，与现行的X战警宇宙相隔甚远。迈入暮年的金刚狼（休·杰克曼 饰）渐渐失去了体内的自愈因子。当一个与他能力相似的变种人女孩劳拉（达芙妮·基恩 饰）出现，小姑娘也能伸出与金刚狼一样的钢爪。X教授便请狼叔出山保护劳拉，阻止生化人杀手Reavers组织绑架劳拉的计划。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h2.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(3,'美女与野兽','Beauty and the Beast','2','美国','101分钟','2017-03-17',0,0,0,'在很久以前，一位冷酷高傲、养尊处优的王子，独居在一座金碧辉煌的宏伟城堡里。一日，他及整座城堡被女巫施设了魔咒，英俊的王子瞬间变成了可怕的野兽（丹·史蒂文斯 饰），而他的仆从也都变成了各式的家具。若要解除魔咒，他唯有在最后一瓣玫瑰凋落之前收获真爱。对生活满怀幻想，独立勇敢且善解人意的女孩贝儿（艾玛·沃森 饰），为寻找父亲而推开了陌生城堡的大门，为拯救父亲的她甘愿留在城堡。在朝夕相处中彼此了解加深的他们渐生情愫，自私无情的野兽更渐渐被勤奋善良的贝儿所打动，但一次意外却令野兽的性命危在旦夕。贝儿会是那个破解魔咒的女孩吗？',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h3.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(4,'生化危机：终章','Resident Evil: The Final Chapter','2','美国','99分钟','2017-02-24',4,9.6,10,'爱丽丝（米拉·乔沃维奇 饰）在华盛顿特区被威斯克背叛后身陷险境，人类几乎要失去最后的希望。作为唯一的幸存者，也是人类对抗僵尸大军的最后防线，爱丽丝必须回到噩梦开始的地方：浣熊市，才能完成拯救世界救赎人类的正义使命。女神回归故事发生的起点浣熊市，和昔日的朋友一起对抗僵尸和最新变种怪物，与保护伞公司展开了一场惊心动魄的终极决战',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h4.jpeg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(5,'金刚：骷髅岛','Kong: Skull Island','3','美国','119分钟 ','2017-03-24',0,0,0,'上世纪70年代，一支集结了科考队员、探险家、战地摄影记者、军人的探险队，冒险前往南太平洋上的神秘岛屿——骷髅岛。他们的到来惊扰了岛上之神——史上最大金刚。经过一番惨烈的激战之后，探险队员散落在了岛屿各处。此时，队员们才意识到这次探险并不是一次单纯的科考任务，而是去探索怪兽存在的证明。在这片与世隔绝、危险密布的丛林，无数怪异的史前生物暗藏其中，时刻威胁着他们的生命。队员们还遇到了神秘的原始部落，金刚的身世和其守护岛屿的原因也被逐渐揭开，原来，恐怖阴森的骷髅岛上还蛰伏着更凶狠残暴的怪兽……',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h5.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(6,'最终幻想15：王者之剑','Kingsglaive Final Fantasy XV','3','美国','116分钟','2017-03-10',0,8,23,'魔法王国路西斯是神圣水晶之乡，而凭借机械技术获得强大军事实力的尼夫海姆帝国来势汹汹，不择手段想要夺取水晶。两国之间展开了旷日持久的战争。113代路西斯国王雷吉斯集结了一批战斗能力出众的移民,组建起直属国王的特殊部队“王者之剑”。王者之剑的战士们借用路西斯国王代代传承的魔法参与到国家同尼夫海姆的激战中。但是在尼夫海姆压倒性的军事力量面前，雷吉斯国王不得不接受了议和：割让除王都外的所有土地，同时,王子诺克提斯要迎娶隶属帝国的戴涅布莱国前公主露娜弗蕾亚。不料这次议和都是尼夫海姆的阴谋，王都因索尼亚变成了战场，尼克斯被迫卷入了这场关乎王国生死存亡的斗争中。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h6.png','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(7,'天才捕手','Genius','4','英国','101分钟','2017-03-10',0,8.2,25,'本片讲述了了美国大作家托马斯·沃尔夫与他的图书编辑麦克斯·珀金斯之间的友谊。上世纪20年代末，默默无闻的托马斯·沃尔夫（裘德·洛 饰）怀揣文学梦来到纽约，而他冗长的自传体小说被曾一手发掘过菲兹杰拉德、海明威等作家的文学编辑麦克斯·珀金斯（科林·费尔斯 饰）看中。珀金斯大刀阔斧地为沃尔夫删减文章篇幅，最后该书出版时大获成功，沃尔夫也成为了文学界新星，而这本书正是他流传后世的著名小说《天使，望故乡》。在此之后，珀金斯和沃尔夫更加紧密地合作，但他们的亲近引起了沃尔夫女友（妮可·基德曼 饰）的嫉妒。在沃尔夫第二本小说的即将面世之时，三人之间关系却愈发微妙。一边是发掘自己的伯乐，一边是相处多年的女友，他将如何抉择…',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h7.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(8,'碟仙诡谭2','Death Ouija 2','4','美国','86分钟 ','2017-03-10',0,4,830,'在一处荒僻隐秘的奢华娱乐会所里，一场同学毕业聚会正在进行。乔巧（张韶涵 饰）与关辛（方力申 饰）无意中发现了一套碟仙器具，为寻刺激众人一起玩碟仙。当他们提出的问题被碟仙一一言中时，厄运接连降临，妖魔化影鬼怪哭声，建筑被整个封锁，其中几人接连离奇的死亡。此时活下来的人才发现，这座会所是按照酷刑炼狱的场景布置陈设的，而他们也被困在了这座“人间地狱”里。人人自危的情景下，埋藏在彼此之间的矛盾也在此刻爆发。乔巧与关辛的爱情也面临着生与死的双重考验。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/hot/h8.jpeg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(9,'通灵姐妹','Haunted Sisters','1!=end=!2!=end=!3!=end=!4!=end=!5!=end=!6','中国','89分钟','2017-03-19',780,0,0,'女子安宁（张蓝艺 饰），丈夫早逝，带着女儿独自居住。有一天夜晚，家中停电，一名带着面具的男子侵入房间，欲非礼安宁，安宁拼死反抗，面具男子惊慌逃窜，却在过程中将点燃的蜡烛推倒，导致失火，安宁的女儿不幸丧生火海，失去孩子的安宁悲痛欲绝，由于线索缺失，凶手未能抓捕归案。安宁的闺蜜赵敏（刘洛汐 饰）在得知她遭遇了不幸之后，便邀请安宁到自己家中小住一段时间，希望帮助她排遣忧伤痛苦。令人意想不到的是，随着安宁的到来，原本安静和谐的家庭变得异常诡异……',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/coming/3.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(10,'追击','Pursuit','1!=end=!2!=end=!3!=end=!4!=end=!5!=end=!6','爱尔兰','96分钟','2017-03-17',70,0,0,'格萝妮娅（露丝·布莱德利 饰）是作恶多端的黑帮老大的女儿，被父亲安排进入娱乐圈当明星，无奈星路失败，过着行尸走肉般的生活。父亲为了在激烈的帮派斗争中巩固自己的黑帮地位，自作主张将女儿嫁给自己最大的威胁对象菲奥纳（利亚姆·坎宁安 饰），不料女儿却有一个疯狂的计划。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/coming/4.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(11,'走出尘埃','Pursuit','1!=end=!2!=end=!3!=end=!4!=end=!5!=end=!6','中国','90分钟','2017-03-17',90,0,0,'本片讲述的是一个迷茫的男人重新找回自己的故事。一位曾经的摇滚歌手，二十年后是一位普通的代驾司机，这个曾经的摇滚青年身上已看不出丝毫当年的激情，他如同现实中大多数同龄人一样，深陷忙碌见招拆招的生活。生活的轨道在不可预知的拐点发生了不可控制的变化，且事情的发展，远远超乎他的想象……',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/coming/5.png','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(12,'滚出来，凶手','Come On Murderer：The Legendary Thief...','1!=end=!2!=end=!3!=end=!4!=end=!5!=end=!6','中国','90分钟','2017-03-17',55,0,0,'本片依托经典古装探案题材的爱情讽刺喜剧，它讲述了北宋年间，来自讼师世家既逗逼贱萌、又天赋异禀的讼师段岚，联合武功高强的正义女捕快欧阳飞雪，探破层层假象、最终侦破离奇命案，吊打各式渣男的欢乐故事。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/coming/6.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(13,'二宝闯江湖','A Story of Two Wanderers','1!=end=!2!=end=!3!=end=!4!=end=!5!=end=!6','中国大陆','93分钟','2017-03-23',65,0,0,'大宝（女）和小宝（男）是一对情侣，两人爱慕虚荣、好吃懒做，整天异想天开、梦想不劳而获。小宝对大宝言听计从、马首是瞻。大宝决定利用诈骗手段来闯荡所谓的江湖。一笨一傻两个活宝先是利用街头诈骗手段来行骗，没想到遭遇惨痛失败，在骗子江湖中留下千古笑话。两人痛定思痛，找到“骗无形”学习了新型电信网络诈骗手段再次开始行骗，在搞笑无厘头的剧情中二宝不断地变换升级诈骗手段，有成功有失败，最终还是自食其果落入法网。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/coming/8.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0),(14,'唤爱','The call of love','1!=end=!2!=end=!3!=end=!4!=end=!5!=end=!6','中国大陆','90分钟','2017-03-23',10,0,0,'故事提取了其中一个真实的人物原型，因母亲病逝，父亲受伤瘫痪不得不扛起家庭的灾难。天真无邪的小主人公，没有感受到生活的改变。他没抱怨、没怯懦，用快乐健康的精神熔化艰辛苦难的生活，在他纯真的眼里，天空是蓝的，生活是美好的。他需要这么做，他爱他的爸爸。他用朴实的行动感染着这整个世界。像顽强的小草，用小小的肩膀背负着家庭的巨石，用坚毅的生命争取他心中的世界。',1,'1!=end=!2!=end=!3!=end=!4','','/movie/image/coming/7.jpg','/movie/image/movie/1/1.jpeg!=end=!/movie/image/movie/1/2.jpeg!=end=!/movie/image/movie/1/3.jpeg!=end=!/movie/image/movie/1/4.jpeg!=end=!/movie/image/movie/1/5.jpeg',0);
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
  `introduce` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'专访《最终幻想》导演野末武志：成龙的电影不也很中二嘛','2017-03-09',0,'/movie/image/1.jpg','<p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_1.jpeg\"/><br/>\n                    </span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">据剧中演员杰里米&middot;斯威夫特透露，本剧改编大</span>电影<span\n\n                        style=\"color: rgb(51, 51, 51);\">已经完成剧本的创作，并且曾一度以邮件形式发送至各主演处，然而不久后这些邮件却有如魔法般从邮箱中消失。尽管此项目还没有最终敲定，但斯威夫特坚信本片最早将于今年开拍。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_2.jpeg\"/><br/></span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">《</span>唐顿庄园<span style=\"color: rgb(51, 51, 51);\">》制作方Carnival Films表示目前尚未有具体消息证实这一说法，一切有待官宣。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_3.jpeg\"/><br/></span>\n                </p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_4.jpeg\"/><br/></span>\n                </p>','采访、文/少年英雄方枪枪2013年，汤姆·希德勒斯顿因出演电影《雷神》中的“洛基”而风靡全球。一般电影里的反派角色通常都会让人恨到心坎里，但惟独抖森饰演的“洛基”打破了这个常规...'),(2,'《生化危机》电影怪兽图鉴，想把最后一只抱回家养','2017-02-23',0,'/movie/image/2.jpg','<p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_1.jpeg\"/><br/>\n                    </span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">据剧中演员杰里米&middot;斯威夫特透露，本剧改编大</span>电影<span\n\n                        style=\"color: rgb(51, 51, 51);\">已经完成剧本的创作，并且曾一度以邮件形式发送至各主演处，然而不久后这些邮件却有如魔法般从邮箱中消失。尽管此项目还没有最终敲定，但斯威夫特坚信本片最早将于今年开拍。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_2.jpeg\"/><br/></span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">《</span>唐顿庄园<span style=\"color: rgb(51, 51, 51);\">》制作方Carnival Films表示目前尚未有具体消息证实这一说法，一切有待官宣。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_3.jpeg\"/><br/></span>\n                </p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_4.jpeg\"/><br/></span>\n                </p>','采访、文/少年英雄方枪枪2013年，汤姆·希德勒斯顿因出演电影《雷神》中的“洛基”而风靡全球。一般电影里的反派角色通常都会让人恨到心坎里，但惟独抖森饰演的“洛基”打破了这个常规...'),(3,'《金刚：骷髅岛》 孤岛惊魂预告展现史上最残酷生物链','2017-03-14',0,'/movie/image/3.jpg','<p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_1.jpeg\"/><br/>\n                    </span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">据剧中演员杰里米&middot;斯威夫特透露，本剧改编大</span>电影<span\n\n                        style=\"color: rgb(51, 51, 51);\">已经完成剧本的创作，并且曾一度以邮件形式发送至各主演处，然而不久后这些邮件却有如魔法般从邮箱中消失。尽管此项目还没有最终敲定，但斯威夫特坚信本片最早将于今年开拍。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_2.jpeg\"/><br/></span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">《</span>唐顿庄园<span style=\"color: rgb(51, 51, 51);\">》制作方Carnival Films表示目前尚未有具体消息证实这一说法，一切有待官宣。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_3.jpeg\"/><br/></span>\n                </p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_4.jpeg\"/><br/></span>\n                </p>','采访、文/少年英雄方枪枪2013年，汤姆·希德勒斯顿因出演电影《雷神》中的“洛基”而风靡全球。一般电影里的反派角色通常都会让人恨到心坎里，但惟独抖森饰演的“洛基”打破了这个常规...'),(4,'专访林宥嘉：如果有机会演电影想做个禁欲系变种人！','2017-03-02',0,'/movie/image/4.jpg','<p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_1.jpeg\"/><br/>\n                    </span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">据剧中演员杰里米&middot;斯威夫特透露，本剧改编大</span>电影<span\n\n                        style=\"color: rgb(51, 51, 51);\">已经完成剧本的创作，并且曾一度以邮件形式发送至各主演处，然而不久后这些邮件却有如魔法般从邮箱中消失。尽管此项目还没有最终敲定，但斯威夫特坚信本片最早将于今年开拍。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_2.jpeg\"/><br/></span>\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p><span style=\"color: rgb(51, 51, 51);\">《</span>唐顿庄园<span style=\"color: rgb(51, 51, 51);\">》制作方Carnival Films表示目前尚未有具体消息证实这一说法，一切有待官宣。</span>\n\n                </p>\n                <p><span style=\"color: rgb(51, 51, 51);\"><br/></span></p>\n                <p class=\"image-wrapper\">\n                    <span style=\"color: rgb(51, 51, 51);\">\n                        <img src=\"/movie/image/news/1_3.jpeg\"/><br/></span>\n                </p>\n                <p class=\"image-wrapper\"><span style=\"color: rgb(51, 51, 51);\">\n                    <img src=\"/movie/image/news/1_4.jpeg\"/><br/></span>\n                </p>','采访、文/少年英雄方枪枪2013年，汤姆·希德勒斯顿因出演电影《雷神》中的“洛基”而风靡全球。一般电影里的反派角色通常都会让人恨到心坎里，但惟独抖森饰演的“洛基”打破了这个常规...');
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
  `othername` varchar(255) NOT NULL,
  `birth` date DEFAULT NULL,
  `fan` int(11) DEFAULT '0',
  `boxoffice` double DEFAULT '0',
  `works` varchar(255) NOT NULL,
  `introduce` text,
  `birthplace` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `constellation` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `prizeIds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer`
--

LOCK TABLES `performer` WRITE;
/*!40000 ALTER TABLE `performer` DISABLE KEYS */;
INSERT INTO `performer` VALUES (1,'布丽特·罗伯森','Britt Robertson','布丽特·罗伯森','1990-04-18',208,4.11,'1','布丽特·罗伯森，2000年出演连续剧处女作《Sheena》，开启演艺之路。2003年凭借电影处女作《The Ghost Club》获得青年艺人大奖电视电影或迷你剧最佳年轻女主角的提名。2008年在CBS连续剧《小镇春色》中首次担任常驻角色。2010年在连续剧《意想不到的生活》中首次担任主角。2012年主演爱情片《第一次》。2013年参演改编自斯蒂芬·金同名小说的连续剧《穹顶之下》。2015年主演科幻片《明日世界》和爱情片《最长的旅程》。2016年主演电影《一条狗的使命》和《世界之外》。','美国北卡罗莱那州夏洛特市','美国','女','白羊座','160cm','/movie/image/director/4.jpeg','/movie/image/director/5.jpeg!=end=!/movie/image/director/6.jpeg',''),(2,'布乔什·盖德','Josh Gad','乔什·盖德','1971-02-23',66,12.23,'1','乔什·盖德，阿富汗裔犹太人后裔。毕业于卡耐基梅隆大学。2009年开始成为喜剧中心每日秀当客席报道员。电影代表作有《爱情与灵药》《她要我了》《定制伴郎》等。同时活跃于配音界，曾为《冰雪奇缘》中的雪宝和《冰河世纪4》中的鼹鼠Louis配音，并凭借前者的精彩表现获得第41届动画安妮奖最佳配音奖。','美国弗罗里达州好莱坞','美国','男','双鱼座','168cm','/movie/image/director/7.jpeg','/movie/image/director/8.jpeg!=end=!/movie/image/director/9.jpeg',''),(3,'丹尼斯·奎德','Dennis Quaid','丹尼斯奎尔（台,港）,Dennis William','1956-04-09',29,5.49,'1','丹尼斯·奎德出生于美国德州休斯顿，父亲是一位电工。他在中学和大学期间学习戏剧，在哥哥兰迪的影响下，放弃学业跑到洛杉矶寻求发展。1979年，丹尼斯凭借自行车励志影片《突破》崭露头角。1983年，丹尼斯成功出演太空影片《太空英雄》，并获得业界一致好评。1987年他又拍了《大出意外》一片。虽然这些影片的票房一般，但丹尼斯的演技已被好莱坞认可。1987年他与女星梅格·瑞安在科幻片《零度空间》中合作。尽管1996年的《魔幻屠龙》使得丹尼斯的商业价值在一定程度上受到片商的肯定，但他还是未能走红。碌碌无为地度过了几年后，2000年人们又开始关注丹尼斯·奎德，因为他和梅格·瑞安的婚姻走到了尽头。和梅格·瑞安离婚之后，丹尼斯和梅格两个人的事业似乎来了个对调，原先一直蒸蒸日上梅格这两年表现平平。而丹尼斯却接连出演多部优秀影片，包括讲述父子真情的《黑洞频率》，奥斯卡大热片《毒品网络》，以及奥利弗·斯通的橄榄球影片《挑战星期天》。2002年，丹尼斯·奎德迎来事业的双丰收，独挑大梁的《棒球新秀》成为票房黑马，《远离天堂》则为他赢得了一座金球奖。之后又与莎朗·斯通合演《凶宅》。2004年他奉献了三部大制作影片《阿拉莫之战》、《后天》和《凤凰劫》。虽然出演的作品并非部部卖座，但近几年丹尼斯·奎德在大银幕上依然保持很高的曝光率，2009年他还与华人影星章子怡合作了恐怖片《骑士》。','美国德克萨斯州休斯顿市','美国','男','白羊座','183cm','/movie/image/director/7.jpeg','/movie/image/director/8.jpeg!=end=!/movie/image/director/9.jpeg',''),(4,'佩吉·利普顿','Peggy Lipton','Peggy Lipton Jones','1946-08-30',19,4.11,'1','佩吉·利普顿，Peggy Lipton was born on August 30, 1946 in New York City, New York, USA as Margaret Ann Lipton. She is an actress, known for The Mod Squad (1968), The Postman (1997) and Twin Peaks: Fire Walk with Me (1992). She was previously married to Quincy Jones.','美国纽约','美国','女','处女座','168cm','/movie/image/director/10.jpeg','/movie/image/director/11.jpeg!=end=!/movie/image/director/12.jpeg','');
/*!40000 ALTER TABLE `performer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'猫爪团粉丝同盟：王丽坤生日快乐','/movie/image/photo/1_1.jpg!=end=!/movie/image/photo/1_2.jpg!=end=!/movie/image/photo/1_3.jpg!=end=!/movie/image/photo/1_4.png!=end=!/movie/image/photo/1_5.jpg!=end=!/movie/image/photo/1_6.png',6);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (0,'全部'),(1,'大陆'),(2,'美国'),(3,'韩国'),(4,'日本'),(5,'中国香港'),(6,'中国台湾'),(7,'泰国'),(8,'印度'),(9,'法国'),(10,'英国'),(11,'俄罗斯'),(12,'意大利'),(13,'西班牙'),(14,'德国'),(15,'波兰'),(16,'澳大利亚'),(17,'伊朗'),(18,'其他');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (0,'全部'),(1,'演唱会'),(2,'话剧'),(3,'音乐会'),(4,'舞蹈表演'),(5,'戏剧'),(6,'儿童亲子');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'冯凯','15275247807@163.com','ZmVuZ2thaTEyMy4w'),(2,'','','');
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

-- Dump completed on 2017-03-22 17:42:14
