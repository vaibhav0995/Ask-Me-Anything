/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.0.67-community-nt : Database - quora
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`quora` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `quora`;

/*Table structure for table `answer_bank` */

DROP TABLE IF EXISTS `answer_bank`;

CREATE TABLE `answer_bank` (
  `questionId` varchar(50) default NULL,
  `answerId` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `answer` mediumtext,
  `sdate` varchar(20) default NULL,
  `bookmarked` varchar(7) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `answer_bank` */

insert  into `answer_bank`(`questionId`,`answerId`,`userId`,`answer`,`sdate`,`bookmarked`) values ('vgq02','vgq02ans02','vg123','Dinkar is from EC branch','25/07/17',NULL),('vgq02','vgq02ans03','sh123','Dinkar is an engineer','25/07/17',NULL),('vgq34','vgq34ans310','vg123','I don\'t know much but jupiter is the biggest one in solar system !','25/07/17',''),('vgq34','vgq34ans028','sh123','The largest confirmed planet in size, as of March 2015, is the WASP 17b. The planet is almost twice the size of Jupiter, but only half the mass. It is a gas giant and orbits very close to its host star, at about half the distance between Mercury and the Sun.','25/07/17',''),('vgq19','vgq19ans214','sh123','what is this, buddy !','25/07/17',''),('vgq711','vgq711ans378','sh123','Google started from a garrage by larry page.','25/07/17',''),('vgq711','vgq711ans425','vg123','Google\'s CEO is an Indian. Sundar Pichai','25/07/17',''),('vgq711','vgq711ans014','ama947','Google has a parent company named \"ALPHABET\"','25/07/17',''),('vgq19','vgq19ans227','ama947','hii buddy are you a mad person to ask such a lame question..','25/07/17',''),('vgq19','vgq19ans458','dj@089','the above answer is given by me you thief','25/07/17',''),('viq716','viq716ans806','vin621','pata nhi, koi answer mat dena','26/07/17',''),('vgq711','vgq711ans454','vai722','It\'s package','26/07/17',''),('vgq34','vgq34ans408','vg123','Thanx Jain !','26/07/17',''),('vaq854','vaq854ans722','vg123','I don\'t know much !','26/07/17',''),('shq01','shq01ans091','vg123','What to suggest','26/07/17',''),('haq915','haq915ans977','vg123','Hi harshit ! It means unpleasant in a way that makes people feel offended.','26/07/17',''),('vgq256','vgq256ans538','ama947','Soft skills and Technical knowledge, thats it !','27/07/17',''),('vgq01','vgq01ans166','ama947','Hello','27/07/17',''),('vgq922','vgq922ans124','vg123','just write like this:  <div class=\"\">your content </div>','27/07/17',''),('vaq854','vaq854ans704','har108','Ajax can be one of the approach !','28/07/17','');

/*Table structure for table `follow` */

DROP TABLE IF EXISTS `follow`;

CREATE TABLE `follow` (
  `userId` varchar(50) default NULL,
  `following` varchar(50) default NULL,
  `questionId` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `follow` */

insert  into `follow`(`userId`,`following`,`questionId`) values ('dj@089','vg123','vgq711'),('sh123','vg123','vgq01'),('sh123','vg123','vgq711'),('sh123','vg123','vgq34'),('har108','vin621','viq716'),('har108','vg123','vgq711'),('vg123','har108','haq915'),('vg123','vai722','vaq854'),('har108','vai722','vaq854');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userId` varchar(50) NOT NULL,
  `password` varchar(50) default NULL,
  `usertype` varchar(10) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`userId`,`password`,`usertype`) values ('ama947','12345','user'),('dj@089','123','user'),('har108','12345','user'),('sh123','sh123','user'),('vai722','vaibhav','user'),('vg123','vg123','user');

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notificationId` varchar(50) NOT NULL,
  `notify` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `notificationType` varchar(50) default NULL,
  `questionId` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

insert  into `notifications`(`notificationId`,`notify`,`userId`,`notificationType`,`questionId`) values ('note031','dj@089','vg123','question','vgq922'),('note541','sh123','vg123','question','vgq922'),('note368','har108','vg123','question','vgq922'),('note136','dj@089','vg123','answer','vgq922'),('note986','sh123','vg123','answer','vgq922'),('note326','har108','vg123','answer','vgq922'),('note354','dj@089','vg123','follow','haq915'),('note700','sh123','vg123','follow','haq915'),('note645','har108','vg123','follow','haq915'),('note035','dj@089','vg123','follow','vaq854'),('note095','sh123','vg123','follow','vaq854');

/*Table structure for table `question_bank` */

DROP TABLE IF EXISTS `question_bank`;

CREATE TABLE `question_bank` (
  `questionId` varchar(50) default NULL,
  `userId` varchar(50) default NULL,
  `question` varchar(10000) default NULL,
  `sdate` date default NULL,
  `likes` varchar(10) default NULL,
  `number` bigint(3) NOT NULL auto_increment,
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `question_bank` */

insert  into `question_bank`(`questionId`,`userId`,`question`,`sdate`,`likes`,`number`) values ('vgq01','vg123','hello quora ?','2017-07-21','1',1),('shq01','sh123','suggest something ?','2017-07-22','1',2),('vgq02','sh123','who is Dinkar ?','2017-07-22','1',3),('vgq34','vg123','Which is the biggest planet in universe ?','2017-07-23','1',4),('vgq19','vg123','Hello World ?','2017-07-22','1',5),('vgq711','vg123','What are some interesting facts about Google ?','2017-07-25','1',6),('viq716','vin621','what is DST form ?','2017-07-26','1',12),('vaq854','vai722','How to apply password verification in jsp on key event?','2017-07-26','1',13),('haq915','har108','What is the meaning of obnoxious ?','2017-07-25','1',14),('vgq256','vg123','What is the basic need to crack an interview ?','2017-07-26','1',16),('vgq922','vg123','How to use \"div\" tag effectively, plz suggest !','2017-07-27','1',19);

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `Name` varchar(50) default NULL,
  `email` varchar(50) NOT NULL,
  `userId` varchar(50) default NULL,
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`Name`,`email`,`userId`) values ('Vaibhav Gautam','912v.gautam@gmail.com','vg123'),('sunny','abcd@gmail.com','abc449'),('navjeet','aman.soi12324@gmail.com','ama947'),('dinkar','dj@123.com','dj@089'),('harshit','harshit@gmail.com','har108'),('Shubham Jain','jainshubham@gmail.com','sh123'),('Vaibhav Vijay','vaibhavvijay9@gmail.com','vai722'),('vineet','vin@g.com','vin621');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
