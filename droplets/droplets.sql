-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: droplets
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 轮播图',7,'add_banners'),(20,'Can change 轮播图',7,'change_banners'),(21,'Can delete 轮播图',7,'delete_banners'),(22,'Can add 联系方式设置',8,'add_companyinfo'),(23,'Can change 联系方式设置',8,'change_companyinfo'),(24,'Can delete 联系方式设置',8,'delete_companyinfo'),(25,'Can add 详细信息',9,'add_details'),(26,'Can change 详细信息',9,'change_details'),(27,'Can delete 详细信息',9,'delete_details'),(28,'Can add 友情链接',10,'add_links'),(29,'Can change 友情链接',10,'change_links'),(30,'Can delete 友情链接',10,'delete_links'),(31,'Can add 系统设置',11,'add_siteconfig'),(32,'Can change 系统设置',11,'change_siteconfig'),(33,'Can delete 系统设置',11,'delete_siteconfig'),(34,'Can add 用户留言',12,'add_usermessage'),(35,'Can change 用户留言',12,'change_usermessage'),(36,'Can delete 用户留言',12,'delete_usermessage'),(37,'Can add 导航设置',13,'add_menus'),(38,'Can change 导航设置',13,'change_menus'),(39,'Can delete 导航设置',13,'delete_menus'),(40,'Can add 新闻分类',14,'add_newscategory'),(41,'Can change 新闻分类',14,'change_newscategory'),(42,'Can delete 新闻分类',14,'delete_newscategory'),(43,'Can add 新闻动态',15,'add_news'),(44,'Can change 新闻动态',15,'change_news'),(45,'Can delete 新闻动态',15,'delete_news'),(46,'Can add 热门关键词',16,'add_hotkeywords'),(47,'Can change 热门关键词',16,'change_hotkeywords'),(48,'Can delete 热门关键词',16,'delete_hotkeywords'),(49,'Can add 长尾词设置',17,'add_longtailkeywords'),(50,'Can change 长尾词设置',17,'change_longtailkeywords'),(51,'Can delete 长尾词设置',17,'delete_longtailkeywords'),(52,'Can add 站长提交密钥',18,'add_sitekey'),(53,'Can change 站长提交密钥',18,'change_sitekey'),(54,'Can delete 站长提交密钥',18,'delete_sitekey'),(55,'Can add Robots协议配置',19,'add_robots'),(56,'Can change Robots协议配置',19,'change_robots'),(57,'Can delete Robots协议配置',19,'delete_robots'),(58,'Can add 案例介绍',20,'add_cases'),(59,'Can change 案例介绍',20,'change_cases'),(60,'Can delete 案例介绍',20,'delete_cases'),(61,'Can add 产品分类',21,'add_productscategory'),(62,'Can change 产品分类',21,'change_productscategory'),(63,'Can delete 产品分类',21,'delete_productscategory'),(64,'Can add 产品介绍',22,'add_products'),(65,'Can change 产品介绍',22,'change_products'),(66,'Can delete 产品介绍',22,'delete_products'),(67,'Can add 案例分类',23,'add_casescategory'),(68,'Can change 案例分类',23,'change_casescategory'),(69,'Can delete 案例分类',23,'delete_casescategory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$oxSJkCvJGPjp$t1wHGE7I0rn0tlrq9PWkAEP26Ac+TI4kRLC//d3wkZ8=','2017-06-16 05:41:07',1,'work','','','work@droplets.com',1,1,'2017-05-10 08:42:16'),(2,'pbkdf2_sha256$30000$JOzpS7Ket7GU$Ax9FnwP9l3PduIl7ytlCzWb21wBHq8zy3rOp37vOSmE=','2017-07-10 12:29:44',1,'seraphln','','','seraphwlq@gmail.com',1,1,'2017-05-27 07:55:31'),(3,'pbkdf2_sha256$30000$ZOy3Z2vQd7LD$gbpv+AiEtegdTtf0jfch+e/GIoR5t87unFk0ktb0t2A=','2017-07-18 08:45:51',1,'test','','','qiudongmeng@163.com',1,1,'2017-06-16 05:49:30');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-05-14 16:22:23','1','北京华峰创业彩钢钢构工程有限公司',1,'[{\"added\": {}}]',7,1),(2,'2017-05-27 17:10:16','1','banner',1,'[{\"added\": {}}]',8,2),(3,'2017-05-27 18:04:33','1','banner',3,'',8,2),(4,'2017-05-27 18:05:54','2','banner',1,'[{\"added\": {}}]',8,2),(5,'2017-05-27 18:09:21','3','banner',1,'[{\"added\": {}}]',8,2),(6,'2017-05-27 18:10:08','3','banner',3,'',8,2),(7,'2017-05-27 18:10:15','4','banner',1,'[{\"added\": {}}]',8,2),(8,'2017-05-28 04:16:14','1','公司动态',1,'[{\"added\": {}}]',12,2),(9,'2017-05-28 04:16:24','2','新闻公告',1,'[{\"added\": {}}]',12,2),(10,'2017-05-28 04:20:05','1','彩钢房起火10家商铺受损',1,'[{\"added\": {}}]',13,2),(11,'2017-05-28 04:32:48','1','彩钢板',1,'[{\"added\": {}}]',14,2),(12,'2017-05-28 04:32:57','2','彩钢厂',1,'[{\"added\": {}}]',14,2),(13,'2017-05-28 04:33:06','3','彩钢房',1,'[{\"added\": {}}]',14,2),(14,'2017-05-28 04:57:26','1','新型彩钢板',1,'[{\"added\": {}}]',18,2),(15,'2017-05-28 04:57:35','2','围挡板系列',1,'[{\"added\": {}}]',18,2),(16,'2017-05-28 04:57:44','3','施工案例',1,'[{\"added\": {}}]',18,2),(17,'2017-05-28 04:57:52','4','楼承板系列',1,'[{\"added\": {}}]',18,2),(18,'2017-05-28 04:58:24','1','施工案例',1,'[{\"added\": {}}]',17,2),(19,'2017-05-28 04:58:44','2','施工案例',1,'[{\"added\": {}}]',17,2),(20,'2017-05-28 04:59:24','3','施工案例',1,'[{\"added\": {}}]',17,2),(21,'2017-05-28 05:03:25','2','施工案例',2,'[{\"changed\": {\"fields\": [\"pic\"]}}]',17,2),(22,'2017-05-28 05:03:38','3','施工案例',2,'[{\"changed\": {\"fields\": [\"pic\"]}}]',17,2),(23,'2017-05-28 07:31:36','1','首页',1,'[{\"added\": {}}]',11,2),(24,'2017-05-28 07:31:49','2','关于我们',1,'[{\"added\": {}}]',11,2),(25,'2017-05-28 07:31:58','3','案例中心',1,'[{\"added\": {}}]',11,2),(26,'2017-05-28 07:32:07','4','产品介绍',1,'[{\"added\": {}}]',11,2),(27,'2017-05-28 07:32:14','5','产品中心',1,'[{\"added\": {}}]',11,2),(28,'2017-05-28 07:32:21','6','新闻中心',1,'[{\"added\": {}}]',11,2),(29,'2017-05-28 07:32:28','7','联系我们',1,'[{\"added\": {}}]',11,2),(30,'2017-05-28 07:44:45','1','高先生',1,'[{\"added\": {}}]',9,2),(31,'2017-05-28 08:04:10','1','产品介绍',1,'[{\"added\": {}}]',16,2),(32,'2017-05-28 08:26:34','1','彩钢活动房',1,'[{\"added\": {}}]',15,2),(33,'2017-05-28 08:27:02','2','活动板房',1,'[{\"added\": {}}]',15,2),(34,'2017-05-30 06:26:39','1','北京,河北,天津,青岛,山东',1,'[{\"added\": {}}]',19,2),(35,'2017-05-30 06:32:47','1','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"keywords\", \"desc\"]}}]',7,2),(36,'2017-05-30 07:36:45','1','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',7,2),(37,'2017-05-30 07:36:54','1','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(38,'2017-05-30 07:38:36','1','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(39,'2017-05-30 07:39:31','1','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(40,'2017-05-30 07:40:35','1','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\", \"title\"]}}]',7,2),(41,'2017-05-30 07:41:39','3','彩钢板的形式',1,'[{\"added\": {}}]',15,1),(42,'2017-05-30 07:42:23','2','北京华峰创业彩钢钢构工程有限公司',1,'[{\"added\": {}}]',7,2),(43,'2017-05-30 07:42:34','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',7,2),(44,'2017-05-30 07:42:43','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(45,'2017-05-30 07:43:04','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(46,'2017-05-30 07:43:59','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(47,'2017-05-30 07:44:17','3','彩钢板的形式',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',15,1),(48,'2017-05-30 07:44:36','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(49,'2017-05-30 07:45:13','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"qrcode\"]}}]',7,2),(50,'2017-05-30 07:45:19','1','北京华峰创业彩钢钢构工程有限公司',3,'',7,2),(51,'2017-05-30 07:45:19','4','彩钢房的特点',1,'[{\"added\": {}}]',15,1),(52,'2017-05-30 07:46:00','4','彩钢房的特点',2,'[{\"changed\": {\"fields\": [\"desc\", \"content\"]}}]',15,1),(53,'2017-05-30 07:56:04','1','长春钢结构',1,'[{\"added\": {}}]',10,2),(54,'2017-05-30 07:56:14','2','大连断桥铝门窗',1,'[{\"added\": {}}]',10,2),(55,'2017-05-30 07:56:26','3','金地格林托班',1,'[{\"added\": {}}]',10,2),(56,'2017-05-30 12:03:29','5','产品中心',2,'[]',11,1),(57,'2017-05-31 14:10:08','2','办公家具的主流时代',1,'[{\"added\": {}}]',13,1),(58,'2017-05-31 14:10:21','2','办公家具的主流时代',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',13,1),(59,'2017-06-01 13:02:52','2','办公家具的主流时代',2,'[{\"changed\": {\"fields\": [\"keywords\"]}}]',13,1),(60,'2017-06-03 08:32:37','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(61,'2017-06-18 02:17:17','1','a',1,'[{\"added\": {}}]',21,1),(62,'2017-06-18 03:00:12','1','施工案例',2,'[{\"changed\": {\"fields\": [\"desc\", \"content\"]}}]',17,2),(63,'2017-06-19 15:03:23','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"url\", \"created_on\"]}}]',7,1),(64,'2017-06-19 15:06:09','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\"]}}]',7,1),(65,'2017-06-21 03:03:47','2','北京华峰创业彩钢钢构工程有限公司',2,'[{\"changed\": {\"fields\": [\"url\", \"created_on\"]}}]',7,3),(66,'2017-06-21 06:46:42','4','banner',3,'',8,3),(67,'2017-06-21 06:47:09','5','banner',1,'[{\"added\": {}}]',8,3),(68,'2017-06-21 06:48:13','2','banner',3,'',8,3),(69,'2017-06-21 06:49:06','6','banner',1,'[{\"added\": {}}]',8,3),(70,'2017-06-21 06:50:15','7','banner',1,'[{\"added\": {}}]',8,3),(71,'2017-06-21 06:51:13','8','banner',1,'[{\"added\": {}}]',8,3),(72,'2017-06-21 06:54:56','3','行业动态',1,'[{\"added\": {}}]',12,3),(73,'2017-06-21 06:57:20','2','新闻公告',3,'',12,3),(74,'2017-06-21 06:58:57','3','金色飞二手房',1,'[{\"added\": {}}]',13,3),(75,'2017-06-21 07:01:40','4','企业网站运营职位新要求：自媒体',1,'[{\"added\": {}}]',13,3),(76,'2017-06-21 07:02:53','5','一步步教你分析网站数据',1,'[{\"added\": {}}]',13,3),(77,'2017-06-21 07:03:04','5','一步步教你分析网站数据',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',13,3),(78,'2017-06-21 07:03:16','5','一步步教你分析网站数据',2,'[{\"changed\": {\"fields\": [\"if_recommend\", \"created_on\", \"modified_on\"]}}]',13,3),(79,'2017-06-21 07:03:29','5','一步步教你分析网站数据',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',13,3),(80,'2017-06-21 07:04:32','6','网站建设项目合同撰写注意点',1,'[{\"added\": {}}]',13,3),(81,'2017-06-21 07:07:49','3','北京恒固防腐工程有限公司',1,'[{\"added\": {}}]',7,3),(82,'2017-06-21 07:08:26','3','北京恒固防腐工程有限公司',3,'',7,3),(83,'2017-06-21 07:08:57','4','北京恒固防腐工程有限公司',1,'[{\"added\": {}}]',7,3),(84,'2017-06-21 07:09:27','5','北京恒固防腐工程有限公司',1,'[{\"added\": {}}]',7,3),(85,'2017-06-21 07:09:39','4','北京恒固防腐工程有限公司',3,'',7,3),(86,'2017-06-21 07:09:55','2','北京华峰创业彩钢钢构工程有限公司',3,'',7,3),(87,'2017-06-21 07:10:48','6','网站建设项目合同撰写注意点',3,'',13,3),(88,'2017-06-21 07:10:53','5','一步步教你分析网站数据',3,'',13,3),(89,'2017-06-21 07:10:58','4','企业网站运营职位新要求：自媒体',3,'',13,3),(90,'2017-06-21 07:11:03','3','金色飞二手房',3,'',13,3),(91,'2017-06-21 07:13:09','7','优秀网站的五大要素',1,'[{\"added\": {}}]',13,3),(92,'2017-06-21 07:13:12','7','优秀网站的五大要素',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',13,3),(93,'2017-06-21 07:14:44','8','企业网站运营职位新要求：自媒体',1,'[{\"added\": {}}]',13,3),(94,'2017-06-21 07:15:35','4','新闻广告',1,'[{\"added\": {}}]',12,3),(95,'2017-06-21 07:15:40','4','新闻广告',3,'',12,3),(96,'2017-06-21 07:17:33','9','一步步教你分析网站数据',1,'[{\"added\": {}}]',13,3),(97,'2017-06-21 07:20:14','10','网站建设项目合同撰写注意点',1,'[{\"added\": {}}]',13,3),(98,'2017-06-21 07:29:15','2','代小代',1,'[{\"added\": {}}]',9,3),(99,'2017-06-21 07:29:21','2','代小代',2,'[]',9,3),(100,'2017-06-21 07:29:23','2','代小代',2,'[]',9,3),(101,'2017-06-21 07:29:24','2','代小代',2,'[]',9,3),(102,'2017-06-21 07:29:26','2','代小代',2,'[]',9,3),(103,'2017-06-21 07:29:27','2','代小代',2,'[]',9,3),(104,'2017-06-21 07:29:55','2','代小代',3,'',9,3),(105,'2017-06-21 07:31:45','3','王经理',1,'[{\"added\": {}}]',9,3),(106,'2017-06-21 07:31:58','1','高先生',3,'',9,3),(107,'2017-06-21 07:35:05','2','纳米材料',1,'[{\"added\": {}}]',16,3),(108,'2017-06-21 07:35:14','3','纳米材料',1,'[{\"added\": {}}]',16,3),(109,'2017-06-21 07:35:22','2','纳米材料',3,'',16,3),(110,'2017-06-21 07:40:07','1','产品介绍',3,'',16,3),(111,'2017-06-21 07:43:02','8','banner',3,'',8,3),(112,'2017-06-21 07:43:02','7','banner',3,'',8,3),(113,'2017-06-21 07:43:02','6','banner',3,'',8,3),(114,'2017-06-21 07:43:02','5','banner',3,'',8,3),(115,'2017-06-21 07:43:21','9','banner',1,'[{\"added\": {}}]',8,3),(116,'2017-06-21 07:43:25','9','banner',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',8,3),(117,'2017-06-21 07:43:39','10','banner',1,'[{\"added\": {}}]',8,3),(118,'2017-06-21 07:44:08','11','banner',1,'[{\"added\": {}}]',8,3),(119,'2017-06-21 07:44:29','11','banner',2,'[{\"changed\": {\"fields\": [\"tfile\", \"created_on\", \"modified_on\"]}}]',8,3),(120,'2017-06-21 07:44:55','12','banner',1,'[{\"added\": {}}]',8,3),(121,'2017-06-21 07:45:20','13','banner',1,'[{\"added\": {}}]',8,3),(122,'2017-06-21 07:49:32','5','施工案例',1,'[{\"added\": {}}]',18,3),(123,'2017-06-21 07:49:48','4','楼承板系列',3,'',18,3),(124,'2017-06-21 07:50:02','3','施工案例',3,'',18,3),(125,'2017-06-21 07:50:02','2','围挡板系列',3,'',18,3),(126,'2017-06-21 07:50:02','1','新型彩钢板',3,'',18,3),(127,'2017-06-21 07:50:42','6','施工前后',1,'[{\"added\": {}}]',18,3),(128,'2017-06-21 07:53:20','4','酒店行业真正的互联网思维',1,'[{\"added\": {}}]',17,3),(129,'2017-06-21 07:53:30','4','酒店行业真正的互联网思维',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',17,3),(130,'2017-06-21 07:58:04','7','施工工程',1,'[{\"added\": {}}]',18,3),(131,'2017-06-21 07:59:23','5','医院网络营销',1,'[{\"added\": {}}]',17,3),(132,'2017-06-21 08:00:39','4','文档下载',1,'[{\"added\": {}}]',16,3),(133,'2017-06-21 08:03:30','5','新型水性纳米多功能底漆',1,'[{\"added\": {}}]',15,3),(134,'2017-06-21 08:07:27','6','新型水性纳米保温隔热材料',1,'[{\"added\": {}}]',15,3),(135,'2017-06-21 08:07:49','6','新型水性纳米保温隔热材料',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',15,3),(136,'2017-06-21 08:08:02','6','新型水性纳米保温隔热材料',3,'',15,3),(137,'2017-06-21 08:09:01','7','新型水性纳米保温隔热材料',1,'[{\"added\": {}}]',15,3),(138,'2017-06-21 08:11:58','8','新型水性纳米防水涂料',1,'[{\"added\": {}}]',15,3),(139,'2017-06-21 08:15:37','9','新型水性纳米太阳热反射材料',1,'[{\"added\": {}}]',15,3),(140,'2017-06-21 09:51:34','3','工程案例',2,'[{\"changed\": {\"fields\": [\"name\", \"created_on\", \"modified_on\"]}}]',11,3),(141,'2017-06-21 09:51:57','6','企业新闻',2,'[{\"changed\": {\"fields\": [\"name\", \"created_on\", \"modified_on\"]}}]',11,3),(142,'2017-06-21 10:02:06','10','网站建设项目合同撰写注意点',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',13,3),(143,'2017-06-21 12:02:43','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"url\", \"created_on\"]}}]',7,3),(144,'2017-06-21 12:04:03','1','北京,河北,天津,青岛,山东',2,'[]',19,3),(145,'2017-06-21 12:04:32','1','北京,河北,天津,青岛,山东,广东',2,'[{\"changed\": {\"fields\": [\"cities\"]}}]',19,3),(146,'2017-06-21 12:05:24','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"keywords\", \"desc\"]}}]',7,3),(147,'2017-06-22 01:27:18','8','在线留言',1,'[{\"added\": {}}]',11,3),(148,'2017-06-22 01:29:16','9','纳米技术',1,'[{\"added\": {}}]',11,3),(149,'2017-06-22 02:09:39','13','banner',3,'',8,3),(150,'2017-06-22 02:12:05','12','banner',3,'',8,3),(151,'2017-06-22 02:12:13','10','banner',3,'',8,3),(152,'2017-06-22 02:13:38','14','banner',1,'[{\"added\": {}}]',8,3),(153,'2017-06-22 02:23:38','9','纳米技术',3,'',11,3),(154,'2017-06-22 02:24:41','10','纳米技术',1,'[{\"added\": {}}]',11,3),(155,'2017-06-22 02:27:44','6','纳米技术',1,'[{\"added\": {}}]',7,3),(156,'2017-06-22 02:29:52','3','纳米材料',2,'[]',16,3),(157,'2017-06-22 02:44:43','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"intro\", \"created_on\"]}}]',7,3),(158,'2017-06-22 02:59:27','6','纳米技术',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\"]}}]',7,3),(159,'2017-06-22 03:00:23','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\", \"keywords\", \"desc\"]}}]',7,3),(160,'2017-06-22 03:01:44','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\"]}}]',7,3),(161,'2017-06-22 03:03:14','6','纳米技术',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\"]}}]',7,3),(162,'2017-06-22 03:15:33','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\"]}}]',7,3),(163,'2017-06-22 03:16:29','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\", \"keywords\", \"desc\"]}}]',7,3),(164,'2017-06-22 03:28:44','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\"]}}]',7,3),(165,'2017-06-22 03:29:34','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"keywords\"]}}]',7,3),(166,'2017-06-22 05:50:05','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"intro\", \"created_on\"]}}]',7,3),(167,'2017-06-22 05:50:37','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"intro\", \"created_on\"]}}]',7,3),(168,'2017-06-22 05:55:36','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',11,3),(169,'2017-06-22 05:56:11','11','测试',1,'[{\"added\": {}}]',11,3),(170,'2017-06-22 05:58:26','5','测试',1,'[{\"added\": {}}]',12,3),(171,'2017-06-22 05:59:52','4','保洁公司',1,'[{\"added\": {}}]',10,3),(172,'2017-06-22 06:00:14','4','保洁公司',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',10,3),(173,'2017-06-22 06:01:05','11','测试',3,'',11,3),(174,'2017-06-22 06:01:05','10','纳米技术',3,'',11,3),(175,'2017-06-22 06:01:05','8','在线留言',3,'',11,3),(176,'2017-06-22 06:01:25','12','测试',1,'[{\"added\": {}}]',11,3),(177,'2017-06-22 06:03:42','11','测试',1,'[{\"added\": {}}]',13,3),(178,'2017-06-22 06:07:20','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"intro\", \"created_on\"]}}]',7,3),(179,'2017-06-22 06:10:48','6','测试',1,'[{\"added\": {}}]',17,3),(180,'2017-06-22 06:11:09','8','测试',1,'[{\"added\": {}}]',18,3),(181,'2017-06-22 06:34:56','1','北京,河北,天津,山东',2,'[{\"changed\": {\"fields\": [\"cities\"]}}]',19,3),(182,'2017-06-22 16:31:55','1','1',1,'[{\"added\": {}}]',22,2),(183,'2017-06-23 04:42:36','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\"]}}]',7,3),(184,'2017-06-23 05:11:54','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\", \"title\", \"keywords\"]}}]',7,3),(185,'2017-06-23 05:21:15','3','北京纳米保温材料',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',14,3),(186,'2017-06-23 05:21:42','3','彩钢房',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',14,3),(187,'2017-06-25 15:30:00','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,2),(188,'2017-06-25 17:09:08','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"intro\", \"created_on\"]}}]',7,2),(189,'2017-06-26 12:19:15','5','产品中心',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,3),(190,'2017-06-26 12:20:12','2','关于我们',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,3),(191,'2017-06-26 12:36:51','1','首页',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(192,'2017-06-26 12:36:59','7','联系我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(193,'2017-06-26 12:37:07','6','企业新闻',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(194,'2017-06-26 12:37:12','5','产品中心',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(195,'2017-06-26 12:37:26','3','工程案例',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(196,'2017-06-26 12:37:30','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(197,'2017-06-26 12:37:48','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(198,'2017-06-26 12:38:00','12','测试',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(199,'2017-06-26 12:38:12','12','测试',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(200,'2017-06-26 15:18:44','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"created_on\"]}}]',7,2),(201,'2017-06-26 15:18:57','5','北京恒固防腐工程有限公司',2,'[{\"changed\": {\"fields\": [\"intro\", \"created_on\"]}}]',7,2),(202,'2017-06-29 09:45:22','3','金地格林托班',3,'',10,3),(203,'2017-06-29 09:45:22','2','大连断桥铝门窗',3,'',10,3),(204,'2017-06-29 09:45:22','1','长春钢结构',3,'',10,3),(205,'2017-06-29 09:53:09','5','A级保温材料',1,'[{\"added\": {}}]',10,3),(206,'2017-06-29 09:55:11','6','北京外墙涂料',1,'[{\"added\": {}}]',10,3),(207,'2017-06-29 09:56:43','7','北京艺术铁锈漆',1,'[{\"added\": {}}]',10,3),(208,'2017-06-29 09:59:09','12','纳米孔超级绝热材料',1,'[{\"added\": {}}]',13,3),(209,'2017-07-02 01:54:50','2','',3,'',23,2),(210,'2017-07-02 01:54:50','1','seraphln',3,'',23,2),(211,'2017-07-03 11:50:58','8','测试',3,'',18,3),(212,'2017-07-03 11:51:07','7','施工工程',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',18,3),(213,'2017-07-03 11:51:15','6','施工前后',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',18,3),(214,'2017-07-03 11:51:22','5','施工案例',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',18,3),(215,'2017-07-04 08:24:00','13','三次v',1,'[{\"added\": {}}]',13,3),(216,'2017-07-04 08:24:52','13','三次v',3,'',13,3),(217,'2017-07-04 08:34:43','14','什么是玻璃隔热涂料？',1,'[{\"added\": {}}]',13,3),(218,'2017-07-04 09:18:36','15','什么是纳米漆？有何优点？',1,'[{\"added\": {}}]',13,3),(219,'2017-07-05 13:58:14','3','行业动态',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',12,3),(220,'2017-07-06 12:58:26','4','文档下载',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',16,2),(221,'2017-07-06 12:58:30','3','纳米材料',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',16,2),(222,'2017-07-06 12:58:56','3','纳米材料',2,'[{\"changed\": {\"fields\": [\"dir_name\"]}}]',16,2),(223,'2017-07-06 13:00:25','4','文档下载',3,'',16,2),(224,'2017-07-07 01:53:04','15','什么是纳米漆？有何优点？',2,'[{\"changed\": {\"fields\": [\"pic\", \"created_on\", \"modified_on\"]}}]',13,3),(225,'2017-07-07 01:55:13','10','test',1,'[{\"added\": {}}]',15,3),(226,'2017-07-07 01:55:40','10','test',3,'',15,3),(227,'2017-07-07 01:56:36','15','什么是纳米漆？有何优点？',2,'[{\"changed\": {\"fields\": [\"pic\", \"created_on\", \"modified_on\"]}}]',13,3),(228,'2017-07-07 01:57:12','11','测试',3,'',13,3),(229,'2017-07-07 01:58:27','11','test',1,'[{\"added\": {}}]',15,3),(230,'2017-07-07 02:03:37','11','test',3,'',15,3),(231,'2017-07-07 02:06:09','12','测试',3,'',11,3),(232,'2017-07-07 02:10:40','13','施工现场',1,'[{\"added\": {}}]',11,3),(233,'2017-07-07 02:11:05','13','施工现场',2,'[{\"changed\": {\"fields\": [\"dir_name\", \"created_on\", \"modified_on\"]}}]',11,3),(234,'2017-07-07 02:11:43','13','施工现场',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,3),(235,'2017-07-07 02:12:27','13','施工现场',3,'',11,3),(236,'2017-07-08 12:25:13','5','产品中心',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(237,'2017-07-08 12:54:32','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(238,'2017-07-08 12:54:36','3','工程案例',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(239,'2017-07-08 12:56:13','6','企业新闻',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(240,'2017-07-08 12:57:19','5','产品中心',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(241,'2017-07-08 13:11:57','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(242,'2017-07-08 13:12:13','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(243,'2017-07-08 14:59:23','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(244,'2017-07-08 14:59:28','5','产品中心',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(245,'2017-07-10 11:51:58','7','施工工程',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',18,3),(246,'2017-07-10 11:52:11','6','施工前后',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',18,3),(247,'2017-07-10 11:52:17','5','施工案例',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',18,3),(248,'2017-07-10 11:56:35','2','关于我们',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,3),(249,'2017-07-10 11:56:51','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',11,3),(250,'2017-07-10 11:56:58','7','联系我们',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,3),(251,'2017-07-10 11:58:54','7','联系我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(252,'2017-07-10 11:59:13','7','联系我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(253,'2017-07-10 11:59:18','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(254,'2017-07-10 12:13:27','3','纳米材料',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',16,3),(255,'2017-07-10 12:13:40','5','测试',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',12,3),(256,'2017-07-10 12:13:45','3','行业动态',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',12,3),(257,'2017-07-10 12:13:52','1','公司动态',2,'[{\"changed\": {\"fields\": [\"parent_cate\"]}}]',12,3),(258,'2017-07-10 12:14:47','2','关于我们',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(259,'2017-07-10 12:15:55','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(260,'2017-07-10 12:16:29','4','产品介绍',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\", \"is_foot\"]}}]',11,3),(261,'2017-07-10 12:31:44','6','企业新闻',2,'[{\"changed\": {\"fields\": [\"dir_name\", \"created_on\", \"modified_on\"]}}]',11,2),(262,'2017-07-11 11:46:49','2','关于我们',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\"]}}]',11,3),(263,'2017-07-12 01:58:25','4','测试',1,'[{\"added\": {}}]',16,3),(264,'2017-07-12 01:58:40','4','测试',2,'[]',16,3),(265,'2017-07-12 02:01:07','14','测试',1,'[{\"added\": {}}]',11,3),(266,'2017-07-12 02:09:10','15','什么是纳米漆？有何优点？',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',13,3),(267,'2017-07-12 02:09:43','15','什么是纳米漆？有何优点？',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',13,3),(268,'2017-07-12 02:17:30','5','产品中心',2,'[{\"changed\": {\"fields\": [\"created_on\", \"modified_on\"]}}]',11,3),(269,'2017-07-12 02:19:39','8','测试',1,'[{\"added\": {}}]',15,3),(270,'2017-07-12 02:32:53','14','测试',2,'[{\"changed\": {\"fields\": [\"parent_cate\", \"created_on\", \"modified_on\", \"is_root\"]}}]',11,3),(271,'2017-07-13 06:07:28','5','测试1',1,'[{\"added\": {}}]',16,3),(272,'2017-07-13 06:08:23','8','测试',3,'',15,3),(273,'2017-07-13 06:11:29','14','测试',3,'',11,3),(274,'2017-07-18 06:53:33','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',22,3),(275,'2017-07-18 06:58:35','9','新型水性纳米太阳热反射材料',1,'[{\"added\": {}}]',15,3),(276,'2017-07-18 07:07:32','6','测试',3,'',17,3),(277,'2017-07-18 07:10:10','5','医院网络营销',3,'',17,3),(278,'2017-07-18 07:10:10','4','酒店行业真正的互联网思维',3,'',17,3),(279,'2017-07-18 07:10:48','5','新型水性纳米多功能底漆',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',15,2),(280,'2017-07-18 07:11:46','7','新型水性纳米保温隔热材料',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',15,2),(281,'2017-07-18 07:14:55','5','测试1',3,'',16,3),(282,'2017-07-18 07:14:55','4','测试',3,'',16,3),(283,'2017-07-18 07:15:10','6','新型水性纳米',1,'[{\"added\": {}}]',16,3),(284,'2017-07-18 07:15:41','7','水性纳米',1,'[{\"added\": {}}]',16,3),(285,'2017-07-18 07:18:02','8','纳米保温材料',1,'[{\"added\": {}}]',16,3),(286,'2017-07-18 07:29:28','9','新型水性纳米太阳热反射材料',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',15,3),(287,'2017-07-18 07:32:53','10','纳米材料',1,'[{\"added\": {}}]',15,3),(288,'2017-07-18 07:45:04','11','纳米材料',1,'[{\"added\": {}}]',15,3),(289,'2017-07-18 07:45:17','12','纳米材料',1,'[{\"added\": {}}]',15,3),(290,'2017-07-18 07:45:34','12','纳米材料',2,'[{\"changed\": {\"fields\": [\"content\", \"created_on\", \"modified_on\"]}}]',15,3),(291,'2017-07-18 07:45:56','7','水性纳米漆',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',16,3),(292,'2017-07-18 07:48:20','13','水性纳米漆',1,'[{\"added\": {}}]',15,3),(293,'2017-07-18 07:48:52','14','水性纳米漆',1,'[{\"added\": {}}]',15,3),(294,'2017-07-18 07:49:31','15','水性纳米漆',1,'[{\"added\": {}}]',15,3),(295,'2017-07-18 07:50:51','9','新型水性纳米太阳热反射材料',2,'[{\"changed\": {\"fields\": [\"category\", \"created_on\", \"modified_on\"]}}]',15,3),(296,'2017-07-18 07:51:00','7','新型水性纳米保温隔热材料',2,'[{\"changed\": {\"fields\": [\"category\", \"created_on\", \"modified_on\"]}}]',15,3),(297,'2017-07-18 07:51:14','5','新型水性纳米多功能底漆',2,'[{\"changed\": {\"fields\": [\"category\", \"created_on\", \"modified_on\"]}}]',15,3),(298,'2017-07-18 07:53:59','16','新型水性纳米',1,'[{\"added\": {}}]',15,3),(299,'2017-07-18 07:54:41','17','新型水性纳米',1,'[{\"added\": {}}]',15,3),(300,'2017-07-18 07:55:22','18','新型水性纳米',1,'[{\"added\": {}}]',15,3),(301,'2017-07-18 07:55:43','19','新型水性纳米',1,'[{\"added\": {}}]',15,3),(302,'2017-07-18 08:08:11','7','纳米材料生产厂房',1,'[{\"added\": {}}]',17,3),(303,'2017-07-18 08:11:33','8','纳米保温材料对接',1,'[{\"added\": {}}]',17,3),(304,'2017-07-18 08:11:59','9','纳米保温材料施工',1,'[{\"added\": {}}]',17,3),(305,'2017-07-18 08:12:36','10','纳米保温材料施工',1,'[{\"added\": {}}]',17,3),(306,'2017-07-18 08:30:50','11','纳米保温材料',1,'[{\"added\": {}}]',17,3),(307,'2017-07-18 08:31:06','5','测试',3,'',12,3),(308,'2017-07-18 08:34:06','12','纳米保温材料施工案例',1,'[{\"added\": {}}]',17,3),(309,'2017-07-18 08:34:41','13','纳米保温材料施工案例',1,'[{\"added\": {}}]',17,3),(310,'2017-07-18 08:35:08','14','纳米保温材料施工案例',1,'[{\"added\": {}}]',17,3),(311,'2017-07-18 09:03:35','2','上海',1,'[{\"added\": {}}]',19,3),(312,'2017-07-18 09:04:52','1','北京,河北,天津,山东,上海',2,'[{\"changed\": {\"fields\": [\"cities\"]}}]',19,3),(313,'2017-07-18 09:05:42','2','上海',3,'',19,3),(314,'2017-07-18 09:15:18','16','防水隔热涂料使用寿命',1,'[{\"added\": {}}]',13,3),(315,'2017-07-19 01:02:13','17','隔热保温涂料的发展',1,'[{\"added\": {}}]',13,3),(316,'2017-07-19 01:06:12','18','玻璃隔热涂料',1,'[{\"added\": {}}]',13,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'dphome','banners'),(8,'dphome','companyinfo'),(9,'dphome','details'),(10,'dphome','links'),(13,'dphome','menus'),(11,'dphome','siteconfig'),(12,'dphome','usermessage'),(15,'news','news'),(14,'news','newscategory'),(20,'products','cases'),(23,'products','casescategory'),(22,'products','products'),(21,'products','productscategory'),(16,'seo','hotkeywords'),(17,'seo','longtailkeywords'),(19,'seo','robots'),(18,'seo','sitekey'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-19 11:36:55'),(2,'auth','0001_initial','2017-07-19 11:36:55'),(3,'admin','0001_initial','2017-07-19 11:36:55'),(4,'admin','0002_logentry_remove_auto_add','2017-07-19 11:36:55'),(5,'contenttypes','0002_remove_content_type_name','2017-07-19 11:36:55'),(6,'auth','0002_alter_permission_name_max_length','2017-07-19 11:36:55'),(7,'auth','0003_alter_user_email_max_length','2017-07-19 11:36:55'),(8,'auth','0004_alter_user_username_opts','2017-07-19 11:36:56'),(9,'auth','0005_alter_user_last_login_null','2017-07-19 11:36:56'),(10,'auth','0006_require_contenttypes_0002','2017-07-19 11:36:56'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-19 11:36:56'),(12,'auth','0008_alter_user_username_max_length','2017-07-19 11:36:56'),(13,'dphome','0001_initial','2017-07-19 11:36:56'),(14,'dphome','0002_auto_20170527_1641','2017-07-19 11:36:56'),(15,'dphome','0003_auto_20170528_0731','2017-07-19 11:36:56'),(16,'dphome','0004_auto_20170530_0632','2017-07-19 11:36:56'),(17,'dphome','0005_siteconfig_title','2017-07-19 11:36:56'),(18,'dphome','0006_auto_20170530_0735','2017-07-19 11:36:56'),(19,'dphome','0007_auto_20170530_0736','2017-07-19 11:36:56'),(20,'dphome','0008_auto_20170530_0740','2017-07-19 11:36:56'),(21,'dphome','0009_auto_20170530_0745','2017-07-19 11:36:56'),(22,'dphome','0010_details','2017-07-19 11:36:56'),(23,'dphome','0011_links_created_on','2017-07-19 11:36:56'),(24,'dphome','0012_auto_20170625_1516','2017-07-19 11:36:56'),(25,'dphome','0013_menus_is_root','2017-07-19 11:36:56'),(26,'dphome','0014_usermessage','2017-07-19 11:36:56'),(27,'dphome','0015_menus_is_foot','2017-07-19 11:36:56'),(28,'news','0001_initial','2017-07-19 11:36:56'),(29,'news','0002_auto_20170528_0418','2017-07-19 11:36:56'),(30,'news','0003_auto_20170528_0419','2017-07-19 11:36:56'),(31,'news','0004_news_url','2017-07-19 11:36:56'),(32,'news','0005_auto_20170625_1516','2017-07-19 11:36:56'),(33,'news','0006_newscategory_parent_cate','2017-07-19 11:36:56'),(34,'products','0001_initial','2017-07-19 11:36:56'),(35,'products','0002_auto_20170528_0824','2017-07-19 11:36:56'),(36,'products','0003_remove_products_if_recommend','2017-07-19 11:36:56'),(37,'products','0004_auto_20170617_1818','2017-07-19 11:36:56'),(38,'products','0005_auto_20170618_0221','2017-07-19 11:36:56'),(39,'products','0006_auto_20170708_1112','2017-07-19 11:36:56'),(40,'products','0007_auto_20170710_1150','2017-07-19 11:36:56'),(41,'products','0008_productscategory_parent_cate','2017-07-19 11:36:56'),(42,'seo','0001_initial','2017-07-19 11:36:56'),(43,'seo','0002_longtailkeywords','2017-07-19 11:36:56'),(44,'seo','0003_sitekey','2017-07-19 11:36:56'),(45,'seo','0004_robots','2017-07-19 11:36:56'),(46,'sessions','0001_initial','2017-07-19 11:36:56');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('11w8u8u3z4dil0dl1yfye267cd4e3571','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-05 03:02:52'),('1mosy6j5a5khbdaciqeuck3z565vurlb','YzA0MTRlMjBlZmQ2YTIzYjllOWVmNzVkMzJmZDY4YzgwNmU3ZmZkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5ODhhYWY4OWUxMzg0OGNkODA5MjMxNmYzMzc4ODliMDA0MmIzZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-11 08:25:32'),('1yl26qhxrnnywpr2sagfwh1jzmecnx3e','YzA0MTRlMjBlZmQ2YTIzYjllOWVmNzVkMzJmZDY4YzgwNmU3ZmZkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5ODhhYWY4OWUxMzg0OGNkODA5MjMxNmYzMzc4ODliMDA0MmIzZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-24 09:00:55'),('2ramu96ypd9t3rqsscgs47sl4hb69pfs','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-23 04:26:08'),('41n0yryapbocdz5dry172twwuusv4r97','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-06 05:36:50'),('5dhwol3jlpsc3lv2cdetltfefx7gse9u','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-26 12:50:27'),('63nk6atsmre3gegiva9abe5mz6vcmlgm','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-18 08:22:29'),('79pwzzqjefkwj5a09s1p58ot0j9idmhz','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-23 04:31:40'),('7iudgz3oo7w4j55la6x15foc36i0frq1','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-13 10:18:53'),('axcwuj3s8sz8kb3zuxle1971m7ql7j9e','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-16 01:16:38'),('bnypcrctwouuklzw6v3lxhv6yry2sp4d','YzA0MTRlMjBlZmQ2YTIzYjllOWVmNzVkMzJmZDY4YzgwNmU3ZmZkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5ODhhYWY4OWUxMzg0OGNkODA5MjMxNmYzMzc4ODliMDA0MmIzZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-30 05:41:07'),('bovopo2x245m06b9vpd3vpwpu13u2vcu','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-10 07:55:35'),('cjeba5j5ni0u6za9l09pun1f2pru10hy','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-24 12:29:44'),('crzv7qnrhc7xoxmzi6nwt5smx6cq7vtd','YzA0MTRlMjBlZmQ2YTIzYjllOWVmNzVkMzJmZDY4YzgwNmU3ZmZkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5ODhhYWY4OWUxMzg0OGNkODA5MjMxNmYzMzc4ODliMDA0MmIzZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-28 16:21:25'),('ctsszolnedvn8g5plrufy7ivtrp4fxzt','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-08-01 08:45:51'),('dbqppqs41o8lbwzk0slwvglg9xbopqr8','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-06 02:21:35'),('ehx2yi16l1zo3ulnlrlt59qy718l5ixv','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-05 03:10:12'),('ek7cb71fcwgcya7sygivlujadslsa05u','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-13 06:26:24'),('f4zfr4mqp2y31jrltmjw1zqeeik49jko','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-22 11:16:16'),('fwkcc90wzoiw78qy7v1rk8qd2boduxgs','YzA0MTRlMjBlZmQ2YTIzYjllOWVmNzVkMzJmZDY4YzgwNmU3ZmZkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5ODhhYWY4OWUxMzg0OGNkODA5MjMxNmYzMzc4ODliMDA0MmIzZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-24 08:42:34'),('hwrobkv62zcnyqvf4lb4dczpit50viu7','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-19 13:47:31'),('ih6ap1j7vdewkvrl5gmg4v4ccblng9n3','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-07 05:18:55'),('ik2gd2nj9nir0bddoi4jd77zv6jcrp7b','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-06-30 06:01:52'),('imh1a5c5szexb8jxl12534nnoofrzxau','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-06 01:26:51'),('iwuzkhmjxlt4nj1buncy5w9crwfe9zgt','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-05 03:13:21'),('k4cz372fs08oqfcpjo13fpwvmsna03d9','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-13 09:37:02'),('mlhtrn65biklkmf7r1jsov18b7b51dc9','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-12 08:34:09'),('mlj9apmjbk2c7qrp8a7m7drusidjy5ko','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-24 12:21:50'),('numazezbmbc5pcyfzp4u205fmo943har','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-25 07:40:39'),('omxwo3l5oia00lkvepggjrq8ysjagc1e','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-21 01:45:41'),('phrfqtoa001tl90i4dzc43g4haso65xe','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-07-02 14:40:41'),('rltgb8a4nrjn5oq83j9et74sp7hg8x6u','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-01 20:00:36'),('un8acmq2b0gk841j1loq696mkkdv2tec','YzA0MTRlMjBlZmQ2YTIzYjllOWVmNzVkMzJmZDY4YzgwNmU3ZmZkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5ODhhYWY4OWUxMzg0OGNkODA5MjMxNmYzMzc4ODliMDA0MmIzZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-04 00:35:48'),('wvaiwa4g0w0jifsrbd9umevbhz9rimdm','NDQ3M2YxODhhY2U1OGRmODk4ZDkwMzBiNzhjZTgzZDg2MmZhNDg3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNjUwOWVhOTQ5MjI0OGZlYzk0NzY3MDg4ODk0ODJlODliNzg4YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-07-23 00:16:02'),('x4sr7x6iqp0lbtbc6cqm9lfr12neiwf6','ZGZkN2Q0NGI4ODBhZTE1NGJlODFlMDA4NjI0MmU5YWNhNTBiMGE5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImEyZWI5ZjNjNTU1ODZmMjVkYjQ3ZDQwOWM0YTlkOWMzMGRjNjhkYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-06-30 05:49:51');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_banners`
--

