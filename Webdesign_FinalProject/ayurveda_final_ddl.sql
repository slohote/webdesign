-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ayurveda_final
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `UK_29gntjt80v5dpmg9ejhxq1cl6` (`categoryname`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (15,'bbbbb'),(6,'Beautytip'),(5,'Body Type'),(13,'dhsfgjsd'),(8,'Food'),(7,'Medication'),(17,'test1'),(14,'test123'),(16,'uuuu1');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `commentDate` datetime DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `personid` int(11) NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `FKkctglssx150j1pf12spwatoa6` (`itemid`),
  KEY `FK61lj6xpm8plofo37kmg9rhnr1` (`personid`),
  CONSTRAINT `FK61lj6xpm8plofo37kmg9rhnr1` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `FKkctglssx150j1pf12spwatoa6` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,'2016-12-11 00:06:24','This is a good article nice.',18,3),(3,'2016-12-11 00:07:17','Yes Thyme is one of the herb which is known by less people',16,3),(4,'2016-12-11 00:08:22','Wow nice article will definitely try this at home. can you provide few more tips',18,2),(5,'2016-12-11 00:09:09','Can we keep mint paste for longer time interval',17,2),(6,'2016-12-11 00:09:09','Can we keep mint paste for longer time interval',17,2),(8,'2016-12-11 00:36:15','Thank you all. Vijayashree you can try boiling curry leaves in sesame seed oil and try applying it alternate weekend. You will see improvement',18,1),(9,'2016-12-10 11:32:37','nice article',13,1),(10,'2016-12-11 15:45:02','dsfhg',22,1),(11,'2016-12-10 15:46:11','thacxvfdfgd',22,2),(12,'2016-12-09 16:18:38','sghjtusz',23,1),(17,'2016-12-11 21:17:28','kanishu is a user she can only voiew the post comment and like the post she cannot post her own article. she can ask questions to expert or admin',25,23),(18,'2016-12-11 21:49:57','admin can comment',20,1),(19,'2016-12-10 21:55:16','expert  nice post',26,3),(20,'2016-12-11 21:56:32','really nice post',26,24),(22,'2016-12-11 00:11:06','ji',20,1),(23,'2016-12-11 00:12:48','ki',20,1),(24,'2016-12-11 00:13:02','lo',20,1),(25,'2016-12-11 00:13:28','lo',20,1),(27,'2016-12-11 00:14:03','ko',20,1),(28,'2016-12-11 00:14:21','yyyyyy',20,1),(29,'2016-12-11 00:43:44','ppp',20,1),(30,'2016-12-11 00:47:06','jj',26,3),(31,'2016-12-11 00:47:29','jjj',22,3),(32,'2016-12-11 00:47:45','hi',18,3),(33,'2016-12-11 19:13:22','awesome madam',20,28);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqtable`
--

DROP TABLE IF EXISTS `faqtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqtable` (
  `faqid` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(2000) DEFAULT NULL,
  `question` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`faqid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqtable`
--

LOCK TABLES `faqtable` WRITE;
/*!40000 ALTER TABLE `faqtable` DISABLE KEYS */;
INSERT INTO `faqtable` VALUES (2,'We can know our V P K body type through skin hair etc but then many of our matching qualities could fall into one or two categories  Then we can fix our present V P K disposition as mono V P K or dual type VP PK KV also VP PV KP KV VK ie one is greater than other','How to identify body type'),(4,'1 Vatha-Pitha  dry  sensitive 2 Kapha-Pitha  oily  sensitive3 Vatha-Kapha  dry  Oily','What are skin type for different body type'),(5,'Body built is thin and have dry skin. There sleep and dream are sound and flying. They generally speak fast. Their mind is clear and alert. They should avoid taking cabbage, cauliflower, brinjal. They should prefer taking carrot, beat root and green vegetables. They prefer warm or humid climat.','What is Vatha bodytype'),(7,'admin can post answer','admin can post question'),(8,'ag','qg55');
/*!40000 ALTER TABLE `faqtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herbs`
--

DROP TABLE IF EXISTS `herbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herbs` (
  `herbid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `herbname` varchar(255) DEFAULT NULL,
  `imagename` varchar(255) DEFAULT NULL,
  `scientificname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`herbid`),
  UNIQUE KEY `UK_djho9fjuurnq6vo0w5lalelc3` (`herbname`),
  UNIQUE KEY `UK_jwr8wfm5dyspvkw0upfljqe5a` (`imagename`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herbs`
