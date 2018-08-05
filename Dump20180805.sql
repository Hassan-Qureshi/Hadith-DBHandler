-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `annotations`
--

DROP TABLE IF EXISTS `annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANNOTATION` varchar(2000) DEFAULT NULL,
  `ANNOTATION_OF` int(11) NOT NULL,
  `DATE` datetime NOT NULL,
  `LAST_MODIFIED` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotations`
--

LOCK TABLES `annotations` WRITE;
/*!40000 ALTER TABLE `annotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catagory`
--

DROP TABLE IF EXISTS `catagory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catagory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(512) NOT NULL,
  `QUESTION` varchar(2000) DEFAULT NULL,
  `DATECREATED` datetime NOT NULL,
  `LASTMODIFIED` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catagory`
--

LOCK TABLES `catagory` WRITE;
/*!40000 ALTER TABLE `catagory` DISABLE KEYS */;
INSERT INTO `catagory` VALUES (10,'NER','<?xml version = \"1.0\" encoding = \"UTF-8\" ?><Category name=\"Annotate the Hadith checking the similarity of the category.\" count=5><value id=0>Madina</value><value id=1>Makka</value><value id=2>Taef</value><value id=3>Isamabad</value><value id=4>Jhang</value></Category><Category name=\"People\" count=4><value id=0>Ali</value><value id=1>Adnan</value><value id=2>Yousaf</value><value id=3>Ahmad</value></Category>','2018-03-25 15:21:02','2018-03-25 15:21:02'),(11,'NER','<?xml version = \"1.0\" encoding = \"UTF-8\" ?><Category name=\"Place\" count=5><value id=0>Madina</value><value id=1>Makka</value><value id=2>Taef</value><value id=3>Isamabad</value><value id=4>Jhang</value></Category><Category name=\"People\" count=4><value id=0>Ali</value><value id=1>Adnan</value><value id=2>Yousaf</value><value id=3>Ahmad</value></Category>','2018-03-25 15:59:40','2018-03-25 15:59:40'),(12,'NER','<?xml version = \"1.0\" encoding = \"UTF-8\" ?><Category name=\"Place\" count=5><value id=0>Madina</value><value id=1>Makka</value><value id=2>Taef</value><value id=3>Isamabad</value><value id=4>Jhang</value></Category><Category name=\"People\" count=4><value id=0>Ali</value><value id=1>Adnan</value><value id=2>Yousaf</value><value id=3>Ahmad</value></Category>','2018-03-25 16:20:33','2018-03-25 16:20:33'),(13,'NER','<?xml version = \"1.0\" encoding = \"UTF-8\" ?><Category name=\"Place\" count=5><value id=0>Madina</value><value id=1>Makka</value><value id=2>Taef</value><value id=3>Isamabad</value><value id=4>Jhang</value></Category><Category name=\"People\" count=4><value id=0>Ali</value><value id=1>Adnan</value><value id=2>Yousaf</value><value id=3>Ahmad</value></Category>','2018-03-25 16:21:29','2018-03-25 16:21:29'),(14,'NER','<?xml version = \"1.0\" encoding = \"UTF-8\" ?><Catagory name=\"Place\" count=\"5\"><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory><Catagory name=\"People\" count=\"4\"><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory>','2018-03-25 16:27:39','2018-03-25 16:27:39'),(15,'NER','<xml version = \"1.0\" encoding = \"UTF-8\"><Catagory name=\"Place\" count=\"5\"><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory><Catagory name=\"People\" count=\"4\"><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory></xml>','2018-03-25 16:42:15','2018-03-25 16:42:15'),(16,'NER','<xml version = \'1.0\' encoding = \'UTF-8\'><Catagory name=\'People\' count=\'4\'><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory><Catagory name=\'Place\' count=\'5\'><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory></xml>','2018-03-25 16:46:03','2018-03-25 16:46:03'),(17,'NER','<xml><Catagory name=\'Place\' count=\'5\'><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory><Catagory name=\'People\' count=\'4\'><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory></xml>','2018-03-25 16:56:40','2018-03-25 16:56:40'),(18,'NER','<Catagory name=\'Place\' count=\'5\'><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory><Catagory name=\'People\' count=\'4\'><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory>','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'NER','<xml><Catagory name=\'Place\' count=\'5\'><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory><Catagory name=\'People\' count=\'4\'><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory></xml>','2018-03-25 18:21:01','2018-03-25 18:21:01'),(20,'NER','<xml><Catagory name=\'Place\' count=\'5\'><value id=\'0\'>Madina</value><value id=\'1\'>Makka</value><value id=\'2\'>Taef</value><value id=\'3\'>Isamabad</value><value id=\'4\'>Jhang</value></Catagory><Catagory name=\'People\' count=\'4\'><value id=\'0\'>Ali</value><value id=\'1\'>Adnan</value><value id=\'2\'>Yousaf</value><value id=\'3\'>Ahmad</value></Catagory></xml>','2018-03-25 21:16:53','2018-03-25 21:16:54');
/*!40000 ALTER TABLE `catagory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hadith`
--

DROP TABLE IF EXISTS `hadith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hadith` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HADITH_DATA` varchar(512) CHARACTER SET latin1 NOT NULL,
  `HADITH_DATA_ARABIC` varchar(512) DEFAULT NULL,
  `HADITH_REFERENCE` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hadith`
--

LOCK TABLES `hadith` WRITE;
/*!40000 ALTER TABLE `hadith` DISABLE KEYS */;
INSERT INTO `hadith` VALUES (1,'Narrated Abdullah bin Umar: * The Prophet (PBUH) said, \'Anyone of you attending the Friday (prayers) should take a bath.\' ',' حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ نَافِعٍ، عَنْ عَبْدِ اللَّهِ بْنِ عُمَرَ ـ رضى الله عنهما ـ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏ \'‏ إِذَا جَاءَ أَحَدُكُمُ الْجُمُعَةَ فَلْيَغْتَسِلْ ‏\' ‏ ','Sahih al-Bukhari 877 * In-book reference : Book 11, Hadith 2 * USC-MSA web (English) reference : Vol. 2, Book 13, Hadith 2 * (deprecated numbering scheme)'),(2,'Narrated Abu Said Al-Khudri: * The Prophet (PBUH) said, \'The taking of a bath on Friday is compulsory for every male (Muslim) who has attained the age of puberty.\' ',' حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ صَفْوَانَ بْنِ سُلَيْمٍ، عَنْ عَطَاءِ بْنِ يَسَارٍ، عَنْ أَبِي سَعِيدٍ الْخُدْرِيِّ ـ رضى الله عنه ـ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏ \'‏ غُسْلُ يَوْمِ الْجُمُعَةِ وَاجِبٌ عَلَى كُلِّ مُحْتَلِمٍ \' ','Sahih al-Bukhari 879 * In-book reference : Book 11, Hadith 4 * USC-MSA web (English) reference : Vol. 2, Book 13, Hadith 4 * (deprecated numbering scheme)'),(3,'Narrated Abu Huraira: * The Prophet (PBUH) said, \'If I had not found it hard for my followers or the people, I would have ordered them to clean their teeth with Siwak for every prayer.\' ',' حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ أَبِي الزِّنَادِ، عَنِ الأَعْرَجِ، عَنْ أَبِي هُرَيْرَةَ ـ رضى الله عنه ـ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏ \'‏ لَوْلاَ أَنْ أَشُقَّ عَلَى أُمَّتِي ـ أَوْ عَلَى النَّاسِ ـ لأَمَرْتُهُمْ بِالسِّوَاكِ مَعَ كُلِّ صَلاَةٍ ‏\'‏‏\' ','Sahih al-Bukhari 887 * In-book reference : Book 11, Hadith 12 * USC-MSA web (English) reference : Vol. 2, Book 13, Hadith 12 * (deprecated numbering scheme)'),(4,'Narrated Anas: * The Prophet (PBUH) said, \'I have told you repeatedly to use the Siwak. (The Prophet (?) put emphasis on the use of the Siwak.).\' ',' حَدَّثَنَا أَبُو مَعْمَرٍ، قَالَ حَدَّثَنَا عَبْدُ الْوَارِثِ، قَالَ حَدَّثَنَا شُعَيْبُ بْنُ الْحَبْحَابِ، حَدَّثَنَا أَنَسٌ، قَالَ قَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏ \'‏ أَكْثَرْتُ عَلَيْكُمْ فِي السِّوَاكِ ‏\' ','Sahih al-Bukhari 888 * In-book reference : Book 11, Hadith 13 * USC-MSA web (English) reference '),(5,'Narrated Hudhaifa: *  \'When the Prophet (PBUH) got up at night (for the night prayer), he used to clean his mouth.\' ',' \'حَدَّثَنَا مُحَمَّدُ بْنُ كَثِيرٍ، قَالَ أَخْبَرَنَا سُفْيَانُ، عَنْ مَنْصُورٍ، وَحُصَيْنٍ، عَنْ أَبِي وَائِلٍ، عَنْ حُذَيْفَةَ، قَالَ كَانَ النَّبِيُّ صلى الله عليه وسلم إِذَا قَامَ مِنَ اللَّيْلِ يَشُوصُ فَاهُ‏.‏\' ','Sahih al-Bukhari 889 * In-book reference : Book 11, Hadith 14 * USC-MSA web (English) reference : Vol. 2, Book 13, Hadith 14 * (deprecated numbering scheme)'),(6,'Narrated Muhammad bin Al Munkadir: *  \'I saw Jabir bin Abdullah praying in a single garment and he said that he had seen the Prophet (?) praying in a single garment.\' ',' \'حَدَّثَنَا مُطَرِّفٌ أَبُو مُصْعَبٍ، قَالَ حَدَّثَنَا عَبْدُ الرَّحْمَنِ بْنُ أَبِي الْمَوَالِي، عَنْ مُحَمَّدِ بْنِ الْمُنْكَدِرِ، قَالَ رَأَيْتُ جَابِرَ بْنَ عَبْدِ اللَّهِ يُصَلِّي فِي ثَوْبٍ وَاحِدٍ وَقَالَ رَأَيْتُ النَّبِيَّ صلى الله عليه وسلم يُصَلِّي فِي ثَوْبٍ‏\' ','Sahih al-Bukhari 353 * In-book reference : Book 8, Hadith 5 * USC-MSA web (English) reference : Vol. 1, Book 8, Hadith 249 * (deprecated numbering scheme)'),(7,'Narrated Umar bin Abi Salama: *  \'I saw the Prophet (?) offering prayers in a single garment in the house of Um-Salama and he had crossed its ends around his shoulders\' ',' \'حَدَّثَنَا مُحَمَّدُ بْنُ الْمُثَنَّى، قَالَ حَدَّثَنَا يَحْيَى، قَالَ حَدَّثَنَا هِشَامٌ، قَالَ حَدَّثَنِي أَبِي، عَنْ عُمَرَ بْنِ أَبِي سَلَمَةَ، أَنَّهُ رَأَى النَّبِيَّ صلى الله عليه وسلم يُصَلِّي فِي ثَوْبٍ وَاحِدٍ فِي بَيْتِ أُمِّ سَلَمَةَ، قَدْ أَلْقَى طَرَفَيْهِ عَلَى عَاتِقَيْ\' ','Sahih al-Bukhari 355 * In-book reference : Book 8, Hadith 7 * USC-MSA web (English) reference : Vol. 1, Book 8, Hadith 351 * (deprecated numbering scheme)'),(8,'Narrated Abu Huraira: *  The Prophet (?) said, \'None of you should offer prayer in a single garment that does not cover the shoulders.\' ',' \'حَدَّثَنَا أَبُو عَاصِمٍ، عَنْ مَالِكٍ، عَنْ أَبِي الزِّنَادِ، عَنْ عَبْدِ الرَّحْمَنِ الأَعْرَجِ، عَنْ أَبِي هُرَيْرَةَ، قَالَ قَالَ النَّبِيُّ صلى الله عليه وسلم ‏ \'‏ لاَ يُصَلِّي أَحَدُكُمْ فِي الثَّوْبِ الْوَاحِدِ، لَيْسَ عَلَى عَاتِقَيْهِ شَىْءٌ ‏\'\' ','Sahih al-Bukhari 359 * In-book reference : Book 8, Hadith 11 * USC-MSA web (English) reference : Vol. 1, Book 8, Hadith 355 * (deprecated numbering scheme)'),(9,'Narrated Abu Huraira: *  Whoever prays in a single garment must cross its ends (over the shoulders)\' ',' \'حَدَّثَنَا أَبُو نُعَيْمٍ، قَالَ حَدَّثَنَا شَيْبَانُ، عَنْ يَحْيَى بْنِ أَبِي كَثِيرٍ، عَنْ عِكْرِمَةَ، قَالَ سَمِعْتُهُ ـ أَوْ، كُنْتُ سَأَلْتُهُ ـ قَالَ سَمِعْتُ أَبَا هُرَيْرَةَ، يَقُولُ أَشْهَدُ أَنِّي سَمِعْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم يَقُولُ ‏ \'‏ مَنْ صَلَّى فِي ثَوْبٍ وَاحِدٍ، فَلْيُخَالِفْ بَيْنَ طَرَفَيْهِ \'\' ','Sahih al-Bukhari 360 * In-book reference : Book 8, Hadith 356 * USC-MSA web (English) reference : Vol. 1, Book 8, Hadith 356 * (deprecated numbering scheme)'),(10,'Narrated Aisha: *  Allah\'s Messenger (?) used to offer the Fajr prayer and some believing women covered with their veiling sheets used to attend the Fajr prayer with him and then they would return to their homes unrecognized ',' \'حَدَّثَنَا أَبُو نُعَيْمٍ، قَالَ حَدَّثَنَا شَيْبَانُ، عَنْ يَحْيَى بْنِ أَبِي كَثِيرٍ، عَنْ عِكْرِمَةَ، قَالَ سَمِعْتُهُ ـ أَوْ، كُنْتُ سَأَلْتُهُ ـ قَالَ سَمِعْتُ أَبَا هُرَيْرَةَ، يَقُولُ أَشْهَدُ أَنِّي سَمِعْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم يَقُولُ ‏ \'‏ مَنْ صَلَّى فِي ثَوْبٍ وَاحِدٍ، فَلْيُخَالِفْ بَيْنَ طَرَفَيْهِ \'\' ','Sahih al-Bukhari 372 * In-book reference : Book 8, Hadith 368 * USC-MSA web (English) reference : Vol. 1, Book 8, Hadith 368 * (deprecated numbering scheme)');
/*!40000 ALTER TABLE `hadith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learners`
--

DROP TABLE IF EXISTS `learners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learners` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(1024) NOT NULL,
  `EMAIL` varchar(512) NOT NULL,
  `PASSWORD` varchar(512) NOT NULL,
  `INTEREST` varchar(512) NOT NULL,
  `RANK` int(11) NOT NULL,
  `IS_EXPERT` int(11) NOT NULL,
  `IS_LOGIN` varchar(512) DEFAULT NULL,
  `IS_ALIVE` varchar(512) DEFAULT NULL,
  `DATE_OF_BIRTH` varchar(512) DEFAULT NULL,
  `GENDER` varchar(512) DEFAULT NULL,
  `AVATAR` varchar(512) DEFAULT NULL,
  `CELL_NUMBER` varchar(512) DEFAULT NULL,
  `COUNTRY` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learners`
