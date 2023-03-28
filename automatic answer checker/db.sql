/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - answer checker
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`answer checker` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `answer checker`;

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_id` int(20) NOT NULL AUTO_INCREMENT,
  `dep_id` int(20) NOT NULL,
  `courses` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `courses` */

insert  into `courses`(`course_id`,`dep_id`,`courses`) values 
(2,2,'CS'),
(3,0,'1'),
(4,1,'led');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dep_id` int(20) NOT NULL AUTO_INCREMENT,
  `department name` varchar(20) NOT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `department` */

insert  into `department`(`dep_id`,`department name`) values 
(1,'maths'),
(2,'computer science');

/*Table structure for table `exam shedule` */

DROP TABLE IF EXISTS `exam shedule`;

CREATE TABLE `exam shedule` (
  `schedule_id` int(20) NOT NULL AUTO_INCREMENT,
  `exam_id` int(20) NOT NULL,
  `exam time` time DEFAULT NULL,
  `exam date` date DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `exam shedule` */

insert  into `exam shedule`(`schedule_id`,`exam_id`,`exam time`,`exam date`) values 
(2,1,'00:20:23','0000-00-00'),
(3,1,'00:00:00','0000-00-00'),
(4,1,'00:00:00','0000-00-00'),
(5,1,'00:00:00','0000-00-00');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`type`) values 
(1,'Admin','admin123','admin'),
(3,'Student','student11','student'),
(4,'nusreen','nus12','staff details'),
(5,'nusreen','nus12','staff details'),
(6,'nusreen','nus12','staff details'),
(7,'nusreen','nus12','staff details'),
(8,'nusreen','nus12','staff details'),
(9,'nusreen','nus12','staff details'),
(10,'nusreen','nus12','staff details'),
(11,'nusreen','nus12','staff details'),
(13,'nusreen','nus12','staff details'),
(14,'nusreen','nus12','staff details'),
(16,'sanib','jaan','staff details'),
(17,'niala','sherin','staff details');

/*Table structure for table `manage exam` */

DROP TABLE IF EXISTS `manage exam`;

CREATE TABLE `manage exam` (
  `exam_id` int(20) NOT NULL AUTO_INCREMENT,
  `sub_id` int(20) NOT NULL,
  `details` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `exam name` varchar(30) NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `manage exam` */

insert  into `manage exam`(`exam_id`,`sub_id`,`details`,`date`,`time`,`exam name`) values 
(1,1,'','2023-03-07','06:00:00','first internel');

/*Table structure for table `mange question answer` */

DROP TABLE IF EXISTS `mange question answer`;

CREATE TABLE `mange question answer` (
  `man_id` int(20) NOT NULL AUTO_INCREMENT,
  `exam_id` int(20) NOT NULL,
  `staff_id` int(20) NOT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `mark` int(20) DEFAULT NULL,
  PRIMARY KEY (`man_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `mange question answer` */

/*Table structure for table `mange_allosub` */

DROP TABLE IF EXISTS `mange_allosub`;

CREATE TABLE `mange_allosub` (
  `allo_id` int(15) NOT NULL AUTO_INCREMENT,
  `staff_id` int(15) NOT NULL,
  `sub_id` int(15) NOT NULL,
  PRIMARY KEY (`allo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mange_allosub` */

/*Table structure for table `mange_subject` */

DROP TABLE IF EXISTS `mange_subject`;

CREATE TABLE `mange_subject` (
  `sub_id` int(20) NOT NULL AUTO_INCREMENT,
  `course_id` int(20) NOT NULL,
  `subject name` varchar(20) NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mange_subject` */

insert  into `mange_subject`(`sub_id`,`course_id`,`subject name`) values 
(2,0,'1'),
(3,0,'2'),
(4,0,'2'),
(5,1,'IOT'),
(6,2,'electronics'),
(7,1,'IOT'),
(8,1,'network'),
(9,1,'deep learning');

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `staff_id` int(20) NOT NULL,
  `sub_id` int(20) NOT NULL,
  `note_id` int(20) unsigned NOT NULL,
  `notes` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `notes` */

insert  into `notes`(`staff_id`,`sub_id`,`note_id`,`notes`,`date`) values 
(2,1,1,'duygdsjd','1970-01-15');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `not_id` int(20) NOT NULL AUTO_INCREMENT,
  `notification` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`not_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `notification` */

insert  into `notification`(`not_id`,`notification`,`date`,`time`) values 
(2,'gjgfgdfd','2023-03-08','13:29:00');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `res_id` int(20) NOT NULL AUTO_INCREMENT,
  `exam_id` int(20) NOT NULL,
  `stud_id` int(20) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `result` */

/*Table structure for table `staff details` */

DROP TABLE IF EXISTS `staff details`;

CREATE TABLE `staff details` (
  `lid` int(11) NOT NULL,
  `staff_id` int(20) NOT NULL AUTO_INCREMENT,
  `first name` varchar(20) NOT NULL,
  `last name` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `pincode` int(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `dep_id` int(20) NOT NULL,
  `house name` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `staff details` */

insert  into `staff details`(`lid`,`staff_id`,`first name`,`last name`,`place`,`pincode`,`email`,`dep_id`,`house name`,`post`,`phone`) values 
(13,3,'safna','shejin','paiyapuram',67801,'nusreen@gmail.com',2,'kadat','pariyapuram',4689),
(14,4,'fathima','nusreen','nadapuram',67801,'nusreen@gmail.com',2,'kombolil','nadapurm',76533567),
(16,6,'shanib','jaan','areekode',7865,'shanibjan@13',2,'kombolil','areeksde',812956622),
(17,7,'fathima','nihala','kannur',8788,'niaal@gnail.com',1,'assanar','kannur',976544);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `stud_id` int(20) NOT NULL AUTO_INCREMENT,
  `first name` varchar(20) NOT NULL,
  `last name` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `course_id` int(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `post` varchar(20) NOT NULL,
  PRIMARY KEY (`stud_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `student` */

insert  into `student`(`stud_id`,`first name`,`last name`,`phone`,`email`,`pincode`,`course_id`,`place`,`post`) values 
(1,'shanib','jaan',98865,'sff','76577',1,'tirur','tirur');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