--

LOCK TABLES `herbs` WRITE;
/*!40000 ALTER TABLE `herbs` DISABLE KEYS */;
INSERT INTO `herbs` VALUES (1,'Basil and holy basil are used in ayurveda to maintain and promote the long-term health of the respiratory tractBasil tea can help clear shleshma from the lungs and the respiratory areaIt is also used to settle stomach disorders and to enhance digestionA mild natural sleep aidbasil enhances the quality of sleep.','Basil','basil.jpg','Ocimum basilicum'),(2,'Mint is a cooling herb, with a sweet taste and a pungent aftertaste.Mint is good for digestion as well as for respiratory system health.','Mint','mint.jpg','Mentha'),(3,'The herbs in Clear Breathe are combined in precise proportions and prepared in the traditional ayurvedic way. This aids the bioavailability and assimilation of vital nutrients. It also creates synergy — the collective benefit is much greater than that of isolated, individual herbs.','Eucalyptus','eucalyptus.jpg','Eucalyptus globulus'),(4,'Neem leaf is famous in ayurvedic texts for having an almost magical effect on the skin. Traditionally used in ayurvedic remedies for its purifying quality, the neem leaves were crushed into a paste and applied directly to problem skin.','Neem','neem.jpg','Azadirachta indica'),(5,'Brilliant mouth freshener and helps to get rid of bad breath, aids in digestion and boosts immunity against infections and common cold.  It is a good source of Vitamin A and C.','Parsley','parsley.jpg','Petroselinum crispum'),(6,'It comes in more than 60 varieties but three most popular are used in Indian, Italian, French, Spanish, Greek and Turkish cusine','Thyme','thyme.jpg','Thymus vulgaris'),(7,'Weedy herb, bittersweet and lemony taste.  Popularly used for stuffing and dressing soups and meat dishes. It contains powerful anticancer compound memory improving qualities (carnosic acid).','Rosemary','rosemary.jpg','Rosmarinus officinalis'),(8,'It has several healing properties. So it is called sage i.e. “To save” in Latin.  It is used in all three forms.  Fresh, dry and preserved.  Freshly plucked sage soaked in olive oil and preserved in refrigerator can be  used for almost two months.  This oil as well as leaves are used in salad dressing.','Sage','sage.jpg','Salvia officinalis'),(9,'To relieve inflammation of the mouth, throat and stomach, As a cream or gel, it relieve rashes and irritation and help to heal wounds.','Pot Marigold','calendula.jpg','Calendula officinalis'),(10,'Antimicrobial, used to combat colds, ease sinus congestion.','Garlic','garlic.jpg','Allium sativum'),(11,'Premiere remedy for easing nausea, vomiting and upset stomach. Give relief for cold and flu.\nIt has aphrodisiac, anti oxidant and toning properties which contribute to radiant skin.','Ginger ','ginger.jpg','Zingiber officinale'),(12,'Lower blood pressure.  It is a good blood purifier. Strengthen heart.','Hibiscus','hibiscus.jpg','Hibiscus rosa-sinensis'),(13,'Excellent anti inflammatory, soothes mucus membranes, useful for sore throats and coughs','Liquorice','liquorice.jpg','Glycyrrhiza glabra'),(14,'Used for many skin problems like burns, skin rashes, psoriasis.  Aloe vera is rich in calcium, potassium, Vitamin C, E, Zinc.','Aloe Vera','aloe.jpg','Aloe Barbadensis Miller'),(15,'It is an anti inflammatory, anti oxidant, anti bacterial, anti viral, anti fungal and anti disease agent.','Turmeric','turmeric.jpg','Curcuma longa'),(16,'Ashwagandha (Withania somnifera) root is a herb of the ages. It is the ginseng of Ayurvedic medicine, the traditional medicine of India and is considered an adaptogen, a term used to describe herbs that improve physical energy and athletic ability, increase immunity to colds and infections and increase sexual capacity and fertility.','Ashwagandha','ashwagandha.jpg','Withania somnifera'),(44,'test','test','1467421893474herb1.jpg','test'),(45,'herbdemo','demo herb','1467424360403herb1.jpg','demo');
/*!40000 ALTER TABLE `herbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `benifits` varchar(2000) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `postDate` varchar(255) DEFAULT NULL,
  `procedurestep` varchar(2000) DEFAULT NULL,
  `herbid` int(11) DEFAULT NULL,
  `subcategoryid` int(11) DEFAULT NULL,
  `personid` int(11) NOT NULL,
  `subCatId` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKclfcrclh60n2iparm0su96k8u` (`subcategoryid`),
  KEY `FKhnoav5nqq5gnk7k2cct1k02so` (`herbid`),
  CONSTRAINT `FKclfcrclh60n2iparm0su96k8u` FOREIGN KEY (`subcategoryid`) REFERENCES `subcategory` (`subcategoryid`),
  CONSTRAINT `FKhnoav5nqq5gnk7k2cct1k02so` FOREIGN KEY (`herbid`) REFERENCES `herbs` (`herbid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (12,'It reduces acne, dark spots, and skin discoloration.','Medium size head of fresh organic parsley1 soaked in warm water and then fine choppedFresh Lemon Juice1 table spoonif sensitive skin, reduce it tospoonHoney2 tablespoon','Anti acne facepack using parsley','2016-12-11 10:44:30 PM','Grind parsley, add lemon juice and honey.Apply the paste on cleansed face avoiding eye area, leave it for 1015 minutes, wash out.',5,8,1,0),(13,'Helps to control blood pressure, ensure oxygen carring capacity in blood.  Powerful antioxidants','1.Sweet basil  used in Italian cusine 2.Lemon basil  Mostly used in Thai cusine and North Africa.3.Thai basil or Mint basil4.Holy basil  Tulsi','Salad consisting of Basil','2016-12-11 10:47:03 PM','Pesto, basil tea, tomato basil soup, basil pasta salad, margarita pizza.',1,13,1,0),(15,'Helps to control blood pressure, ensure oxygen carring capacity in blood.  Powerful antioxidants','1.Sweet basil  used in Italian cusine 2.Lemon basil  Mostly used in Thai cusine and North Africa.3.Thai basil or Mint basil4.Holy basil  Tulsi','King of herb Basil','2016-12-10 10:53:22 PM','It is a rich source of Vitamin A, K, C, Calcium, Magnesium, Potassium,  Iron, anti-oxidants and phyto-nutrients used in anti acne face pack and cream.',1,8,1,0),(16,'It is anti-septic in nature and when boiled with water and tea, it reduces throat infections and dry coughs.  A very good source of fibre, Vitamin K, Iron, Calcium and Magnesium for preventing bone diceases.','Types 1Garden Thyme, 2 Lemon Thyme  and 3 Orange Thyme','A way to prevent bone diseases','2016-12-11 10:56:31 PM','Have 1 glass of boiled water having thyme to avoid bone diseases',6,14,1,0),(17,'As a soothing agent, it is used to cure stomach aches.  Mint tea eliminate toxins and reduces irregular bowel syndrome chewing mint leaves whitens teeth and combats bad breath.','The most flexible flavouring agents among all herbs.  It is used as garnishing, appetizer, main course desserts, beverages, soups, salads, tea and lots of other dishes.','A way for fresh breath','2016-12-10 10:58:07 PM','Grind mind leaves with rose water. Apply on oil  pimples face. Leave for 20-25 minutes. Rinse out.  Rich in salicylic acid. It helps to control and heal pimple quickly. Lighten skin tone. Boiled and cooled mint leaves water helps keep your skin oil free and fresh.',2,14,1,0),(18,'Some grated gingers with 2 TSP honey and 1 TSP lemon juice kept in refrigerator for 30 minutes.  Apply this mixture on face  avoid eye area, leave it for 30 minutes, rinse with cool water.','Premiere remedy for easing nausea, vomiting and upset stomach. Give relief for cold and flu.It has aphrodisiac, anti oxidant and toning properties which contribute to radiant skin.','Secret for beautiful long hairs','2016-12-11 11:00:13 PM','1 TSP ginger paste with 1 TSP jojoba oil. Massage your scalp with this mixture leave for 30 min. rinse off and shampoo.',11,9,1,0),(20,'Lots of benefits','New description','new post','2016-12-11 11:53:29 AM','easy',2,11,3,0),(22,'dsukfugjdsg','jdhfgjs','dsfkjs','2016-12-11 03:44:09 PM','jsdgfjsu',7,8,1,0),(23,'777','fdshdfss','rgtruhdgyjtdzx','2016-12-11 04:18:20 PM','dsvd',3,9,1,0),(25,'expert is posting','expert is posting','expert can write their own article and post','2016-12-11 09:16:19 PM','expert is posting',8,14,3,0),(26,'do somthing','do somthing','admin can post','2016-12-11 09:53:18 PM','do somthing',12,8,1,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liketable`
--

DROP TABLE IF EXISTS `liketable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liketable` (
  `likeid` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL,
  `personid` int(11) DEFAULT NULL,
  PRIMARY KEY (`likeid`),
  KEY `FKhua5p7kg8lhexahu3g5715n75` (`itemid`),
  KEY `FK_personid_idx` (`personid`),
  CONSTRAINT `FK_personid` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKa8ct3jopr3pob1smwih7daixs` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `FKhua5p7kg8lhexahu3g5715n75` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liketable`
--

LOCK TABLES `liketable` WRITE;
/*!40000 ALTER TABLE `liketable` DISABLE KEYS */;
INSERT INTO `liketable` VALUES (2,17,3),(3,12,3),(4,18,2),(5,17,2),(6,16,2),(7,12,2),(8,18,19),(9,16,19),(10,13,19),(11,18,18),(32,18,3),(34,20,17),(40,22,2),(42,23,1),(43,20,2),(44,18,1),(47,25,3),(48,25,23),(49,13,1),(50,26,1),(51,26,3),(52,26,24),(54,20,1),(65,20,28);
/*!40000 ALTER TABLE `liketable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personid` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`personid`),
  KEY `FKhova33170alph6t2e9aot87rv` (`userid`),
  CONSTRAINT `FKhova33170alph6t2e9aot87rv` FOREIGN KEY (`userid`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,53,'admin@gmail.com','Geetha','Uppili','1234567897',1),(2,26,'experti@gmail.com','jiya','Upp','6179915227',2),(3,56,'experti@gmail.com','Uppili','Srinivasan','9874561230',3),(17,25,'u_arjun@gmail.com','Arjun','Upadhyay','5269874512',11),(18,25,'dd@gmail.com','Daksha','Nagpal','4785321456',12),(19,29,'jaya@gmail.com','Jayashree','Uppili','8569321456',13),(20,29,'j@gmail.com','Jaya','Sharma','5823695475',15),(21,2,'','random','user','1234567890',16),(22,12,'kkkk@ghjgj.com','kkkk','kkkk','7896523652',17),(23,2,'ksharma@gmail.com','kanishka','Sharma','5263985623',18),(24,2,'kachu@gmail.com','kachu','kachu','5236987456',19),(25,12,'arjun@gmail.com','Arjun','Upadhyay','1111111111',20),(26,7,'j@gmail.com','j','j','6767676767',22),(27,8,'g@gmail.com','jk','uu','7878787898',23),(28,25,'bac@gmail.com','a','b','2222222222',24);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `subcategoryname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `UK_19cuajslh0hhj254mn85axdmi` (`subcategoryname`),
  KEY `FKdsi5hyx3uwi4cupffyc57i9d2` (`category`),
  CONSTRAINT `FKdsi5hyx3uwi4cupffyc57i9d2` FOREIGN KEY (`category`) REFERENCES `category` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (5,5,'Vatha'),(6,5,'Pitha'),(7,5,'Kapha'),(8,6,'Face Pack'),(9,6,'Hair'),(10,8,'Green  Tea'),(11,8,'Fruits'),(12,8,'Vegetables'),(13,8,'Salad'),(14,7,'Herbs'),(21,13,'dhfgdfds'),(22,14,'test'),(24,6,'test1');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,'Z2VldGhh','admin','Active','geetha'),(2,'Sml5YTEk','user','Active','jiya'),(3,'VXBwaWxpMSQ=','expert','Active','uppili'),(11,'QXJqdW4xJA==','user','Active','arjun'),(12,'RGFrc2hhMSQ=','user','Active','daksha'),(13,'SmF5YTEk','user','InActive','Jaya'),(14,'abc123','admin','Active','shubh'),(15,'SmF5YTEk','expert','Active','jayashree'),(16,'TG92ZUBzaDYx','user','InActive','random'),(17,'S3NiZGpoZmpzZDFA','user','Active','hjkk'),(18,'S2FuaXNodTEk','user','Active','kanishu'),(19,'S2FjaHUxJA==','user','Active','kachu'),(20,'WVdveE1qTTA=','user','InActive','aj1234'),(22,'YXMxMjM=','user','Active','fg12'),(23,'aGpq','user','Active','hj'),(24,'YWJjMTIz','user','Active','abc123');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ayurveda_final'
--

--
-- Dumping routines for database 'ayurveda_final'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 22:32:30