--

LOCK TABLES `learners` WRITE;
/*!40000 ALTER TABLE `learners` DISABLE KEYS */;
INSERT INTO `learners` VALUES (1,'Ali','ali@google.com','ali123','Similarity',60,1,'0','1','06/04/1996','Male','abc','922342342341','Pakistan'),(2,'Abdullah','abdullah@gmail.com','abd2233','Similarity',34,0,'0','1','07/01/2001','Male','abd','923216505050','England'),(3,'Rehan','rehan@mfsys.com','rehana','NER',54,1,'1','1','07/02/1993','Male','abcd','923126554548','Afghanistan');
/*!40000 ALTER TABLE `learners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) NOT NULL,
  `EMAIL` varchar(512) NOT NULL,
  `CREDENTIALS` varchar(512) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,'Ali','ali@google.com','ali123'),(2,'Asad Abbas','asad@gmail.com','asad123'),(3,'abdullah','abdulah@gmail.com','abd');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` int(11) NOT NULL,
  `TASK_ASSIGNMENT_ID` int(11) NOT NULL,
  `RESPONSE` varchar(2000) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `CREATED_DATE` varchar(25) DEFAULT NULL,
  `RESPONSE_DATE` varchar(25) DEFAULT NULL,
  `IS_ASSIGN` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (1,1,1,'Not Collected Yet','No Description','22/07/2018 05:31:52 PM','',1),(2,2,1,'Not Collected Yet','No Description','22/07/2018 05:31:52 PM','',1),(3,1,2,'Not Collected Yet','No Description','23/07/2018 12:49:17 AM','',1),(4,2,2,'Not Collected Yet','No Description','23/07/2018 12:49:17 AM','',1),(5,3,2,'Not Collected Yet','No Description','23/07/2018 12:49:17 AM','',1);
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_assignments`
--

DROP TABLE IF EXISTS `task_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assignments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `HADITH_01` int(11) NOT NULL,
  `HADITH_02` int(11) NOT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `STATUS` varchar(512) DEFAULT NULL,
  `DATE_GENERATED` varchar(25) DEFAULT NULL,
  `LAST_MODIFIED` varchar(25) DEFAULT NULL,
  `RESPONSE_REQUIRE` int(11) DEFAULT NULL,
  `RESPONSE_COUNT_TRIGGER` int(11) DEFAULT NULL,
  `QUESTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_assignments`
--

LOCK TABLES `task_assignments` WRITE;
/*!40000 ALTER TABLE `task_assignments` DISABLE KEYS */;
INSERT INTO `task_assignments` VALUES (1,1,1,2,1,'In-Progress','22/07/2018 05:31:52 PM','22/07/2018 05:31:52 PM',12,8,'Search Similarity?'),(2,1,4,5,1,'In-Progress','23/07/2018 12:49:17 AM','23/07/2018 12:49:17 AM',12,8,'Search Similarity?');
/*!40000 ALTER TABLE `task_assignments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-05 22:12:46
