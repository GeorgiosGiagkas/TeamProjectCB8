ALTER TABLE `quizbot`.`category` 
CHANGE COLUMN `category_image` `category_image` BLOB NULL ;



INSERT INTO `quizbot`.`role` (`role_id`, `role_name`) VALUES ('1', 'Admin');
INSERT INTO `quizbot`.`role` (`role_id`, `role_name`) VALUES ('2', 'User');

INSERT INTO `quizbot`.`user` (`user_id`, `user_nickname`, `user_password`, `user_email`, `role_id`) VALUES ('1', 'admin1', 'admin1pass', 'admin1@h.com', '1');
INSERT INTO `quizbot`.`user` (`user_id`, `user_nickname`, `user_password`, `user_email`, `role_id`) VALUES ('2', 'admin2', 'admin2pass', 'admin2@h.com', '1');
INSERT INTO `quizbot`.`user` (`user_id`, `user_nickname`, `user_password`, `user_email`, `role_id`) VALUES ('3', 'user3', 'user3pass', 'user3@h.com', '2');
INSERT INTO `quizbot`.`user` (`user_id`, `user_nickname`, `user_password`, `user_email`, `role_id`) VALUES ('4', 'user4', 'user4pass', 'user4@h.com', '2');
INSERT INTO `quizbot`.`user` (`user_id`, `user_nickname`, `user_password`, `user_email`, `role_id`) VALUES ('5', 'user5', 'user5pass', 'user5@h.com', '2');

INSERT INTO `quizbot`.`category` (`category_id`, `category_name`, `category_active`) VALUES ('1', 'Category1', 1);
INSERT INTO `quizbot`.`category` (`category_id`, `category_name`, `category_active`) VALUES ('2', 'Category2', 1);
INSERT INTO `quizbot`.`category` (`category_id`, `category_name`, `category_active`) VALUES ('3', 'Category3', 0);

INSERT INTO `question` VALUES (1,'Cat1-Q1',1),(2,'Cat1-Q2',1),(3,'Cat1-Q3',1),(4,'Cat1-Q4',1),(5,'Cat1-Q5',1),(6,'Cat1-Q6',1),(7,'Cat1-Q7',1),(8,'Cat1-Q8',1),(9,'Cat1-Q9',1),(10,'Cat1-Q10',1),(11,'Cat1-Q11',1),(12,'Cat1-Q12',1),(13,'Cat1-Q13',1),(14,'Cat1-Q14',1),(15,'Cat1-Q15',1),(16,'Cat1-Q16',1),(17,'Cat1-Q17',1),(18,'Cat1-Q18',1),(19,'Cat1-Q19',1),(20,'Cat1-Q20',1),(21,'Cat2-Q1',2),(22,'Cat2-Q2',2),(23,'Cat2-Q3',2),(24,'Cat2-Q4',2),(25,'Cat2-Q5',2),(26,'Cat2-Q6',2),(27,'Cat2-Q7',2),(28,'Cat2-Q8',2),(29,'Cat2-Q9',2),(30,'Cat2-Q10',2),(31,'Cat2-Q11',2),(32,'Cat2-Q12',2),(33,'Cat2-Q13',2),(34,'Cat2-Q14',2),(35,'Cat2-Q15',2),(36,'Cat2-Q16',2),(37,'Cat2-Q17',2),(38,'Cat2-Q18',2),(39,'Cat2-Q19',2),(40,'Cat2-Q20',2),(41,'Cat3-Q1',3),(42,'Cat3-Q2',3),(43,'Cat3-Q3',3),(44,'Cat3-Q4',3),(45,'Cat3-Q5',3),(46,'Cat3-Q6',3),(47,'Cat3-Q7',3),(48,'Cat3-Q8',3),(49,'Cat3-Q9',3),(50,'Cat3-Q10',3);