DROP TABLE IF EXISTS `dphome_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ttype` varchar(128) NOT NULL,
  `tfile` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_banners`
--

LOCK TABLES `dphome_banners` WRITE;
/*!40000 ALTER TABLE `dphome_banners` DISABLE KEYS */;
INSERT INTO `dphome_banners` VALUES (9,'banner','../uploads/1_hwvBbhW.jpg','2017-06-21 07:43:21','2017-06-21 07:43:21'),(11,'banner','../uploads/2_lz3Gnza.jpg','2017-06-21 07:44:08','2017-06-21 07:44:08'),(14,'banner','../uploads/2_vc0Frga.jpg','2017-06-22 02:13:38','2017-06-22 02:13:38');
/*!40000 ALTER TABLE `dphome_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_companyinfo`
--

DROP TABLE IF EXISTS `dphome_companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_companyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `position` varchar(128) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postcode` varchar(16) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_companyinfo`
--

LOCK TABLES `dphome_companyinfo` WRITE;
/*!40000 ALTER TABLE `dphome_companyinfo` DISABLE KEYS */;
INSERT INTO `dphome_companyinfo` VALUES (3,'王经理','F','董事长','0755-27780000','0755-27780000','0755-27780000','深圳市南山区东滨路86号1栋B115二楼201','10000','http://www.qiocn.com/','shenpeiqing@cofco.com','','北京恒固防腐工程有限公司成立于2010年，注册资金1000万人民币。位于石景山区。目前已取得国家高新产业证书。旗下有十五个省分公司及省级备案证书，两个生产基地。');
/*!40000 ALTER TABLE `dphome_companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_details`
--

DROP TABLE IF EXISTS `dphome_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `industry` varchar(128) NOT NULL,
  `enterprise` varchar(128) NOT NULL,
  `operating` varchar(128) NOT NULL,
  `registered` varchar(128) NOT NULL,
  `registered_add` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `employees` varchar(128) NOT NULL,
  `people` varchar(128) NOT NULL,
  `workshop` varchar(128) NOT NULL,
  `account` varchar(128) NOT NULL,
  `account_number` varchar(128) NOT NULL,
  `authentication` varchar(128) NOT NULL,
  `customer` varchar(128) NOT NULL,
  `market` varchar(128) NOT NULL,
  `kepp` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_details`
--

LOCK TABLES `dphome_details` WRITE;
/*!40000 ALTER TABLE `dphome_details` DISABLE KEYS */;
INSERT INTO `dphome_details` VALUES (1,'a','b','c','d','e','f','a','b','c','d','e','f','a','c','s','d');
/*!40000 ALTER TABLE `dphome_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_links`
--

DROP TABLE IF EXISTS `dphome_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_links`
--

LOCK TABLES `dphome_links` WRITE;
/*!40000 ALTER TABLE `dphome_links` DISABLE KEYS */;
INSERT INTO `dphome_links` VALUES (4,'保洁公司','http://www.bjrcbj.com','2017-06-25 14:48:41'),(5,'A级保温材料','http://bjjisuban.cn/','2017-06-29 09:53:09'),(6,'北京外墙涂料','http://bwjzcl.com/','2017-06-29 09:55:11'),(7,'北京艺术铁锈漆','http://shuixingqicj.com/','2017-06-29 09:56:43');
/*!40000 ALTER TABLE `dphome_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_menus`
--

DROP TABLE IF EXISTS `dphome_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `customized_seq` int(11) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `parent_cate_id` int(11),
  `is_root` tinyint(1) NOT NULL,
  `is_foot` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dphome_menus_1582e776` (`parent_cate_id`),
  CONSTRAINT `dphome_menus_parent_cate_id_f65f3870_fk_dphome_menus_id` FOREIGN KEY (`parent_cate_id`) REFERENCES `dphome_menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_menus`
--

LOCK TABLES `dphome_menus` WRITE;
/*!40000 ALTER TABLE `dphome_menus` DISABLE KEYS */;
INSERT INTO `dphome_menus` VALUES (1,'首页',0,'/','','2017-05-28 07:30:49','2017-05-28 07:30:49',NULL,1,0),(2,'关于我们',0,'/about','','2017-05-28 07:31:37','2017-05-28 07:31:37',4,1,0),(3,'工程案例',0,'/cases/','','2017-05-28 07:31:49','2017-05-28 07:31:49',NULL,1,1),(4,'产品介绍',0,'/about/about10.html','彩钢板的形式：未成型前是卷材，成型后的型号就很多了，最常用是：820型，840型，900型等等','2017-05-28 07:31:58','2017-05-28 07:31:58',5,1,0),(5,'产品中心',0,'/supply/','','2017-05-28 07:32:07','2017-05-28 07:32:07',5,1,1),(6,'企业新闻',0,'/news/','','2017-05-28 07:32:14','2017-05-28 07:32:14',NULL,1,1),(7,'联系我们',0,'/about/about9.html','','2017-05-28 07:32:21','2017-05-28 07:32:21',2,1,0);
/*!40000 ALTER TABLE `dphome_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_siteconfig`
--

DROP TABLE IF EXISTS `dphome_siteconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_siteconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `intro` longtext,
  `created_on` datetime NOT NULL,
  `cnzz` longtext,
  `tongji_js` longtext,
  `desc` varchar(255),
  `keywords` varchar(255),
  `title` varchar(255),
  `qrcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_siteconfig`
--

LOCK TABLES `dphome_siteconfig` WRITE;
/*!40000 ALTER TABLE `dphome_siteconfig` DISABLE KEYS */;
INSERT INTO `dphome_siteconfig` VALUES (5,'北京恒固防腐工程有限公司','www.qiocn.com','../uploads/logo_YzXGYkB.png','<p>&nbsp; &nbsp; &nbsp; &nbsp;北京恒固工程有限公司是一个致力于防腐领域、节能领域及研发、生产、销售、施工服务为一体的专业集团公司,专注于纳米保温材料、玻璃隔热涂料、纳米地坪漆、水性纳米防腐材料等防腐材料生产厂家。北京恒固工程有限公司是一个致力于防腐领域、节能领域及研发、生产、销售、施工服务为一体的专业集团公司,专注于纳米保温材料、玻璃隔热涂料、纳米地坪漆、水性纳米防腐材料等防腐材料生产 厂家。北京恒固工程有限公司是一个致力于防腐领域、节能领域及研发、生产、销售、施工服务为一体的专业集团公司,专注于纳米保温材料、玻璃隔热涂料、纳米地坪漆、水性纳米防腐材料等防腐材料生产厂家。</p>','2017-06-21 07:09:27','','','北京恒固工程有限公司是一个致力于防腐领域、节能领域及研发、生产、销售、施工服务为一体的专业集团公司,专注于纳米保温材料、玻璃隔热涂料、纳米地坪漆、水性纳米防腐材料等防腐材料生产厂家','纳米保温材料,玻璃隔热涂料,纳米地坪漆,水性纳米防腐材料','纳米保温材料_玻璃隔热涂料_纳米地坪漆_水性纳米防腐材料','../uploads/qrcode_96Ps3gV.jpg'),(6,'纳米技术','http://www.qiocn.com/','','大方向东方闪电古代诗歌','2017-06-22 02:27:44','','','','','','');
/*!40000 ALTER TABLE `dphome_siteconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dphome_usermessage`
--

DROP TABLE IF EXISTS `dphome_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dphome_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `telephone` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `content` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dphome_usermessage`
--

LOCK TABLES `dphome_usermessage` WRITE;
/*!40000 ALTER TABLE `dphome_usermessage` DISABLE KEYS */;
INSERT INTO `dphome_usermessage` VALUES (3,'武斌','137165742801','seraphln@163.com','adf','2017-07-02 01:59:08'),(4,'·','13511111111','1@qq.com','收拾收拾','2017-07-09 12:53:04'),(5,'1','13810219511','1@1.com','ssss','2017-07-09 12:58:51'),(6,'seraphln','13716742000','seraphwlq@gmail.com','测试留言','2017-07-10 12:21:38'),(7,'11','15811336930','497105485@163.com','12333','2017-07-12 06:14:12');
/*!40000 ALTER TABLE `dphome_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news`
--

DROP TABLE IF EXISTS `news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `if_recommend` tinyint(1) NOT NULL,
  `desc` longtext,
  `content` longtext,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `spdier_push` int(11) NOT NULL,
  `url` varchar(255),
  PRIMARY KEY (`id`),
  KEY `news_news_b583a629` (`category_id`),
  CONSTRAINT `news_news_category_id_f060a768_fk_news_newscategory_id` FOREIGN KEY (`category_id`) REFERENCES `news_newscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news`
--

LOCK TABLES `news_news` WRITE;
/*!40000 ALTER TABLE `news_news` DISABLE KEYS */;
INSERT INTO `news_news` VALUES (7,'优秀网站的五大要素','../uploads/2_WPPvwW4.jpg','',1,'优秀网站的五大要素','1、网站内容非富\r\n          网站作为一种媒体，提供给用户的最主要还是网站的内容，没有人会在一个没内容的网站上留连往返，就象没人会两次看同一份毫无新意的报纸一样！\r\n2、页面下载速度快\r\n　　 据研究发现，页面下载速度是网站留住访问者的关键因素，如果20—30秒还不能打开一个网页，一般人就会没有耐心。如果不能让每个页面都保持较快的下载速度，至少应该确保主页速度尽可能快。\r\n　　 在目前的情况下，保持页面下载速度的主要方法是让网页简单，仅将最重要的信息安排在首页，尽量避免使用大量的图片。\r\n　　 虽然大量使用文字降低了网页的视觉效果，显得有些呆板，不过根据加拿大最近一项“网民网上看什么”的调查显示，互联网用户92%的上网时间用来看文字资讯。\r\n3、功能多样、使用方便\r\n　　 网站吸引用户访问的基本目的无非是出于几个方面：扩大网站知名度和吸引力；将潜在顾客转化为实际顾客；将现有顾客发展为忠诚顾客等。为用户提供一个多功能的人性化界面，并保持这种功能的使用方便，就显得十分重要，说到底用户使用一种服务----不管在网上网下------最主要的是方便。包括方便的导航系统、必要的帮助信息、常见问题解答、尽量简单的用户注册程序等等。\r\n4、网站品质优秀\r\n　　 网页上的错误链接常常是人们对网站抱怨的主要因素之一。我们时常可以看到“该网页已被删除或不能显示”、“Filenotfound”等由于无效链接而产生的反馈信息，这种情况往往让人觉得难以忍受，同时也严重影响了用户对网站的信心。如果网站同时可以提供800免费服务电话和callcenter等联系方式，相信不仅可以体现公司的实力，而且更能充分体现出良好的顾客服务。\r\n5、保护个人信息\r\n　　 在个性化服务十分普及的今天，许多网站要求用户首先注册为会员，网站收集用户资料有何目的？如何利用用户的个人信息？是否将用户资料出售给其它机构？是','2017-06-21 07:13:09','2017-06-21 07:13:09',1,1,'http://www.qiocn.com/news/'),(8,'企业网站运营职位新要求：自媒体','','',0,'企业网站运营职位新要求：自媒体','导读：前几天笔者去应聘一个传统企业网站的SEO工作，面试官的第一句问的就是“你懂自媒体吗?我们公司对SEO主管第一个要求就是精通自媒体”。\r\n \r\n　　自媒体的发展有目共睹，过去的风靡站长圈的SEO博客纷纷改成自媒体博客，自媒体的第一批人是运营站长博客的站长们。\r\n \r\nundefined\r\n \r\n　　自媒体有多重要呢?一个网站的核心是内容，现在互联网上内容第一提供者就是自媒体人，谁的网站能拉拢住自媒体人，谁的网站内容就会非常丰富，各大门户网站就是看清了这一点，纷纷开通自媒体平台、搜狐自媒体、凤凰自媒体、百度百家、今日头条、还有各位草根运营的自媒体博客，自媒体的发展四处开花、漫山遍野都是自媒体的影子，尤其可见自媒体的重要性。\r\n \r\n　　传统企业利用自媒体人的自身优势大力发展网络营销是非常有利了，所以很多企业在聘请SEO的时候都会要求应聘者懂自媒体，企业聘请自媒体人的目的是为卖产品，怎么卖产品是我们重点。\r\n \r\n　　自媒体人怎么帮助企业卖产品?\r\n \r\n　　1：自媒体人卖产品的第一步就是在各大平台注册账户，越多越好。\r\n \r\n　　2：每天写作软文，然后在各大自媒体平台投稿，吸引粉丝，当然注意软文的硬度，不能太硬，免得自媒体平台审核不通过。\r\n \r\n　　3：在每一篇的文章底部留下企业的官网或者其他联系方式。\r\n \r\n　　4：在自媒体平台投稿的文章标题一定要包涵产品的关键词，想百度百家、搜狐自媒体都能进百度新闻源，你写的标题包涵产品关键词，投稿成功后，搜索关键词，能在第一页百度新闻相关信息看到你投的稿子。\r\n \r\n　　5：铺天盖地海量的投稿，内容越多越好、可读性越强越好，当你的文章积累到一定数量的时候，有可能你在百度搜索产品关键词的时候显示的结果一个整页都是你们公司的信息。\r\n \r\n　　总结：自媒体帮公司卖产品，最重要是内容撰写，拥有很好的文字撰写能力非常重要，尽量原创，因为原创百度收录的效果最好、排名也最好，像企业不可能聘请编辑，没有编辑所以自媒体人在企业的每天要计划好写多少篇文章最好，像笔者每天早晨写两篇文章，然后把昨天写好的两篇文章投向各大平台，下午就是处理一些业务琐事，有计划的工作非常重要，亲自去感受一下就知道了。','2017-06-21 07:14:44','2017-06-21 07:14:44',1,0,'http://www.qiocn.com/news/'),(9,'一步步教你分析网站数据','../uploads/20160615110309_ezXvjQo.jpg','',0,'一步步教你分析网站数据','导语：你是否曾经面对着一大堆网站数据毫无头绪？你是否曾为选择哪些页面进行测试感到举棋不定？让Luke来告诉你，如何有效地利用“谷歌分析”指导设计和研究吧！\r\n\r\n用户体验，分析至上（一）\r\n\r\n索菲亚【译者注：为了更接地气，以下称为“小红”】正在和她的客户讨论可用性测试的项目，她已经迫不及待地要开始了。然而唯一尚未解决的问题是，他们对于测试什么内容和着眼于网站的哪个部分持有不同的观点。小红的客户对他们的顾客很了解，但是小红拥有多年用户体验的研究经验，没有任何迹象表明小红和她的客户可以达成一致的意见。于是小红把注意力转向了数据分析，希望能深层次地洞悉人们到底是如何使用网站的。\r\n\r\n可用性测试和数据分析是一对无敌好搭档，它们让我们更多地了解用户，跟踪我们的目标，解决意外的问题。说到解决问题，数据分析告诉我们哪些页面或者流程正在给用户造成麻烦，哪些领域需要我们在可用性测试中重点关注。接下来，可用性测试会告诉我们为什么用户会表现出某些特定的行为。在这两者之上，我们可以为网站拥有者提供重点明确、针对用户的建议。\r\n\r\n在小红（和许许多多与之相似的用户体验从业人员）的例子中，数据分析能揭露用户到底是怎么访问网站的。虽然小红和客户在用户体验或顾客方面的经验可能让他们对于测试什么有了不错的假设，但对于人们是如何访问网站，数据分析展示给他们的是更为清晰、无偏见的方式。\r\n\r\n对于任何希望通过学习一些简单的工具来读懂数据的人，数据分析可以帮助你：\r\n\r\n识别网站上出问题的地方\r\n显示网站对于用户的吸引力\r\n测量设计上的改善带来的结果\r\n在这两篇系列文章中，我将会解释如何利用数据分析来识别用户有问题的地方，以及网站的哪些地方会从可用性测试中受益最多。\r\n\r\n本篇文章的重点为——三个识别网站问题的参数：跳出和退出率（bounce and exit rate），页面平均时间（average time on page）和目标价值（page value）。\r\n\r\n在第二部分，我们会进一步利用这些参数来识别drop off points，然后我们会深入到数据分段（segmentation）来获取额外的细节信息。\r\n\r\n辨认问题网页（组）\r\n\r\n作为一名自由职业者和用户体验咨询师，我与各种各样不同领域的网站合作过，其过程非常一致，总是以数据分析为开端。最开始我会去辨认每天有多少用户访问这个网站，哪个页面最常用。这会给我一个大概的感觉，知道人们是如何访问这个网站的。然后我会进行下一步：辨认潜在的出问题的领域，继而知道我的用户体验建议将会着重在哪一块。\r\n\r\n总体来说，我会观察三种类型的参数来辨认问题所在：\r\n\r\n跳出和退出率（Bounce and exit rate）\r\n页面平均时间（Average time on page）\r\n目标价值（Page value）\r\n跳出和退出率（Bounce and Exit Rate）\r\n\r\n跳出率和退出率是两个可能造成混淆的参数。跳出率是只访问了网站的一个页面的用户的比例：在一个页面登陆，但是没有去访问任何其他页面就离开了网站。【译者注：谷歌官方解释为“跳出率指单页访问次数（即访问者从入口页离开网站而未与网页互动的访问次数）所占的百分比”。】退出率是从一个页面离开了网站的用户的比例（它包括了那些之前在该网站浏览了其他页面的人）。【译者注：谷歌官方解释为“退出百分比指从某个或某组特定网页退出网站的次数所占的百分比”。】\r\n\r\n编者注：术语可能有所不同，意思相近即可。给译者的细心点赞！\r\n\r\n\r\n\r\n如果我发现了网站的一部分出现了一个很高的跳出或者退出率，我会做上笔记，以防某些页面的什么东西造成了用户的离开。一个有着高跳出率的页面可能说明这个页面上的内容不是用户来到这个页面所期望看到的东西。一个高退出率的页面可能说明这个网页导致了用户在他们想要的流程中半途而废——从另一方面看，如果一个高退出率的页面是流程的最后一页，那么这个高退出率就不再是个问题了。\r\n\r\n用谷歌分析（Google Analytics）中的“加权排序（weighted sort）”会让跳出率更加有用。根据谷歌分析，“加权排序把百分比数据根据重要程度排列，而不是序号排列”。举个例子，一个页面虽然有着100%的跳出率，但在过去的一个月中，只有一个用户访问，然后离开了该页面（另外一个更大的问题可能是没有任何人访问过这个页面！）。如果一个页面有80%的跳出率，但是是一个在流程中非常关键的起始页面，那么这个网站可能因此流失了大量的生意。为了更好地为页面可用性测试做准备，我们必须辨认出问题出现的原因：是因为没有人访问这个页面，还是每个访问的人都马上离开了网站？\r\n\r\n页面平均时间（Average Time on Page）\r\n\r\n“页面平均时间”是指用户浏览某个页面所花费的平均时间。如果我发现有一个页面的“页面平均时间”很低，这可能意味着该页面没有引起用户足够的注意。从另一反面来看，如果用户在一个结账页面停留很久，那么可能是因为该页面过于复杂了。当然，所有的参数都必须放在具体的情境下分析；如果一个博客文章有一个很高的“页面平均时间”，那么总体来说是一个好的现象，因为这可能意味着用户真的在阅读整篇文章。\r\n\r\n另外一个衡量页面表现的非常好的方式是利用“与网站平均数比较”的选项。这个图会显示某些页面在某个参数上是不是在很大程度上高于或者低于平均值。虽然这些页面仍然需要一页一页地分析，因为不同的页面有用不同的目标，但是低于平均浏览时间的页面总体来说可能会有问题，假设目标是为了让用户继续阅读的话。下面的例子清晰地表现出“联系（contact）”页面相对来说有比平均值更低的浏览时间，然而“博客（blog）”页面有高于平均值80%的时间。\r\n\r\n\r\n\r\n再次强调下，情境是关键。用户可能来到联系页面来寻找一个公司的地址，或者联系电话。如果他们成功地找到了，那么他们就会离开该网站，因此较低的页面浏览时间在这里是一个好的现象，说明页面很有用。一个“博客”页面是用来吸引用户的注意的，因此一个高于平均值的时间可以被看做是一件好事。\r\n\r\n页面价值（Page value）\r\n\r\n“页面价值”是一个非常重要，但是很少被用到的参数，它可以用来发现表现欠佳的页面。目标价值，就如它的名字所示，是一种赋予页面直接的货币价值的方式。对于电子商务网站来说，它纳入了各种各样的交易收入总数和所有类型的网页的目标价值——这些参数都需要在谷歌分析中人工设置，才能计算出页面价值。一个高价值的页面往往显示出它是一个重要的页面，意味着该页面值得被纳入可用性测试中。\r\n\r\n一个高价值但是展示出高退出率的页面是值得重视和改进的。意味着这些页面让用户在回话流程的关键位置离开了。在下面的的例子中（一个电子商务网站），我突出显示了三个有着类似的页面价值的品类。可以清楚地看到，“个性化玩具（personalised-toys）”的产品页面有一个相当高的退出率。这说明这个高价值的页面正在让用户“流失”，并且应该在未来的用户体验设计工作中引起重视。\r\n\r\n\r\n\r\n然而，单独的某个页面只能展示部分真相。“内容分组（content grouping）”这个功能很重要，我们可以利用它来观察网站的某个部分表现如何。内容分组可以把数据根据用户访问的页面种类来进行分类，因此十分必要。我们可以用各种各样的方式来分组。比如对于一个买衣服的网站来说，可以根据不同种类的服饰来分组，看看裤子是不是比衬衫的页面价值要高。\r\n\r\n一旦发现某个页面或者某个组的页面价值很低，下一步我们要做的就是：找出背后的原因。在上面的例子中，衬衫相对来说有比较低的价值。我采取的第一步行动是，根据我的经验和判断力，看看在衬衫的页面上有没有任何明显的用户体验或者技术方面的问题。做完这个之后，我会和真实的用户一起来测试这些个页面，来看看为什么会有这些问题——并且寻找那些暗含了修复方式的线索。\r\n\r\n\r\n\r\n内容分组是一个非常强大的工具，可以让你看到网站的不同部分的真实表现。\r\n\r\n在实践中利用参数\r\n\r\n这只是利用数据分析来发现网站问题的第一步。在本系列的第二部分中，我们会着眼于如何发现用户流程中的流失点，以及如何把用户分类来看到更多的细节信息。\r\n\r\n与此同时，你尝试着利用在本篇文章中学到的方法来发现可能存在的问题：\r\n\r\n调出跳出率，找出那些用户访问并且马上离开了的页面。\r\n浏览所有页面的退出率，找出在流程的哪些地方用户离开了网站。\r\n考虑到用户在页面平均停留时间的重要性——一个拥有着高跳出率的博客页面，同时拥有着很长的平均页面时间，这是一件好事！\r\n根据页面价值排序，观察页面。页面价值越高，那么就越值得被纳入可用性测试，从而最终修复用户在该页面遇到的问题。','2017-06-21 07:17:33','2017-06-21 07:17:33',3,0,'http://www.qiocn.com/news/'),(10,'网站建设项目合同撰写注意点','../uploads/20160615110309_h21V52B.jpg','',1,'网站建设项目合同撰写注意点','网站建设合同是在网站建设项目中，企业（需要建网站方）和承建方（专业网站制作公司）之间共同确立的双方在项目中的权利，义务和合作内容的契约文件。本文就网站建设合同应该包含哪些主要内容，应该注意一些什么逐个做说明：\r\n        网站建设合同是在网站建设项目中，企业（需要建网站方）和承建方（专业网站制作公司）之间共同确立的双方在项目中的权利，义务和合作内容的契约文件。网站建设合同必须包含以下主要内容：\r\n        1）网站建设工作范围\r\n        2）网站建设工作流程与时间进度\r\n        3）网站建设质量要求\r\n        4）网站承建费用支付，支付标准与支付方式\r\n      下面就每一部分应该写明一些什么内容和注意一些什么点逐个做说明（合同其他部分如，违约形式与责任，合同附件里的《网站建设方案书》本文不作讨论）。\r\n         一、网站建设工作范围\r\n         网站建设项目涉及到的工作一般包括，需求调研与《网站建设方案书》制作，网站建设素材准备，网站页面设计与制作，网站功能性部分程序开发与页面融合，数据库设计与数据输入，服务器购买（软件和硬件）或服务器空间租用、服务器存放，域名注册与解析。\r\n          所先，在这些网站建设工作中，合同需要确定哪些是承建方的工作，哪些不是，哪些是企业或者第三方的工作，以及各方工作之间的合作方式和要求。\r\n         这里需要注意的是，如果企业在工作中需要和建设方或者第三方进行合作，那么必须清晰说明这种合作的流程，方式和要求。譬如，如果网站建设素材由企业提供，合同必须对企业提供的素材内容，时间，要求作出清晰的说明。\r\n         其次，对于承建方工作部分，必须细致地说明。\r\n例如，网站需要建设哪些栏目，每个栏目需要制作哪些内容，网站需要开发哪些功能性的程序（如BBS）等，对这些合同必须相当明确地作出说明。合同可以用建设方确认通过的《网站建设方案书》作为合同附录，来更详细阐明承建方的工作。\r\n        二、项目建设工作流程与时间进度\r\n网站建设流程一般流程为：需求调研，完成网站《网站建设方案书》，《方案书》确认，素材（文字，图片，数据）收集与整理，页面风格设计，风格设计确认，页面制作，程序开发，整合（页面，程序），建设方评估与测试，网站改进与建设方确认，服务器与域名准备，网站上传发布，网站维护。\r\n所先，合同必须说明项目开展的工作流程。\r\n         其次，对于每个工作流程，需要概要说明承建方的工作内容，尤其对于需要企业参与的部分，需要说明企业的工作内容和要求。例如，需求调研时企业的配合和资源提供；设计制作确认时的确认方式和确认范围。\r\n         最后，是对每个流程环节的完成时间要求说明。合同需要给出每个流程环节的工作估计以及项目最终完工的日期估计，双方可以根据需要，协商在进度限制上的严格度。\r\n        三、网站建设质量要求\r\n网站建设质量主要指网站页面设计，制作与网站程序的质量。合同需要对这些工作的质量作出周到的，尽量可度量的要求，譬如为保证浏览速度，建设方也可以对每个网页的大小作出一般性限制。\r\n         对于页面设计与制作，由于对设计风格的认识差异会导致建设方和承建方的质量评判结果不同，同时设计质量也难以度量，容易出现建设方多次否定设计的情况。在这个时候需要用变通的办法来弥合双方的质量评判差异。\r\n例如，可以由承建方设计出5种建设方要求风格的设计页面，然后由建设方选择，或者重复修正设计不能超过5次，而承建方可以以半价收取落选设计页面费用的代价来限制设计要求的变化。\r\n还有一种办法，就是采取第三方来度量页面设计与制作质量。例如，找一些普通的上网用户，测试他们成功搜索网站中某个特定内容所需要的时间，用这个时间来衡量网站连接设计质量和合理性。例如，可以通过在门户网站做网上调查，由网民来评判网站设计与制作质量，这样做同时也很好地宣传了网站。\r\n而对于网站功能性程序来说，合同应该对功能作出详细的说明。如会员注册登陆系统，那么除了会员的注册，登陆，退出外，系统还应该提供给会员什么功能，譬如新闻定制等。这部分可以在《网站建设方案书》里作出更详细的说明。\r\n如果，网站承建方同时提供虚拟主机空间，那么企业还可以对网站访问速度，宕机时间，网站带宽等方面作出要求（空间租用双方一般也可以另签《网站空间租用合同》）。\r\n四、网站承建费用支付，支付标准与支付方式\r\n网站建设业内一般采用按制作量记费的方式，譬如按页面数量记费。\r\n但网站制作量，如页面数量等，在制作过程中是变化的，所以在签合同的时候无法给出整个网站建设完成后的确切费用。但是合同却可以给出网站建设的收费项和收费标准，等网站建设完成后，统计整个网站的每项工作量，再结合记费标准来算出项目实际标的。\r\n所先，确定网站建设收费项。网站建设收费项一般可以包括以下一些：\r\n1）素材整理阶段的文字录入费，图片处理费，翻译费\r\n2）《网站建设方案书》制作费用\r\n3）普通页面制作费用\r\n4）页面风格设计费用（一般指主页和栏目首页）\r\n5）页面特效制作费用（譬如JavaScript，Flash等）\r\n6）功能性程序开发费用（如调查系统，会员注册系统等）\r\n7）数据库数据录入费用\r\n8）空间租用费用等。\r\n其次，确定每个收费项的单位价格。例如，文字翻译每千字50元等。\r\n这一条款关系到日后合同标的的计算，所以务必非常清晰，双方不妨多花一点时间来协商这里的细节，以达到彼此在这一条款上的一致认可，以妨日后引起不必要的争执。为了做到这一点，我认为原则就?quot;细\"。譬如，必须定义怎么算作一个页面，是1024下的800*600，还是800*800？如果是800*600，那么一个800*1200的页面就算做两页；这是一个协商的过程，这样计算是否合理，我觉得只要双方都同意这样计算就没有问题，关键是必须使得日后统计制作量和计算合同标的时双方没有歧义。\r\n费用支付一般可以分成三次进行。一般合同签署一周内支付一定数量，作为项目启动费用；项目中期支付一定数量；项目结束后，计算项目实际标的，再支付余额。\r\n如前面所说，作为网站建设项目的建设合同还需要其他很多条款和辅助合同，如：《空间租用合同》等，但是以上谈到四点却是合同里最重要，也是最需要\"细扣\"的内容，希望大家以后在撰写网站建设合同时能从中获得一点帮助。','2017-06-21 07:20:14','2017-06-21 07:20:14',3,1,'http://www.qiocn.com/news/'),(12,'纳米孔超级绝热材料','','',0,'','<p><a href=\"http://www.qiocn.com/\">纳米</a>孔超级绝热材料，保温技术行业的新革命&mdash;&mdash;气凝胶</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 特点：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &bull;&nbsp;纳米级材料（50nm）<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &bull;&nbsp;低导热系数（0.013W/(K&bull;m)）<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &bull;&nbsp;低密度（3kg/m3）<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &bull;&nbsp;高孔隙率（催化剂、吸附剂）<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &bull;&nbsp;低折射率<br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 二氧化硅气凝胶因其独特的结构，可有效阻止热量传输的三种方式：热对流、热辐射、热传导。<br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 气凝胶复合材料可很容易地安装在内墙上<br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 实际应用案例&mdash;&mdash;管道<br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一层6mm厚的气凝胶复合材料可使热水管的外围温度从86度降到30度<br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VIP真空绝热板（Vacuum Insulation Panel，VIP），被誉为&ldquo;太空级&rdquo;绝热板，它是将太空级纳米材料气相二氧化硅、增强纤维、添加助剂等用阻隔膜封装而成的内部保持真空状态的复合绝热制品。VIP真空绝热板用途广泛，可用于航空航天、交通、工业、建筑等领域，在墙体保温、冰箱、冷库、冷藏车、太阳能集热器等长期使用环境温度不超过100℃的家电、工业设备、建筑保温等领域广泛使用</p>','2017-06-29 09:59:09','2017-06-29 09:59:09',1,0,''),(14,'什么是玻璃隔热涂料？','','',0,'','<p>&nbsp; &nbsp;<a href=\"http://www.qiocn.com\">玻璃隔热涂料</a>是采用多种金属纳米粉体材料加工制备的一种涂料，其中所采用的纳米材料本身具有特殊的光学性能，即在红外光区、紫外光区有很高的阻隔率，在可见光区有很高的透过率。利用该材料的透明隔热特性，与环保型高性能树脂混合，经过特殊的加工工艺处理，制备出节能环保的隔热保温涂料。在不影响玻璃采光的前提下，夏季达到节能降温效果，冬季达到节能保温效果。<br />\r\n&nbsp; &nbsp;它的优点是：1.施工简单方便（易学、易上手）；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 2.隔热优势明显；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.紫外线隔绝率高；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4.隔音（15--20分贝）；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.价格优势明显（与传统隔热膜相比）；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6.膜层硬度高；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7.使用寿命长（10--20年）；<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8.关键优势：节能环保。</p>','2017-07-04 08:34:43','2017-07-04 08:34:43',1,0,''),(15,'什么是纳米漆？有何优点？','../uploads/新型水性纳米多功能底漆_bqq4NV0.gif','',0,'','<p>&nbsp;&nbsp;<a href=\"http://www.qiocn.com\">纳米漆</a>采用新型的纳米材料，纳米漆的性能属于乳胶漆中一个跨度，比一般乳胶漆在耐擦洗，抗污抗碱方面提升较大。纳米漆的特点有：无毒无害，防霉耐擦洗，施工方便，耐化学侵蚀。而且纳米漆作为一种纳米涂料又可湿涂，打破了建筑涂料要求湿度在10%以下的规定，使建筑行业施工缩短了工期，提高了功效，又创造出高质量，一举三得。由于纳米涂料采用纳米级单体浆料及纳米乳液、纳米色浆，纳米杀菌剂，纳米多功能助剂等系列纳米材料生产，与现有乳胶漆所用原料相比有无可比拟的超细性和独特性，启产品综合性能和质量大大优于其同类产品，且成本低于传统产品。<br />\r\n纳米漆与普通漆相比，具有的优点：<br />\r\n1、利用纳米材料的双疏机理，使涂层的水分有效的排出，并阻止外部水份的侵入，使涂膜具有呼吸的性能。<br />\r\n2、利用纳米材料的特殊功能和其微分子结构，与墙体的无机硅质和钙质发生配位反应，使墙体和涂膜形成牢固的爪状渗适，使涂膜不会脱落，不起皮，有高强的硬度和耐洗刷性。<br />\r\n3、利用纳米材料的超双界面的物性原理，有效的排出粉尘及油污的侵入，使墙体有良好的自洁功能。<br />\r\n4、利用纳米材料的光催化技术，对空气中的有害气体有高效的分解和消除作用，并能降低分解紫外线的辐射，使涂层的抗老化能力增强，具有净化空气的性能。<br />\r\n5、利用纳米材料的激活技术，使涂料形成抗菌涂层可对大肠杆菌、金黄色葡萄菌等细胞膜的破坏作用，从而有效地杀灭或抑制细菌的繁殖。<br />\r\n6、独特的环保性：常温下生产，无毒、无味、无污染、属于水溶性环保型。<br />\r\n7、极强的粘结性：对砂浆、混凝土、石材、石棉板、木材、金属等建筑材料有很强附着力。<br />\r\n8、优良的高耐候性：南、北方，高、低温均适用。在潮湿的基面上亦可施工，抗冻型可在零摄氏度到零下二十五摄氏度低温中施工、存放不变质。<br />\r\n9、由于纳米级粉体材料极细（已接近分子结构），很难分散（始终浮于水面上），所以，本院科研人员吸取国外经验，将其聚合制成纳米浆料单体，使涂料在生产中分散轻松自如，可吸收和折射uvc紫外线，使用寿命10-15年以上。<br />\r\n10、喷、刷、滚、涂等常规方法施工，每公斤可施工12-14平方米，两遍可施工6-8平方米。<br />\r\n11、可根据接产方当地的消费要求和生活水平，生产自洁型、耐污型、杀菌型、抗冻型、通用型内外墙纳米漆、产品按光洁度，有平光、哑光、高光型和数百种色彩。生产时采用常温常压，无废水，废气，废渣污染。</p>','2017-07-04 09:18:36','2017-07-04 09:18:36',1,0,''),(16,'防水隔热涂料使用寿命','','',0,'','<p>近段时间全国大部分区域都在降雨，特别是广东等强降水地区连日暴雨，出现内涝积水等情况，给人们出行带来不便。下雨一直是人们生活中的一部分，不但缓解夏季闷热带来清凉，也在生活中带来很多烦恼，就如夏季本来就很热遇到连天下雨，墙面屋顶出现漏水、渗水就更苦恼了，所以很多朋友选择在做防水隔热涂料来解决夏季闷热且又漏水的屋顶。那么，防水隔热涂料是否真能隔热和防水？防水隔热涂料使用寿命是多久呢？<br />\r\n防水隔热涂料是用在混凝土顶层楼房防水、保温、隔热的功能性建筑材料，根据防水涂料施工工艺施工，漆膜厚度符合建筑结构要求，在防水防渗的同时又能保证具有隔热、保温、耐固、抗老化等功能，是现在建筑平面楼顶常采用的防水隔热合一方式，可以最大限度的结余成本及施工。防水、隔热、性价高是消费者选择防水隔热涂料的主要因素。<br />\r\n防水隔热涂料施工简单，在楼顶基面涂刷规定的厚度，在覆盖一次水泥砂浆做保护，就可以达到永久使用的效果，也就是说只要保护的好，防水隔热涂料的使用寿命是永久的，和建筑的寿命是一致的，只要在楼顶做了防水隔热涂料就不用在担忧楼顶漏水、隔热的问题了。</p>','2017-07-18 09:15:18','2017-07-18 09:15:18',3,0,''),(17,'隔热保温涂料的发展','','',0,'','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 科学技术对生产的高度渗透和作用，已使科学技术成为现实的直接生产力。</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在节能传热上，<a href=\"http://www.qiocn.com/\">隔热保温材料</a>是能够有效阻止热量交换的材料成为隔热保温材料。隔热保温材料类型不同，导热系数不同。隔热保温材料的物质构成不同，其物理热性能也就不同，以及隔热保温材料隔热机理存有区别，其导热性能或导热系数也就各有差异。工业用保温隔热保温材料的导热系数往往更低一些，具体指标要求与行业领域和具体应用工况密切相关。经济的快速发展，节能快车发展要求，隔热保温材料提出更高的性能，隔热保温材料研发生产单位，对隔热保温材料的性能提升，做出很大贡献。</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 当今，全球隔热保温材料正朝着高效隔热、节能薄层、外保护一体化方向发展。根据航天飞行器传热机理，依据材料技术、化工技术、信息技术、生物工程技术、能源技术、纳米技术、环保技术、空间技术、计算机技术、海洋工程技术、工程与工艺、物流等现代高新技术及其产业整体配套支持，经历多少年的研究开发，成功研发出耐高温隔热保温涂料。此类型耐高温隔热保温涂料采用纳米空心陶瓷微珠具有高效的隔热保温材料精加工而成，涂料具有低导热系数,高效隔热，耐温高，防火阻燃、绝缘耐压、隔音环保新型划时代的隔热保温材料。</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 耐高温隔热保温涂料，采用全新的电磁屏蔽隔热和阻止热传导隔热先进技术，选用更加精细化工中极品材料。军用高科技隔热保温材料转为民用，耐高温隔热保温涂料能有效抑制各种传导热和辐射热，隔热保温抑制效率可达90%以上，可抑制高温物体和低温物体的热辐射和热量的传导散失，此款耐高温隔热保温涂料在1100℃的物体表面涂上8mm厚，物体表面的温度就能从1100℃就能降低到100℃以内。如此高效薄层的耐高温隔热涂料，已大量应用到航天、军工、冶金、电力、石化、交通等重要领域，其优异的性能在隔热保温材料以无法取代，对于涂刷材料的技术改进起到决定性的作用，节能性、稳定性、科技性前所未有，对于整个社会的发展而言，是真正的划时代的隔热保温材料，助企业的节能经济迈上新的台阶。</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>','2017-07-19 01:02:13','2017-07-19 01:02:13',1,0,''),(18,'玻璃隔热涂料','','',0,'','<p>&nbsp;&nbsp; <a href=\"http://www.qiocn.com/\">玻璃纳米隔热保温涂料</a>是采用功能纳米半导体材料与环保型高性能树脂，经过特殊工艺处理而成的绿色环保隔热保温涂料。该涂料具有特殊的光学特性，即对红外光具有很高的屏蔽率；对紫外光有很高的吸收率；对可见光有很高的透过率。在保持良好室内采光前提下，夏天可达到节能降温效果，冬天能达到节能保温效果，具有降低制冷、采暖负荷的功能。<br />\r\n适用范围<br />\r\n适用于建筑物玻璃门窗、玻璃幕墙、交通工具的玻璃窗和玻璃深加工等。<br />\r\n产品特点<br />\r\n1、隔热：夏天，施工前后的室内温差为5~10℃，降低空调能耗，节能达30%以上；<br />\r\n2、保温：冬天降低室内采暖负荷；<br />\r\n3、透明：可见光透过率达80%以上，不影响室内采光和视野；<br />\r\n4、抗紫外线：紫外线的阻隔率达90%以上，防止室内物品老化，以及紫外线对人体的伤害；<br />\r\n5、环保：涂膜不含苯、酮、醛类等VOC成分，不含重金属等有害物质，绿色环保，生态健康；<br />\r\n6、耐用：具有优良的耐磨性、抗刮伤性和耐候性，涂料使用寿命可长达10年以上；<br />\r\n7、安全：不燃烧，具有防爆裂功能；<br />\r\n8、隔音：能吸收声波，降低噪声5-15分贝，保持室内安静。</p>','2017-07-19 01:06:12','2017-07-19 01:06:12',1,0,'');
/*!40000 ALTER TABLE `news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_newscategory`
--

DROP TABLE IF EXISTS `news_newscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_newscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `parent_cate_id` int(11),
  PRIMARY KEY (`id`),
  KEY `news_newscategory_1582e776` (`parent_cate_id`),
  CONSTRAINT `news_newscategory_parent_cate_id_d912ac4a_fk_dphome_menus_id` FOREIGN KEY (`parent_cate_id`) REFERENCES `dphome_menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_newscategory`
--

LOCK TABLES `news_newscategory` WRITE;
/*!40000 ALTER TABLE `news_newscategory` DISABLE KEYS */;
INSERT INTO `news_newscategory` VALUES (1,'公司动态','gsdt',6),(3,'行业动态','hydt',6);
/*!40000 ALTER TABLE `news_newscategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_cases`
--

DROP TABLE IF EXISTS `products_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `if_recommend` tinyint(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `desc` longtext,
  `content` longtext,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_cases_b583a629` (`category_id`),
  CONSTRAINT `products_cases_category_id_f30faacd_fk_products_casescategory_id` FOREIGN KEY (`category_id`) REFERENCES `products_casescategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_cases`
--

LOCK TABLES `products_cases` WRITE;
/*!40000 ALTER TABLE `products_cases` DISABLE KEYS */;
INSERT INTO `products_cases` VALUES (7,'纳米材料生产厂房','../uploads/1_RPjF4jo.jpg','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718080759_1.jpg\" style=\"height:434px; width:650px\" /></p>','2017-07-18 08:08:11','2017-07-18 08:08:11',6),(8,'纳米保温材料对接','../uploads/纳米保温材料对接.jpeg','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718081126_纳米保温材料对接.jpeg\" style=\"height:386px; width:500px\" /></p>','2017-07-18 08:11:33','2017-07-18 08:11:33',7),(9,'纳米保温材料施工','../uploads/纳米保温材料施工.jpg','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718081154_纳米保温材料施工.jpg\" style=\"height:378px; width:600px\" /></p>','2017-07-18 08:11:59','2017-07-18 08:11:59',7),(10,'纳米保温材料施工','../uploads/纳米保温材料施工1.jpg','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718081222_纳米保温材料施工1.jpg\" style=\"height:517px; width:690px\" /></p>','2017-07-18 08:12:36','2017-07-18 08:12:36',7),(11,'纳米保温材料','../uploads/QQ截图20170718163005.png','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718083040_QQ截图20170718163005.png\" style=\"height:418px; width:455px\" /></p>','2017-07-18 08:30:50','2017-07-18 08:30:50',6),(12,'纳米保温材料施工案例','../uploads/纳米保温材料施工现场.jpg','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718083400_纳米保温材料施工现场.jpg\" style=\"height:437px; width:732px\" /></p>','2017-07-18 08:34:06','2017-07-18 08:34:06',5),(13,'纳米保温材料施工案例','../uploads/纳米保温材料施工1_nmDwjqc.jpg','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718083426_纳米保温材料施工1.jpg\" style=\"height:517px; width:690px\" /></p>','2017-07-18 08:34:41','2017-07-18 08:34:41',5),(14,'纳米保温材料施工案例','../uploads/纳米保温材料施工案例.JPG','',0,'','','<p><img alt=\"\" src=\"/static/uploads/20170718083503_纳米保温材料施工案例.JPG\" style=\"height:539px; width:960px\" /></p>','2017-07-18 08:35:08','2017-07-18 08:35:08',5);
/*!40000 ALTER TABLE `products_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_casescategory`
--

DROP TABLE IF EXISTS `products_casescategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_casescategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `parent_cate_id` int(11),
  PRIMARY KEY (`id`),
  KEY `products_casescategory_1582e776` (`parent_cate_id`),
  CONSTRAINT `products_casescategor_parent_cate_id_29d2cb3d_fk_dphome_menus_id` FOREIGN KEY (`parent_cate_id`) REFERENCES `dphome_menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_casescategory`
--

LOCK TABLES `products_casescategory` WRITE;
/*!40000 ALTER TABLE `products_casescategory` DISABLE KEYS */;
INSERT INTO `products_casescategory` VALUES (5,'施工案例','sgal',3),(6,'施工前后','sgqh',3),(7,'施工工程','sggc',3);
/*!40000 ALTER TABLE `products_casescategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_products`
--

DROP TABLE IF EXISTS `products_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `desc` longtext,
  `content` longtext,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_index` tinyint(1) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `application` varchar(128),
  `brand` varchar(128),
  `model` varchar(128),
  `price` varchar(128),
  `spec` varchar(128),
  PRIMARY KEY (`id`),
  KEY `products_products_b583a629` (`category_id`),
  CONSTRAINT `products_pr_category_id_0cfaa6ce_fk_products_productscategory_id` FOREIGN KEY (`category_id`) REFERENCES `products_productscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_products`
--

LOCK TABLES `products_products` WRITE;
/*!40000 ALTER TABLE `products_products` DISABLE KEYS */;
INSERT INTO `products_products` VALUES (5,'新型水性纳米多功能底漆','../uploads/新型水性纳米多功能底漆.gif','','http://www.qiocn.com/supply/','新型水性纳米多功能底漆\r\n产品介绍：\r\n以环氧树脂乳液和优质助剂通过纳米技术研制而成。在混凝土、金属等基面使用时具有极佳的渗透力、抗碱性和封闭性能，有效防止基面的水份和碱性析出造成漆膜脱落。\r\n产品特点：\r\n（1）具有优异的渗透力和粘结力\r\n（2）封闭性能优异，可有效的防止墙体碱性物质的渗透和析出，与漆面粘结好，有效延长面漆的使用寿命。','<p><img alt=\"\" src=\"/static/uploads/20170718071017_新型水性纳米太阳热反射材料.gif\" style=\"height:784px; width:1000px\" /></p>\r\n\r\n<p>新型水性纳米多功能底漆 产品介绍： 以环氧树脂乳液和优质助剂通过纳米技术研制而成。在混凝土、金属等基面使用时具有极佳的渗透力、抗碱性和封闭性能，有效防止基面的水份和碱性析出造成漆膜脱落。 产品特点： （1）具有优异的渗透力和粘结力 （2）封闭性能优异，可有效的防止墙体碱性物质的渗透和析出，与漆面粘结好，有效延长面漆的使用寿命。</p>','2017-06-21 08:03:30','2017-06-21 08:03:30',7,0,0,'新型水性纳米多功能底漆','','','',''),(7,'新型水性纳米保温隔热材料','../uploads/新型水性纳米保温隔热材料_bHEEiDj.jpg','','http://www.qiocn.com/supply/','新型水性纳米保温隔热材料\r\n产品介绍：\r\n成膜基料为高性能树脂乳液，以纳米材料和空心玻璃微珠等为保温隔热材料，水为溶剂，经特殊工艺合成的高性能的保温隔热材料。在被涂物表面形成一层致密的真空层，可有效的阻隔太阳光辐射热和空气中热辐射的传导，减少被涂物的内部和外部的热量交换。\r\n产品特点：\r\n（1）隔热、防晒、保温效果好，节能效果明显。\r\n（2）具有储热保温功能。','<p><img alt=\"\" src=\"/static/uploads/20170718071142_新型水性纳米太阳热反射材料.gif\" style=\"height:784px; width:1000px\" /></p>\r\n\r\n<p>新型水性纳米保温隔热材料 产品介绍： 成膜基料为高性能树脂乳液，以纳米材料和空心玻璃微珠等为保温隔热材料，水为溶剂，经特殊工艺合成的高性能的保温隔热材料。在被涂物表面形成一层致密的真空层，可有效的阻隔太阳光辐射热和空气中热辐射的传导，减少被涂物的内部和外部的热量交换。 产品特点： （1）隔热、防晒、保温效果好，节能效果明显。 （2）具有储热保温功能。</p>','2017-06-21 08:09:01','2017-06-21 08:09:01',7,0,0,'新型水性纳米保温隔热材料','','','',''),(9,'新型水性纳米太阳热反射材料','../uploads/新型水性纳米太阳热反射材料_lVO8ZKR.gif','','','','<p>新型水性纳米太阳热反射材料<br />\r\n产品介绍：<br />\r\n产品是由改性高弹性纯丙乳液、空心玻璃微珠、金红石型钛白粉及纳米多孔SiO2等材料制成。具有优良的反射隔热效果，可涂覆在混凝土、金属等各种基材上，达到节能降耗的目的。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/20170718072915_sxq.jpg\" style=\"height:510px; width:650px\" /><br />\r\n产品特点：<br />\r\n（1）优异的反射隔热性能，产品具有良好反射率和发射率，可以大大降低太阳辐射吸收系数P值，增加当量热阻附加值。该产品属弹性材料，涂层膜具有弹性功能，热胀冷缩不开裂。<br />\r\n（2）优异的耐候性及保色性。<br />\r\n（3）优异的抗碱功能。<br />\r\n（4）优异的抗沾污性能，漆面可洗刷，清洗维护简单。<br />\r\n（5）环保：产品为水性，超低VOC，不添加镉、铅、铬等有害物质，是一种绿色低碳环保产品。<br />\r\n（6）兼具防水功能，产品符合聚合物乳液建筑防水涂料中II类产品的规定。<br />\r\n&nbsp;</p>','2017-07-18 06:58:35','2017-07-18 06:58:35',7,0,0,'','','','',''),(10,'纳米材料','../uploads/QQ截图20170718153156.png','','','','<p><img alt=\"\" src=\"/static/uploads/20170718073248_u=3951231424,1721365118&amp;fm=214&amp;gp=0.jpg\" style=\"height:300px; width:750px\" /></p>','2017-07-18 07:32:53','2017-07-18 07:32:53',3,0,0,'','','','',''),(11,'纳米材料','../uploads/纳米材料.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718074500_纳米材料.jpg\" style=\"height:221px; width:310px\" /></p>','2017-07-18 07:45:04','2017-07-18 07:45:04',3,0,0,'','','','',''),(12,'纳米材料','../uploads/纳米材料1.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718074529_纳米材料1.jpg\" style=\"height:223px; width:321px\" /></p>','2017-07-18 07:45:17','2017-07-18 07:45:17',3,0,0,'','','','',''),(13,'水性纳米漆','../uploads/水性纳米漆.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718074816_水性纳米漆.jpg\" style=\"height:600px; width:800px\" /></p>','2017-07-18 07:48:20','2017-07-18 07:48:20',7,0,0,'','','','',''),(14,'水性纳米漆','../uploads/水性纳米漆2.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718074840_水性纳米漆2.jpg\" style=\"height:733px; width:650px\" /></p>','2017-07-18 07:48:52','2017-07-18 07:48:52',7,0,0,'','','','',''),(15,'水性纳米漆','../uploads/水性纳米漆1.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718074914_水性纳米漆1.jpg\" style=\"height:487px; width:650px\" /></p>','2017-07-18 07:49:31','2017-07-18 07:49:31',7,0,0,'','','','',''),(16,'新型水性纳米','../uploads/201203171131489354034.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718075354_201203171131489354034.jpg\" style=\"height:375px; width:500px\" /></p>','2017-07-18 07:53:59','2017-07-18 07:53:59',6,0,0,'','','','',''),(17,'新型水性纳米','../uploads/新型水性纳米.jpeg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718075436_新型水性纳米.jpeg\" style=\"height:325px; width:489px\" /></p>','2017-07-18 07:54:41','2017-07-18 07:54:41',7,0,0,'','','','',''),(18,'新型水性纳米','../uploads/新型水性纳米1.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718075518_新型水性纳米1.jpg\" style=\"height:413px; width:500px\" /></p>','2017-07-18 07:55:22','2017-07-18 07:55:22',6,0,0,'','','','',''),(19,'新型水性纳米','../uploads/新型水性纳米2.jpg','','','','<p><img alt=\"\" src=\"/static/uploads/20170718075540_新型水性纳米2.jpg\" style=\"height:514px; width:446px\" /></p>','2017-07-18 07:55:43','2017-07-18 07:55:43',6,0,0,'','','','','');
/*!40000 ALTER TABLE `products_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productscategory`
--

DROP TABLE IF EXISTS `products_productscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_productscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `parent_cate_id` int(11),
  PRIMARY KEY (`id`),
  KEY `products_productscategory_1582e776` (`parent_cate_id`),
  CONSTRAINT `products_productscate_parent_cate_id_5e942160_fk_dphome_menus_id` FOREIGN KEY (`parent_cate_id`) REFERENCES `dphome_menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productscategory`
--

LOCK TABLES `products_productscategory` WRITE;
/*!40000 ALTER TABLE `products_productscategory` DISABLE KEYS */;
INSERT INTO `products_productscategory` VALUES (3,'纳米材料','nmcl',5),(6,'新型水性纳米','xinxing',5),(7,'水性纳米漆','shuixing',5),(8,'纳米保温材料','baowen',5);
/*!40000 ALTER TABLE `products_productscategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_hotkeywords`
--

DROP TABLE IF EXISTS `seo_hotkeywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_hotkeywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_hotkeywords`
--

LOCK TABLES `seo_hotkeywords` WRITE;
/*!40000 ALTER TABLE `seo_hotkeywords` DISABLE KEYS */;
INSERT INTO `seo_hotkeywords` VALUES (1,'彩钢板','http://www.cggjggc.com/'),(2,'彩钢厂','http://www.cggjggc.com/'),(3,'彩钢房','http://www.cggjggc.com/');
/*!40000 ALTER TABLE `seo_hotkeywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_longtailkeywords`
--

DROP TABLE IF EXISTS `seo_longtailkeywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_longtailkeywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cities` varchar(255) NOT NULL,
  `suffix` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_longtailkeywords`
--

LOCK TABLES `seo_longtailkeywords` WRITE;
/*!40000 ALTER TABLE `seo_longtailkeywords` DISABLE KEYS */;
INSERT INTO `seo_longtailkeywords` VALUES (1,'北京,河北,天津,山东,上海','公司,批发,生产');
/*!40000 ALTER TABLE `seo_longtailkeywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_robots`
--

DROP TABLE IF EXISTS `seo_robots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_robots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_robots`
--

LOCK TABLES `seo_robots` WRITE;
/*!40000 ALTER TABLE `seo_robots` DISABLE KEYS */;
INSERT INTO `seo_robots` VALUES (1,'Allow: *\r\nAllow: http://www.qiocn.com/');
/*!40000 ALTER TABLE `seo_robots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_sitekey`
--

DROP TABLE IF EXISTS `seo_sitekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_sitekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_sitekey`
--

LOCK TABLES `seo_sitekey` WRITE;
/*!40000 ALTER TABLE `seo_sitekey` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_sitekey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-19 23:04:49
