-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: ra1.anystream.eu    Database: quizbot
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` text NOT NULL,
  `answer_correct` bit(1) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (225,'Java Virtual Machine','',60),(226,'Common Language Runtime','\0',60),(227,'Common Type System','\0',60),(228,'Common Language Specification','\0',60),(229,'mscoree.dll','',61),(230,'mcoree.dll','\0',61),(231,'msoree.dll','\0',61),(232,'mscor.dll','\0',61),(233,'Simple Object Access Program','\0',62),(234,'Simple Object Access Protocol','',62),(235,'Simple Object Application Protocol','\0',62),(236,'Simple Object Account Protocol','\0',62),(237,'Function','\0',63),(238,'Metadata','\0',63),(239,'Method','',63),(240,'Managed code','\0',63),(241,'Class()','\0',64),(242,'Main()','',64),(243,'Submain()','\0',64),(244,'Namespace','\0',64),(245,'Constant','\0',65),(246,'Reference type','\0',65),(247,'Variable','',65),(248,'Object','\0',65),(249,'Bool type','\0',66),(250,'Instance type','\0',66),(251,'Class type','\0',66),(252,'Object type','',66),(253,'Center-associative','\0',67),(254,'Right-associative','\0',67),(255,'Left-associative','',67),(256,'Top-associative','\0',67),(257,'goto','\0',68),(258,'Label','',68),(259,'Logical','\0',68),(260,'Bitwise','\0',68),(261,'Square','\0',69),(262,'Triangular','\0',69),(263,'Rectangular','',69),(264,'Cube','\0',69),(265,'Input','\0',70),(266,'Reference','\0',70),(267,'Value','\0',70),(268,'Output','',70),(269,'Square','\0',71),(270,'Semicolon','\0',71),(271,'Parenthesis','',71),(272,'Colon','\0',71),(273,'System','\0',72),(274,'Global','\0',72),(275,'Local','',72),(276,'Console','\0',72),(277,'parameterized','\0',73),(278,'parameter-less','',73),(279,'Class','\0',73),(280,'Method','\0',73),(281,'Different','',74),(282,'Same','\0',74),(283,'Invoking','\0',74),(284,'Calling','\0',74),(285,'Protected','\0',75),(286,'Public','\0',75),(287,'Private','',75),(288,'Default','\0',75),(289,'Method Overloading','',76),(290,'Method Overriding','\0',76),(291,'Method Overwriting','\0',76),(292,'Method Overreading','\0',76),(293,'Loop','\0',77),(294,'Functions','\0',77),(295,'Methods','\0',77),(296,'Accessor','',77),(297,'Abstract method','',78),(298,'Instance method','\0',78),(299,'Sealed method','\0',78),(300,'Expression method','\0',78),(301,'Data hiding','\0',79),(302,'Encapsulation','',79),(303,'Information Hiding','\0',79),(304,'Polymorphism','\0',79),(305,'Commutative','\0',80),(306,'Associative','\0',80),(307,'Transitive','',80),(308,'Iterative','\0',80),(309,'Default point','\0',81),(310,'Invoking point','\0',81),(311,'Calling point','\0',81),(312,'Throw point','',81),(313,'Method','\0',82),(314,'Function','\0',82),(315,'Error','',82),(316,'Iterative','\0',82),(317,'Method collision','\0',83),(318,'Name collision','',83),(319,'Function collision','\0',83),(320,'Interface collision','\0',83),(321,'m.dddd E+xxx','',84),(322,'m.dddd','\0',84),(323,'E+xxx','\0',84),(324,'None of the above','\0',84),(325,'Web forms','\0',85),(326,'Window Forms','',85),(327,'Application Forms','\0',85),(328,'None of the above','\0',85),(365,'Taun Tauns','\0',90),(366,'Ice Creatures','\0',90),(367,'Mynocks','',90),(368,'Sarlaccs','\0',90),(369,'Latin and Aramaic','',91),(370,'Greek and Aramaic','\0',91),(371,'Latin and Hebrew','\0',91),(372,'English and Hebrew','\0',91),(373,'The Passion Of The Christ','',92),(374,'The Bourne Supremacy','\0',92),(375,'Kill Bill: Vol.2','\0',92),(376,'The Incredibles','\0',92),(377,'Val Kilmer','\0',93),(378,'Christian Bale','\0',93),(379,'George Clooney','\0',93),(380,'Micheal Keaton','',93),(381,'O Brother, Where Art Thou','',94),(382,'The Shawshank Redemption','\0',94),(383,'The Green Mile','\0',94),(384,'The Wicker Man','\0',94),(385,'Phillip','\0',95),(386,'Zeus','',95),(387,'Apollo','\0',95),(388,'Orion','\0',95),(389,'Tommy Lee Jones','\0',96),(390,'Clint Eastwood','\0',96),(391,'Robert Redford','\0',96),(392,'R. Lee Ermey','',96),(393,'Batman Begins','\0',97),(394,'X-men','\0',97),(395,'The Prestige','',97),(396,'American Psycho','\0',97),(397,'The Incredible Hulk','\0',98),(398,'The Punisher','\0',98),(399,'Sin City','',98),(400,'Daredevil','\0',98),(401,'The Last Dragon','\0',99),(402,'Enter The Dragon','\0',99),(403,'The Karate Kid','',99),(404,'Romeo Must Die','\0',99),(405,'Ghostbusters','\0',100),(406,'Monster House','\0',100),(407,'The Others','\0',100),(408,'Beetlejuice','',100),(409,'Literary Crime','\0',101),(410,'Narcotics','\0',101),(411,'Precrime','',101),(412,'Mindcrime','\0',101),(413,'Thelma and Louise','\0',102),(414,'The Untouchables','\0',102),(415,'Goodfellas','\0',102),(416,'Bonnie and Clyde','',102),(417,'Maverick','\0',103),(418,'The River','\0',103),(419,'Mad Max','\0',103),(420,'Braveheart','',103),(421,'Dances With Wolves','\0',104),(422,'Ghost','',104),(423,'Pretty Woman','\0',104),(424,'Total Recall','\0',104),(425,'She Wanted To Get Married','\0',105),(426,'She Wanted a Divorce','\0',105),(427,'She Was Pregnant','',105),(428,'She Loved Him','\0',105),(429,'Laryngitis','\0',106),(430,'A Heart Attack','\0',106),(431,'Amnesia','',106),(432,'A Broken Back','\0',106),(433,'Zodiac','',107),(434,'No Country For Old Men','\0',107),(435,'Nothing is Private','\0',107),(436,'Atonement','\0',107),(437,'She Was From Venus','\0',108),(438,'She Was Immortal','\0',108),(439,'She Was A Robot','\0',108),(440,'She Was Pregnant','',108),(441,'A DVD','\0',109),(442,'A Cassette Tape','\0',109),(443,'A Compact Disc','\0',109),(444,'A Video Tape','',109),(449,'Διαμαντένια προβλήτα','\0',111),(450,'Καράβι στον τοίχο','\0',111),(451,'Βοριάς φυσάει τα λόγια μου','\0',111),(452,'Το ποντίκι και ο αετός','',111),(453,'Take A Bow','\0',112),(454,'Big Girls Don\'t Cry','\0',112),(455,'A Thousand Years','\0',112),(456,'Just Give Me A Reason','',112),(457,'Welcome to Tijuana','',113),(458,'Just Jammin','\0',113),(459,'Sin Contrato','\0',113),(460,'Livin\' La Vida Loca','\0',113),(461,'Θα πάρω φόρα','\0',114),(462,'Το τραγούδι αυτό','\0',114),(463,'Τέρμα το διάλειμμα','',114),(464,'Παράξενη Πόλη','\0',114),(465,'Magnificent','\0',115),(466,'Galway Girl','\0',115),(467,'ParadiseCity','\0',115),(468,'Whole Lotta Rosie','',115),(469,'Δώσε μου φωτιά','',116),(470,'Ήταν νύχτα με φεγγάρι ','\0',116),(471,'Δε με πόνεσε κανείς','\0',116),(472,'Άστατος','\0',116),(473,'Βυθισμένες Άγκυρες','\0',117),(474,'Αυτό το τραγούδι δεν είναι για σένα','',117),(475,'Δεν υπάρχει επιστροφή','\0',117),(476,'Σιωπή','\0',117),(477,'Herbman Hustling','\0',118),(478,'Pimper\'s Paradise','',118),(479,'I Would Give Anything I Own','\0',118),(480,'Many Rivers To Cross','\0',118),(481,'Φωτιά','',119),(482,'Από γυναίκες δάκρυα','\0',119),(483,'Ψεύτικο φιλί','\0',119),(484,'Ένα τραγούδι ακόμα','\0',119),(485,'Genio Atrapado','',120),(486,'Bon Appétit','\0',120),(487,'Video Phone','\0',120),(488,'Me Enamoré','\0',120),(489,'Η Χιονάτη','\0',121),(490,'Je suis bossu','\0',121),(491,'Ου-α-η-α-ω','\0',121),(492,'Trendy Λίτσα','',121),(493,'Boulevard Of Broken Dreams','\0',122),(494,'The Scientist','\0',122),(495,'Crawling','\0',122),(496,'Walk On','',122),(497,'Don\'t miss','\0',123),(498,'Smooth Criminal','',123),(499,'Crime','\0',123),(500,'Stranger','\0',123),(501,'Το Καλοκαίρι Αυτό','\0',124),(502,'Θα περιμένω','\0',124),(503,'Επικίνδυνα Φιλιά','',124),(504,'Ποιον αγαπάς','\0',124),(505,'Million Years Ago','\0',125),(506,'You Know I\'m No Good','',125),(507,'Cheers darlin','\0',125),(508,'In a Bar','\0',125),(509,'JavaScript is a stripped-down version of Java','\0',126),(510,'JavaScript\'s syntax is loosely based on Java\'s','',126),(511,'They both originated on the island of Java','\0',126),(512,'None of the above','\0',126),(513,'System.out.println(\"Hello World\")','\0',127),(514,'println (\"Hello World\")','\0',127),(515,'document.write(\"Hello World\")','',127),(516,'response.write(\"Hello World\")','\0',127),(517,'Client','',128),(518,'Server','\0',128),(519,'Object','\0',128),(520,'None of the above','\0',128),(521,'2names','',129),(522,'_first_and_last_names','\0',129),(523,'FirstAndLast','\0',129),(524,'None of the above','\0',129),(525,'<script href=\" abc.js\">','\0',130),(526,'<script name=\" abc.js\">','\0',130),(527,'<script src=\" abc.js\">','',130),(528,'None of the above','\0',130),(529,'It is a modelling language','\0',131),(530,'It is a DTP language','\0',131),(531,'It is a partial programming language','\0',131),(532,'It is used to structure documents','',131),(533,'At the end of the document','\0',132),(534,'In the <head> section','',132),(535,'At the top of the document','\0',132),(536,'In the <body> section','\0',132),(537,'body {color: black}','',133),(538,'{body;color:black}','\0',133),(539,'{body:color=black(body}','\0',133),(540,'body:color=black','\0',133),(541,'a {text-decoration:no underline}','\0',134),(542,'a {decoration:no underline}','\0',134),(543,'a {text-decoration:none}','',134),(544,'a {underline:none}','\0',134),(545,'list-type: square','\0',135),(546,'type: square','\0',135),(547,'type: 2','\0',135),(548,'list-style-type: square','',135),(549,'low level programming language','',136),(550,'middle level programming language','\0',136),(551,'high level programming language','\0',136),(552,'internet based programming language','\0',136),(553,'java.lang.Class','\0',137),(554,'java.util.Name','\0',137),(555,'java.lang.Object','',137),(556,'java.awt.Window','\0',137),(557,'executeQuery()','\0',138),(558,'executeDeleteQuery()','\0',138),(559,'executeUpdate()','',138),(560,'executeDelete()','\0',138),(561,'No error','\0',139),(562,'Compilation error','\0',139),(563,'The program won’t run','',139),(564,'Program exit','\0',139),(565,'encapsulation','\0',140),(566,'class','\0',140),(567,'inheritance','\0',140),(568,'polymorphism','',140);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar` (
  `avatar_id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar_name` varchar(20) NOT NULL,
  `avatar_cost` int(11) NOT NULL,
  `avatar_image` blob,
  PRIMARY KEY (`avatar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (1,'Mr Cat',0,NULL),(2,'Spider-man',4500,NULL),(3,'Crazy Ork',2800,NULL),(4,'Bugs Bunny',1500,NULL),(5,'Evil Monk',2000,NULL),(6,'Dark Wolf',1800,NULL),(7,'Sirenia',3500,NULL),(8,'Ninja',1700,NULL),(9,'Emo Boy',1000,NULL),(10,'Terminatrix',2500,NULL),(11,'Blondie',1100,NULL),(12,'Chemical Trooper',1500,NULL),(13,'Anonymous',3000,NULL),(14,'Looney Squirrel',1400,NULL),(15,'Little Genius',1800,NULL),(16,'Dark Actor',1700,NULL),(17,'Tom Cruise',9990,NULL),(18,'Gotcha Girl',1300,NULL),(19,'Dragon Baller',1500,NULL),(20,'Cursed Wolf',2100,NULL),(21,'The Elf',1300,NULL),(22,'Yoda',6000,NULL),(23,'Brunette',4500,NULL),(24,'Eddie from Hell',3800,NULL),(25,'The Witcher',4000,NULL);
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `category_image` blob,
  `category_active` bit(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'c#',NULL,'\0'),(26,'Movies',NULL,''),(27,'Music',NULL,''),(28,'Coding',NULL,'');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` text NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (60,'CLR is the .NET equivalent of _________.',28),(61,'The CLR is physically represented by an assembly named _______.',6),(62,'SOAP stands for __________.',6),(63,'In C#, a subroutine is called a ________.',28),(64,'All C# applications begin execution by calling the _____ method.',28),(65,'A _______ is an identifier that denotes a storage location.',6),(66,'Boxing converts a value type on the stack to an ______ on the heap.',6),(67,'In C#, all binary operators are ______.',6),(68,'A _____ is any valid C# variable ending with a colon.',6),(69,'Multidimensional arrays are sometimes called _______ Arrays.',6),(70,'______ parameters are used to pass results back to the calling method.',6),(71,'The formal-parameter-list is always enclosed in _______.',6),(72,'_______ variables are visible only in the block they are declared.',6),(73,'C# does not support _____ constructors.',28),(74,'A structure in C# provides a unique way of packing together data of ______ types.',6),(75,'Struct’s data members are ____________ by default.',6),(76,'The methods that have the same name, but different parameter lists and different definitions is called______.',6),(77,'The C# provides special methods known as _____ methods to provide access to data members.',6),(78,'When an instance method declaration includes the abstract modifier, the method is said to be an ______.',6),(79,'The theory of _____ implies that user can control the access to a class, method, or variable.',6),(80,'Inheritance is ______ in nature.',6),(81,'The point at which an exception is thrown is called the _______.',6),(82,'In C#, having unreachable code is always an _____.',6),(83,'The reason that C# does not support multiple inheritances is because of ______.',28),(84,'Exponential formatting character (‘E’ or ‘e’) converts a given value to string in the form of _______.',6),(85,'The ______ are the Graphical User Interface (GUI) components created for web based interactions.',6),(90,'In the \"Star Wars\" movies, what animals feed off the Millennium Falcon\'s power supply?',26),(91,'What are the two principal languages spoken in \"The Passion of the Christ\"?',26),(92,'Which 2004 film set a record for number of advance tickets sold?',26),(93,'Which actor played Bruce Wayne in the 1989 Tim Burton film \"Batman\"?',26),(94,'In which of these films would you find \"The Man of Constant Sorrow\"?',26),(95,'In \"Alexander\", who did Olympias believe was her son\'s father?',26),(96,'Which real-life drill sergeant played Sgt. Hartman in \"Full Metal Jacket\"?',26),(97,'Magician Ricky Jay coached Christian Bale and Hugh Jackman for their roles in what 2006 film?',26),(98,'What 2005 Robert Rodriguez film was based on graphic novels by Frank Miller?',26),(99,'In what film would you find students learning at the Cobra Kai dojo?',26),(100,'Which Tim Burton film did the studio want to name \"House Ghosts\"?',26),(101,'In what department did Detective John Anderton work in 2002\'s \"Minority Report\"?',26),(102,'Faye Dunaway and Warren Beatty played the lead characters in what 1967 gangster film?',26),(103,'Which 1995 historical drama featured the legendary Scottish Battle of Stirling?',26),(104,'The tagline of what 1990 film was \"A love that will last forever\"?',26),(105,'In \"Knocked Up\", what did Alison tell Ben eight weeks after their first meeting?',26),(106,'From what was Jason Bourne suffering at the start of 2002\'s \"The Bourne Identity\"?',26),(107,'What 2007 true-crime film was based on a book by Robert Graysmith?',26),(108,'In \"Children of Men\", what was special about Kee?',26),(109,'What type of audiovisual object is at the center of Rachel\'s investigation in \"The Ring\"?',26),(111,'Ποιο από τα παρακάτω, είναι τραγούδι του Βασίλη Παπακωνσταντίνου.',27),(112,'Ποιο από τα παρακάτω, είναι τραγούδι της Pink;',27),(113,'Ποιο από τα παρακάτω τραγούδια, ανήκει στον Manu Chao;',27),(114,'Ποιο από τα παρακάτω, είναι τραγούδι των Magic De Spell;',27),(115,'Ποιο από τα παρακάτω, είναι τραγούδι των AC/DC;',27),(116,'Ποιο από τα παρακάτω είναι τραγούδια το Δημήτρη Μητροπάνου;',27),(117,' Ένα από τα παρακάτω τραγούδια, έγινε γνωστό από τα Διάφανα Κρίνα. Ποιο είναι αυτό;',27),(118,'Από τα παρακάτω, ποιο είναι τραγούδι των Bob Marley and the Wailers.',27),(119,'Μόνο ένα από τα παρακάτω, ανήκει στους Πυξ Λαξ. Αυτό είναι το:',27),(120,'Ποιο από τα παρακάτω, είναι τραγούδι, της Christina Aguilera;',27),(121,'Μόνο ένα από τα παρακάτω, ανήκει στους Locomondo. Αυτό είναι το:',27),(122,'Ποιο από αυτά, είναι τραγούδι των U2;',27),(123,'Ποιο από τα τέσσερα, είναι τραγούδι του Michael Jackson;',27),(124,'Ποιο από τα παρακάτω τραγούδια, ανήκει στο συγκρότημα \"MELISSES\";',27),(125,'H Amy Winehouse, έχει τραγουδήσει το:',27),(126,'Why so JavaScript and Java have similar name?',28),(127,'What is the correct JavaScript syntax to write \"Hello World\"?',28),(128,'JavaScript is interpreted by _________',28),(129,'Which of the following is not a valid JavaScript variable name?',28),(130,'What is the correct syntax for referring to an external script called \" abc.js\"?',28),(131,'Which of the following options is correct with regard to HTML?',28),(132,'Where in an HTML document is the correct place to refer to an external style sheet?',28),(133,'Which is the correct CSS syntax?',28),(134,'How do you display hyperlinks without an underline?',28),(135,'How do you make a list that lists its items with squares?',28),(136,'An assembly language is a...',28),(137,'All Java classes are derived from...',28),(138,'For the execution of DELETE SQL query in JDBC, …………. method must be used.',28),(139,'What would happen if “String[]args” is not included as an argument in the main method?',28),(140,'Method overloading is one of the ways that Java supports...',28);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nickname` varchar(15) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `role_id` int(11) NOT NULL,
  `selected_avatar_id` int(11) NOT NULL,
  `wallet` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_nickname` (`user_nickname`),
  KEY `role_id` (`role_id`),
  KEY `user_ibfk_2_idx` (`selected_avatar_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`selected_avatar_id`) REFERENCES `avatar` (`avatar_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'user7','$2a$10$TaH3a0Y9PcnvCbgtL4jynOf.MJxSEQzEMPmO1bwlldTCXn1BUwWFm','usr7@h.com',2,1,0),(14,'DragonFlame14','$2a$10$bfQ18BUTLCMAyghvjceYu.h5Iw1XGyniTiwq3u/6XiugEIGDB3bW2','user14@h.com',2,23,9970),(15,'BarbieDoll15','$2a$10$jESels6JUXg/tKfERlAeu.FZa8yF6LZ0B8uhkbJ9xXv4fIQFtHBxm','user15@h.com',2,4,3490),(16,'Paokaki16','$2a$10$pS1HTxHXE0oDy0X0jDwzF.Vz7wZue2H0keIMA58KhdFrsJwC/lOsu','user16@h.com',2,1,0),(17,'user17','$2a$10$ODHnwuRr7HUrG8v/jc0kFeRq7Er.BSV25TsaYp52daqKRDLkSIEMu','user17@h.com',2,1,0),(18,'admin3','$2a$10$DPaGis2PBnjOwK8MCo2OHeftQmYqg6ogEFWoMIY6NOWw00wgmw9i2','admin3@h.com',1,2,0),(19,'Akuma1','$2a$10$k2uFwk.1FV4npBAXwlyGV.VnkY0WreK5LdEU.p4ueCko9z0.D5VAm','akuma1@sf.com',2,4,19430),(20,'Scorpion1','$2a$10$gWX6kAPw4V.Lt0RSX81FC.3HUmnUqOscNaM/IfOsMJPcwGuMQtFCK','scorpion1@mk.com',2,1,0),(21,'termi21','$2a$10$7Zfg/F06zQF/v1aATUUExe6UPzDu8YnINyCtZgj5Ajjf3NoysFxFm','termin@hotmail.com',2,1,28890),(22,'doctor44','$2a$10$0l0dqdEAXFI3ZN6GCfLZ9OpXMmLRbE6greBdHULFYVXq7xrAobp3q','andreas.tzeva@gmail.com',2,25,17390),(23,'georgia11','$2a$10$vVCNtuelF0TMYu3gOyUe5eKlyNTzITOny7HChHHhLkRXgjPsqRBLK','geo@gmail.com',2,17,7530),(24,'georgio11','$2a$10$.X5Tn6sk8pjdpGDWmn/CseeQ/fOxAAHc3BEgwqPSam44t9YsgTQYm','georgio@gmail.com',2,1,3860),(25,'newadmin1','$2a$10$8IxoNSPRCuuMEbYiexjm2ulxbFyQ6DE/h1kzVU39iSlq4t.2CENpy','newadmin1@gmail.com',2,1,0),(26,'lefter1s','$2a$10$1lXJbA/VV7vnHj6Wb6VqG.EZ8UHhEdt4m.olQQHSxrcEEjbrvKVZq','asd@gmial.com',2,1,0),(27,'johndoe1','$2a$10$Kjsfml.oiF4AqDMrH/TF3OFhD2DLesx.zYyYVQMANC9mcBp8V9HS2','myemail@gmail.com',2,4,90);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_avatar`
--

DROP TABLE IF EXISTS `user_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_avatar` (
  `user_avatar_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `avatar_id` int(11) NOT NULL,
  PRIMARY KEY (`user_avatar_id`),
  KEY `user_id` (`user_id`),
  KEY `avatar_id` (`avatar_id`),
  CONSTRAINT `user_avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_avatar_ibfk_2` FOREIGN KEY (`avatar_id`) REFERENCES `avatar` (`avatar_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_avatar`
--

LOCK TABLES `user_avatar` WRITE;
/*!40000 ALTER TABLE `user_avatar` DISABLE KEYS */;
INSERT INTO `user_avatar` VALUES (28,19,8),(29,19,16),(30,19,4),(31,19,3),(32,19,3),(33,19,2),(34,19,2),(35,19,2),(36,19,1),(37,19,1),(38,19,1),(39,19,1),(40,15,1),(41,15,4),(42,15,4),(43,15,15),(44,15,3),(45,15,6),(46,15,2),(215,21,22),(216,21,23),(217,21,24),(218,21,25),(219,21,14),(220,21,18),(221,21,19),(222,21,20),(223,21,17),(224,21,2),(225,14,24),(226,14,25),(227,14,23),(228,14,22),(229,14,21),(230,19,9),(231,15,22),(232,22,25),(233,23,17),(234,21,4),(235,22,9),(236,22,3),(237,22,14),(238,22,11),(239,22,15),(240,22,19),(241,19,14),(242,15,9),(243,27,9),(244,27,8),(245,27,6),(246,27,11),(247,27,14),(248,27,1),(249,27,19),(250,27,4);
/*!40000 ALTER TABLE `user_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_highscore`
--

DROP TABLE IF EXISTS `user_highscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_highscore` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `highscore` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `user_highscore_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_highscore_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_highscore`
--

LOCK TABLES `user_highscore` WRITE;
/*!40000 ALTER TABLE `user_highscore` DISABLE KEYS */;
INSERT INTO `user_highscore` VALUES (14,26,3280),(14,27,2290),(14,28,2100),(15,26,0),(15,27,1540),(15,28,1220),(16,28,0),(19,26,560),(19,27,3190),(19,28,2880),(21,26,1440),(22,26,6660),(22,27,2970),(22,28,6490),(23,28,9230),(24,27,3860),(24,28,1360),(26,26,0),(27,26,7090),(27,27,400),(27,28,0);
/*!40000 ALTER TABLE `user_highscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_question`
--

DROP TABLE IF EXISTS `user_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_question` (
  `user_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_question_success` bit(1) NOT NULL,
  `user_question_timespamp` timestamp NOT NULL,
  PRIMARY KEY (`user_question_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `user_question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_question`
--

LOCK TABLES `user_question` WRITE;
/*!40000 ALTER TABLE `user_question` DISABLE KEYS */;
INSERT INTO `user_question` VALUES (486,19,64,'','2019-10-30 10:31:48'),(510,19,64,'\0','2019-10-30 11:47:40'),(513,19,64,'','2019-10-30 11:49:36'),(549,19,64,'','2019-11-09 13:55:50'),(574,19,64,'\0','2019-11-10 10:00:36'),(612,19,64,'\0','2019-11-23 09:13:50'),(625,19,64,'','2019-11-23 09:26:51'),(641,15,64,'','2019-11-23 10:53:18'),(678,19,64,'','2019-11-23 12:08:55'),(695,14,64,'','2019-11-23 14:07:35'),(720,19,64,'','2019-11-23 14:50:37'),(735,19,64,'\0','2019-11-23 15:00:32'),(759,19,64,'','2019-11-23 15:54:42'),(788,19,64,'\0','2019-11-23 20:04:50'),(800,19,64,'\0','2019-11-24 13:39:59'),(814,19,64,'','2019-11-24 15:10:29'),(869,15,64,'\0','2019-11-25 17:10:50'),(907,14,90,'','2019-11-26 08:32:47'),(908,14,92,'','2019-11-26 08:33:16'),(909,14,93,'\0','2019-11-26 08:33:42'),(910,14,98,'','2019-11-26 08:34:01'),(912,19,113,'\0','2019-11-26 10:38:18'),(913,19,114,'','2019-11-26 10:38:41'),(914,19,116,'','2019-11-26 10:39:09'),(915,19,117,'\0','2019-11-26 10:39:46'),(916,19,118,'','2019-11-26 10:40:09'),(917,19,119,'\0','2019-11-26 10:40:40'),(918,19,121,'\0','2019-11-26 10:41:01'),(919,19,123,'\0','2019-11-26 10:41:17'),(920,19,125,'\0','2019-11-26 10:41:39'),(921,21,90,'\0','2019-11-26 11:40:44'),(922,21,91,'\0','2019-11-26 11:41:20'),(923,21,93,'\0','2019-11-26 11:50:11'),(924,21,91,'\0','2019-11-26 11:54:48'),(925,19,90,'\0','2019-11-26 11:56:07'),(926,19,92,'\0','2019-11-26 11:56:44'),(927,19,93,'\0','2019-11-26 11:57:00'),(928,21,93,'\0','2019-11-26 11:57:11'),(929,19,94,'','2019-11-26 11:57:15'),(930,21,94,'\0','2019-11-26 11:57:47'),(931,21,99,'\0','2019-11-26 11:58:12'),(932,21,101,'\0','2019-11-26 11:58:30'),(933,21,102,'\0','2019-11-26 11:58:48'),(934,21,104,'\0','2019-11-26 11:59:13'),(935,21,105,'\0','2019-11-26 12:00:04'),(936,21,106,'\0','2019-11-26 12:00:54'),(937,21,107,'\0','2019-11-26 12:02:06'),(938,21,91,'\0','2019-11-26 12:13:24'),(939,21,92,'\0','2019-11-26 12:13:40'),(940,21,94,'\0','2019-11-26 12:14:16'),(941,21,95,'\0','2019-11-26 12:14:52'),(942,21,98,'\0','2019-11-26 12:15:28'),(943,21,102,'','2019-11-26 12:15:47'),(944,21,103,'\0','2019-11-26 12:16:26'),(945,21,104,'\0','2019-11-26 12:17:09'),(946,21,106,'\0','2019-11-26 12:18:05'),(947,21,109,'\0','2019-11-26 12:19:12'),(948,15,63,'','2019-11-26 15:04:58'),(949,15,64,'\0','2019-11-26 15:05:36'),(950,15,126,'','2019-11-26 15:06:10'),(951,15,63,'\0','2019-11-26 15:11:08'),(952,15,64,'','2019-11-26 15:12:00'),(954,19,111,'\0','2019-11-26 15:18:04'),(955,19,112,'','2019-11-26 15:18:22'),(956,19,114,'\0','2019-11-26 15:18:45'),(957,19,116,'','2019-11-26 15:19:04'),(958,19,117,'\0','2019-11-26 15:19:26'),(959,19,120,'','2019-11-26 15:19:51'),(960,19,122,'','2019-11-26 15:20:17'),(961,19,124,'\0','2019-11-26 15:20:43'),(962,19,125,'','2019-11-26 15:21:05'),(963,19,60,'\0','2019-11-26 15:24:10'),(964,19,63,'\0','2019-11-26 15:24:30'),(965,19,73,'\0','2019-11-26 15:24:54'),(966,19,126,'\0','2019-11-26 15:25:27'),(967,19,128,'\0','2019-11-26 15:26:03'),(968,21,90,'\0','2019-11-26 16:34:33'),(969,21,92,'\0','2019-11-26 16:35:31'),(970,21,93,'\0','2019-11-26 16:36:07'),(971,21,98,'\0','2019-11-26 16:36:44'),(972,21,99,'\0','2019-11-26 16:37:20'),(973,21,102,'\0','2019-11-26 16:37:57'),(974,21,104,'\0','2019-11-26 16:38:34'),(975,21,107,'\0','2019-11-26 16:39:10'),(976,21,108,'\0','2019-11-26 16:39:47'),(977,21,109,'\0','2019-11-26 16:40:24'),(979,19,112,'\0','2019-11-26 17:09:33'),(980,19,115,'\0','2019-11-26 17:09:54'),(981,19,116,'','2019-11-26 17:10:14'),(982,19,60,'','2019-11-26 21:07:18'),(983,19,73,'','2019-11-26 21:07:49'),(984,19,126,'\0','2019-11-26 21:08:08'),(985,19,127,'','2019-11-26 21:08:35'),(986,19,130,'\0','2019-11-26 21:09:12'),(987,19,63,'\0','2019-11-26 21:10:10'),(988,19,73,'','2019-11-26 21:10:28'),(989,19,126,'\0','2019-11-26 21:10:46'),(990,19,127,'\0','2019-11-26 21:11:02'),(991,19,130,'\0','2019-11-26 21:11:37'),(992,19,131,'\0','2019-11-26 21:12:13'),(993,19,64,'\0','2019-11-26 21:15:00'),(994,19,83,'\0','2019-11-26 21:15:30'),(995,19,131,'\0','2019-11-26 21:16:06'),(996,19,132,'\0','2019-11-26 21:16:42'),(997,19,134,'\0','2019-11-26 21:17:17'),(998,19,60,'\0','2019-11-26 22:01:00'),(999,19,63,'\0','2019-11-26 22:01:19'),(1000,19,64,'\0','2019-11-26 22:01:37'),(1001,19,83,'','2019-11-26 22:01:54'),(1002,19,128,'','2019-11-26 22:02:14'),(1003,19,132,'\0','2019-11-26 22:02:43'),(1004,19,133,'','2019-11-26 22:03:12'),(1005,19,134,'\0','2019-11-26 22:03:42'),(1006,19,138,'\0','2019-11-26 22:04:07'),(1007,19,140,'','2019-11-26 22:04:36'),(1008,14,90,'\0','2019-11-27 12:49:16'),(1009,14,91,'','2019-11-27 12:49:40'),(1010,14,93,'\0','2019-11-27 12:50:07'),(1011,14,94,'','2019-11-27 12:50:35'),(1012,14,96,'','2019-11-27 12:51:01'),(1013,14,98,'','2019-11-27 12:51:21'),(1014,14,99,'','2019-11-27 12:51:43'),(1015,14,102,'\0','2019-11-27 12:52:10'),(1016,14,106,'','2019-11-27 12:52:33'),(1017,14,107,'','2019-11-27 12:53:01'),(1019,14,112,'\0','2019-11-27 12:57:06'),(1020,14,117,'','2019-11-27 12:57:35'),(1021,14,118,'\0','2019-11-27 12:58:00'),(1022,14,119,'\0','2019-11-27 12:58:30'),(1023,14,120,'\0','2019-11-27 12:58:52'),(1024,14,122,'\0','2019-11-27 12:59:30'),(1025,14,123,'','2019-11-27 12:59:48'),(1026,14,124,'\0','2019-11-27 13:00:14'),(1027,14,125,'','2019-11-27 13:00:40'),(1028,14,60,'\0','2019-11-27 13:01:36'),(1029,14,63,'\0','2019-11-27 13:02:00'),(1030,14,73,'','2019-11-27 13:02:26'),(1031,14,83,'\0','2019-11-27 13:03:00'),(1032,14,128,'','2019-11-27 13:03:21'),(1033,14,130,'','2019-11-27 13:03:49'),(1034,14,131,'\0','2019-11-27 13:04:19'),(1035,14,134,'','2019-11-27 13:04:44'),(1036,14,137,'\0','2019-11-27 13:05:13'),(1037,14,139,'','2019-11-27 13:05:47'),(1038,14,90,'\0','2019-11-27 13:13:21'),(1039,22,91,'','2019-11-27 14:28:11'),(1040,22,92,'','2019-11-27 14:28:31'),(1041,22,95,'','2019-11-27 14:28:52'),(1042,22,97,'','2019-11-27 14:29:12'),(1043,22,111,'\0','2019-11-27 14:35:10'),(1044,22,112,'\0','2019-11-27 14:35:30'),(1045,22,114,'\0','2019-11-27 14:35:49'),(1046,22,116,'','2019-11-27 14:36:11'),(1047,22,117,'','2019-11-27 14:36:38'),(1048,22,118,'','2019-11-27 14:37:04'),(1049,22,119,'\0','2019-11-27 14:37:28'),(1050,22,121,'\0','2019-11-27 14:37:49'),(1051,22,124,'\0','2019-11-27 14:38:07'),(1052,22,125,'','2019-11-27 14:38:27'),(1053,22,60,'\0','2019-11-27 14:39:20'),(1054,22,73,'','2019-11-27 14:39:48'),(1055,22,83,'\0','2019-11-27 14:40:18'),(1056,22,127,'','2019-11-27 14:40:41'),(1057,22,128,'','2019-11-27 14:41:02'),(1058,22,130,'','2019-11-27 14:41:29'),(1059,22,131,'','2019-11-27 14:42:04'),(1060,19,93,'\0','2019-11-27 16:52:53'),(1062,15,111,'\0','2019-11-27 18:04:01'),(1063,15,112,'\0','2019-11-27 18:04:26'),(1064,15,113,'\0','2019-11-27 18:05:04'),(1065,15,114,'\0','2019-11-27 18:05:43'),(1066,15,116,'','2019-11-27 18:06:10'),(1067,15,118,'','2019-11-27 18:06:36'),(1068,15,91,'\0','2019-11-27 18:08:11'),(1069,23,60,'\0','2019-11-27 18:20:33'),(1070,23,64,'','2019-11-27 18:20:51'),(1071,23,83,'','2019-11-27 18:21:11'),(1072,23,126,'','2019-11-27 18:21:30'),(1073,23,127,'\0','2019-11-27 18:21:49'),(1074,23,128,'','2019-11-27 18:22:07'),(1075,23,130,'','2019-11-27 18:22:26'),(1076,23,131,'','2019-11-27 18:22:46'),(1077,23,138,'','2019-11-27 18:23:05'),(1078,23,139,'','2019-11-27 18:23:23'),(1079,22,90,'\0','2019-11-27 18:29:02'),(1080,22,91,'\0','2019-11-27 18:29:34'),(1081,22,92,'','2019-11-27 18:30:04'),(1082,22,93,'','2019-11-27 18:30:22'),(1083,22,94,'','2019-11-27 18:30:54'),(1084,22,97,'','2019-11-27 18:31:16'),(1085,22,99,'','2019-11-27 18:31:39'),(1086,22,100,'\0','2019-11-27 18:32:07'),(1087,22,101,'','2019-11-27 18:32:29'),(1088,22,106,'','2019-11-27 18:32:50'),(1089,22,60,'','2019-11-27 18:34:05'),(1090,22,64,'','2019-11-27 18:34:30'),(1091,22,83,'\0','2019-11-27 18:35:00'),(1092,22,127,'\0','2019-11-27 18:35:22'),(1093,22,128,'\0','2019-11-27 18:35:47'),(1094,22,131,'\0','2019-11-27 18:36:11'),(1095,22,132,'','2019-11-27 18:36:46'),(1096,22,138,'\0','2019-11-27 18:37:19'),(1097,22,139,'\0','2019-11-27 18:37:49'),(1098,22,140,'\0','2019-11-27 18:38:23'),(1100,22,112,'\0','2019-11-27 18:39:31'),(1101,22,113,'','2019-11-27 18:39:54'),(1102,22,114,'\0','2019-11-27 18:40:27'),(1103,22,115,'\0','2019-11-27 18:40:50'),(1104,22,118,'\0','2019-11-27 18:41:14'),(1105,22,121,'','2019-11-27 18:41:37'),(1106,22,122,'\0','2019-11-27 18:42:06'),(1107,22,123,'','2019-11-27 18:42:25'),(1108,22,125,'','2019-11-27 18:42:47'),(1109,24,60,'','2019-11-27 19:19:42'),(1110,24,111,'\0','2019-11-27 19:22:53'),(1111,24,112,'','2019-11-27 19:23:12'),(1112,24,113,'','2019-11-27 19:23:30'),(1113,24,114,'\0','2019-11-27 19:23:47'),(1114,24,115,'','2019-11-27 19:24:03'),(1115,24,120,'\0','2019-11-27 19:24:20'),(1116,24,121,'','2019-11-27 19:24:36'),(1117,24,123,'\0','2019-11-27 19:24:54'),(1118,24,124,'\0','2019-11-27 19:25:10'),(1119,24,125,'\0','2019-11-27 19:25:26'),(1120,21,90,'\0','2019-11-27 21:03:28'),(1121,21,91,'\0','2019-11-27 21:03:50'),(1122,21,92,'\0','2019-11-27 21:04:29'),(1123,21,93,'\0','2019-11-27 21:05:09'),(1124,21,96,'\0','2019-11-27 21:05:45'),(1125,21,101,'\0','2019-11-27 21:06:23'),(1126,21,103,'\0','2019-11-27 21:06:48'),(1127,21,106,'\0','2019-11-27 21:07:27'),(1128,21,108,'','2019-11-27 21:07:49'),(1129,21,109,'','2019-11-27 21:08:15'),(1130,22,91,'\0','2019-11-28 08:38:15'),(1131,22,92,'\0','2019-11-28 08:38:42'),(1132,22,93,'\0','2019-11-28 08:39:12'),(1133,22,94,'\0','2019-11-28 08:39:43'),(1134,22,98,'\0','2019-11-28 08:40:07'),(1135,22,99,'','2019-11-28 08:40:29'),(1136,22,100,'\0','2019-11-28 08:40:50'),(1137,22,102,'\0','2019-11-28 08:41:12'),(1138,22,106,'','2019-11-28 08:41:33'),(1139,22,107,'','2019-11-28 08:41:58'),(1140,19,64,'\0','2019-11-28 08:57:42'),(1141,15,111,'','2019-11-28 11:14:03'),(1142,14,111,'','2019-11-28 11:18:01'),(1144,14,90,'\0','2019-11-28 11:27:52'),(1145,14,92,'\0','2019-11-28 11:28:28'),(1146,15,63,'\0','2019-11-28 11:32:34'),(1147,15,83,'\0','2019-11-28 11:33:11'),(1148,15,127,'\0','2019-11-28 11:33:46'),(1149,15,128,'\0','2019-11-28 11:34:10'),(1150,15,130,'\0','2019-11-28 11:34:43'),(1151,15,131,'','2019-11-28 11:35:18'),(1152,15,133,'','2019-11-28 11:35:43'),(1153,15,136,'\0','2019-11-28 11:36:19'),(1154,15,138,'','2019-11-28 11:36:52'),(1155,15,140,'','2019-11-28 11:37:18'),(1156,19,91,'\0','2019-11-28 11:45:05'),(1157,19,92,'\0','2019-11-28 11:45:41'),(1158,19,90,'\0','2019-11-28 11:48:14'),(1159,19,91,'\0','2019-11-28 11:48:37'),(1160,19,94,'','2019-11-28 11:48:54'),(1161,19,63,'\0','2019-11-28 11:54:07'),(1162,19,64,'','2019-11-28 11:54:28'),(1163,19,83,'','2019-11-28 11:54:47'),(1164,19,127,'','2019-11-28 11:55:06'),(1165,19,128,'','2019-11-28 11:55:22'),(1166,19,129,'','2019-11-28 11:55:43'),(1167,19,133,'','2019-11-28 11:56:02'),(1168,19,134,'','2019-11-28 11:56:24'),(1169,19,137,'\0','2019-11-28 11:56:42'),(1170,19,138,'\0','2019-11-28 11:56:58'),(1171,22,60,'','2019-11-28 12:37:52'),(1172,22,64,'','2019-11-28 12:38:17'),(1173,22,73,'','2019-11-28 12:38:35'),(1174,22,83,'','2019-11-28 12:38:52'),(1175,22,126,'','2019-11-28 12:39:24'),(1176,22,128,'','2019-11-28 12:39:42'),(1177,22,130,'','2019-11-28 12:40:05'),(1178,22,136,'','2019-11-28 12:40:28'),(1179,22,139,'','2019-11-28 12:40:48'),(1180,22,140,'','2019-11-28 12:41:15'),(1181,22,60,'','2019-11-28 12:42:11'),(1182,22,63,'','2019-11-28 12:42:33'),(1183,22,73,'','2019-11-28 12:42:50'),(1184,22,127,'','2019-11-28 12:43:10'),(1185,22,129,'','2019-11-28 12:43:36'),(1186,19,90,'','2019-11-28 14:09:21'),(1187,19,92,'\0','2019-11-28 14:09:40'),(1188,19,93,'\0','2019-11-28 14:10:15'),(1189,22,73,'','2019-11-28 14:39:03'),(1190,22,91,'\0','2019-11-28 15:07:56'),(1191,22,93,'\0','2019-11-28 15:08:32'),(1192,22,90,'','2019-11-28 15:27:39'),(1193,22,91,'','2019-11-28 15:27:55'),(1194,22,94,'','2019-11-28 15:28:13'),(1195,22,97,'','2019-11-28 15:28:29'),(1196,22,98,'','2019-11-28 15:28:45'),(1197,22,99,'','2019-11-28 15:29:02'),(1198,22,100,'','2019-11-28 15:29:23'),(1199,22,103,'\0','2019-11-28 15:29:46'),(1200,22,105,'','2019-11-28 15:30:02'),(1201,22,108,'','2019-11-28 15:30:21'),(1202,15,73,'\0','2019-11-28 15:58:28'),(1203,15,126,'\0','2019-11-28 15:59:04'),(1204,15,127,'\0','2019-11-28 15:59:40'),(1205,15,128,'','2019-11-28 16:00:06'),(1206,15,130,'\0','2019-11-28 16:00:42'),(1207,15,133,'\0','2019-11-28 16:01:18'),(1208,15,134,'\0','2019-11-28 16:01:53'),(1209,15,135,'','2019-11-28 16:02:29'),(1210,15,137,'\0','2019-11-28 16:03:05'),(1211,15,139,'\0','2019-11-28 16:03:41'),(1212,22,90,'','2019-11-28 17:12:56'),(1213,26,90,'\0','2019-11-28 17:18:26'),(1214,26,91,'\0','2019-11-28 17:19:02'),(1215,27,93,'','2019-11-28 18:19:16'),(1216,27,95,'','2019-11-28 18:19:33'),(1217,27,97,'','2019-11-28 18:19:51'),(1218,27,98,'','2019-11-28 18:20:08'),(1219,27,101,'','2019-11-28 18:20:26'),(1220,27,102,'','2019-11-28 18:20:45'),(1221,27,103,'','2019-11-28 18:21:12'),(1222,27,90,'','2019-11-28 18:21:45'),(1223,27,91,'','2019-11-28 18:22:02'),(1224,27,94,'','2019-11-28 18:22:18'),(1225,27,97,'','2019-11-28 18:22:34'),(1226,27,98,'','2019-11-28 18:22:50'),(1227,27,99,'','2019-11-28 18:23:07'),(1228,27,103,'','2019-11-28 18:23:24'),(1229,27,105,'','2019-11-28 18:23:40'),(1230,27,107,'','2019-11-28 18:23:58'),(1231,27,109,'','2019-11-28 18:24:18'),(1233,27,112,'','2019-11-28 18:34:00');
/*!40000 ALTER TABLE `user_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28 21:01:24
