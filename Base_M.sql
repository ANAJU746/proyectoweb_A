-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para canaco
CREATE DATABASE IF NOT EXISTS `canaco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `canaco`;

-- Volcando estructura para tabla canaco.archivo
CREATE TABLE IF NOT EXISTS `archivo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `nombre_temporal` varchar(255) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `tamano` int(10) unsigned NOT NULL CHECK (`tamano` >= 0),
  `createdat` datetime(6) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `archivo_fk_user_id_fc89ca57_fk_auth_user_id` (`fk_user_id`),
  CONSTRAINT `archivo_fk_user_id_fc89ca57_fk_auth_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.archivo: ~9 rows (aproximadamente)
INSERT INTO `archivo` (`id`, `nombre`, `nombre_temporal`, `ruta`, `tipo`, `tamano`, `createdat`, `fk_user_id`) VALUES
	(1, 'Captura de pantalla 2026-03-02 193306.png', 'uploads/Captura de pantalla 2026-03-02 193306.png', 'uploads/Captura de pantalla 2026-03-02 193306.png', 'image/png', 4413, '2026-10-08 00:03:15.320067', 1),
	(2, 'Captura de pantalla 2026-10-07 180324.png', 'uploads/Captura de pantalla 2026-10-07 180324.png', 'uploads/Captura de pantalla 2026-10-07 180324.png', 'image/png', 26930, '2026-10-08 00:31:27.053086', 1),
	(3, 'Captura de pantalla 2026-09-02 195016.png', 'uploads/Captura de pantalla 2026-09-02 195016.png', 'uploads/Captura de pantalla 2026-09-02 195016.png', 'image/png', 28789, '2026-10-08 00:31:27.058929', 1),
	(4, 'image.avif', 'uploads/image.avif', 'uploads/image.avif', 'image/avif', 48953, '2026-10-14 01:25:39.374399', 1),
	(5, 'images (2).jpg', 'uploads/images (2).jpg', 'uploads/images (2).jpg', 'image/jpeg', 32743, '2026-10-14 01:25:39.385819', 1),
	(6, 'd1be2f57-bf3c-3721-a1a6-bba984c1a408.webp', 'uploads/d1be2f57-bf3c-3721-a1a6-bba984c1a408.webp', 'uploads/d1be2f57-bf3c-3721-a1a6-bba984c1a408.webp', 'image/webp', 16222, '2026-10-14 01:34:13.636196', 1),
	(7, 'images (4).jpg', 'uploads/images (4).jpg', 'uploads/images (4).jpg', 'image/jpeg', 27360, '2026-10-14 01:34:13.653365', 1),
	(8, 'd1be2f57-bf3c-3721-a1a6-bba984c1a408.webp', 'uploads/d1be2f57-bf3c-3721-a1a6-bba984c1a408_zQcVAgB.webp', 'uploads/d1be2f57-bf3c-3721-a1a6-bba984c1a408_zQcVAgB.webp', 'image/webp', 16222, '2026-10-14 01:34:13.668785', 1),
	(9, 'images (5).jpg', 'uploads/images (5).jpg', 'uploads/images (5).jpg', 'image/jpeg', 13086, '2026-10-14 01:34:13.696404', 1);

-- Volcando estructura para tabla canaco.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla canaco.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla canaco.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.auth_permission: ~48 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add archivo', 7, 'add_archivo'),
	(26, 'Can change archivo', 7, 'change_archivo'),
	(27, 'Can delete archivo', 7, 'delete_archivo'),
	(28, 'Can view archivo', 7, 'view_archivo'),
	(29, 'Can add categoria', 8, 'add_categoria'),
	(30, 'Can change categoria', 8, 'change_categoria'),
	(31, 'Can delete categoria', 8, 'delete_categoria'),
	(32, 'Can view categoria', 8, 'view_categoria'),
	(33, 'Can add publicacion', 9, 'add_publicacion'),
	(34, 'Can change publicacion', 9, 'change_publicacion'),
	(35, 'Can delete publicacion', 9, 'delete_publicacion'),
	(36, 'Can view publicacion', 9, 'view_publicacion'),
	(37, 'Can add perfil', 10, 'add_perfil'),
	(38, 'Can change perfil', 10, 'change_perfil'),
	(39, 'Can delete perfil', 10, 'delete_perfil'),
	(40, 'Can view perfil', 10, 'view_perfil'),
	(41, 'Can add galeria publicacion', 11, 'add_galeriapublicacion'),
	(42, 'Can change galeria publicacion', 11, 'change_galeriapublicacion'),
	(43, 'Can delete galeria publicacion', 11, 'delete_galeriapublicacion'),
	(44, 'Can view galeria publicacion', 11, 'view_galeriapublicacion'),
	(45, 'Can add comentario', 12, 'add_comentario'),
	(46, 'Can change comentario', 12, 'change_comentario'),
	(47, 'Can delete comentario', 12, 'delete_comentario'),
	(48, 'Can view comentario', 12, 'view_comentario');

-- Volcando estructura para tabla canaco.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.auth_user: ~4 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$600000$gSzwYOCfZdgWqjj5B2DWG4$nsOYT9zA3zY4lTcJKkYNO9Snrfbr4vZK/jeS+ONnzOE=', '2026-10-08 00:33:36.464480', 1, 'superadmin', 'Ana Josefina', '', 'superadmin@gmail.com', 1, 1, '2026-10-03 19:14:53.006626'),
	(2, 'pbkdf2_sha256$600000$TMcCUElZ5Fx3hysxdVAAmy$q+0wdzhyRCR7REpWSsWklGdRTdnhudUxrc2Q71QsMJ4=', NULL, 0, 'Ana1', 'Ana Josefina', 'Camacho Torres', 'ana1@gmail.com', 1, 1, '2026-10-08 00:21:49.821770'),
	(3, 'pbkdf2_sha256$600000$IwMRgnGFtnWDqc0r5BSIgD$yrnrgh2JNCHF8/umo+wYvjPC3ebOPFtbKz2E5C23aqs=', NULL, 0, 'Ana2', 'Ana Camacho', 'Torres Camacho', 'Ana2@gmail.com', 0, 1, '2026-10-08 00:24:02.520386'),
	(4, 'pbkdf2_sha256$600000$9uIDxAT8crBcicTga2CRev$jhHPhj/AP7I4X39C8A054iOcV4cXsoXL4rdshONRkRo=', '2026-10-08 00:33:18.582079', 0, 'Ana3', 'Ana', 'Camacho Torres', 'ana3@gmail.com', 0, 1, '2026-10-08 00:24:42.118300');

-- Volcando estructura para tabla canaco.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.auth_user_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla canaco.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.auth_user_user_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla canaco.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `createdat` datetime(6) NOT NULL,
  `updatedat` datetime(6) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_fk_user_id_4ced16d2_fk_auth_user_id` (`fk_user_id`),
  CONSTRAINT `categoria_fk_user_id_4ced16d2_fk_auth_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.categoria: ~0 rows (aproximadamente)
INSERT INTO `categoria` (`id`, `nombre`, `createdat`, `updatedat`, `fk_user_id`) VALUES
	(1, 'Ultima Hora', '2026-10-08 00:15:28.180445', NULL, 1);

-- Volcando estructura para tabla canaco.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contenido` longtext NOT NULL,
  `estado` varchar(20) NOT NULL,
  `createdat` datetime(6) NOT NULL,
  `updatedat` datetime(6) NOT NULL,
  `publicacion_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_publicacion_id_17eead35_fk_publicacion_id` (`publicacion_id`),
  KEY `comentario_user_id_a50ac53c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comentario_publicacion_id_17eead35_fk_publicacion_id` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`),
  CONSTRAINT `comentario_user_id_a50ac53c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.comentario: ~0 rows (aproximadamente)
INSERT INTO `comentario` (`id`, `contenido`, `estado`, `createdat`, `updatedat`, `publicacion_id`, `user_id`) VALUES
	(1, 'Muy interesante.', 'aprobado', '2026-10-08 00:32:08.478073', '2026-10-08 00:33:05.240764', 1, 4);

-- Volcando estructura para tabla canaco.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.django_admin_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla canaco.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.django_content_type: ~12 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'permission'),
	(3, 'auth', 'group'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'home', 'archivo'),
	(8, 'home', 'categoria'),
	(9, 'home', 'publicacion'),
	(10, 'home', 'perfil'),
	(11, 'home', 'galeriapublicacion'),
	(12, 'home', 'comentario');

-- Volcando estructura para tabla canaco.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.django_migrations: ~19 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2026-10-03 19:10:19.707977'),
	(2, 'auth', '0001_initial', '2026-10-03 19:10:20.074578'),
	(3, 'admin', '0001_initial', '2026-10-03 19:10:20.151837'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2026-10-03 19:10:20.156988'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-10-03 19:10:20.165630'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2026-10-03 19:10:20.208369'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2026-10-03 19:10:20.244834'),
	(8, 'auth', '0003_alter_user_email_max_length', '2026-10-03 19:10:20.254929'),
	(9, 'auth', '0004_alter_user_username_opts', '2026-10-03 19:10:20.261504'),
	(10, 'auth', '0005_alter_user_last_login_null', '2026-10-03 19:10:20.293293'),
	(11, 'auth', '0006_require_contenttypes_0002', '2026-10-03 19:10:20.295173'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2026-10-03 19:10:20.300616'),
	(13, 'auth', '0008_alter_user_username_max_length', '2026-10-03 19:10:20.309750'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2026-10-03 19:10:20.319681'),
	(15, 'auth', '0010_alter_group_name_max_length', '2026-10-03 19:10:20.329477'),
	(16, 'auth', '0011_update_proxy_permissions', '2026-10-03 19:10:20.335375'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2026-10-03 19:10:20.345119'),
	(18, 'home', '0001_initial', '2026-10-03 19:10:20.832374'),
	(19, 'sessions', '0001_initial', '2026-10-03 19:10:20.854795');

-- Volcando estructura para tabla canaco.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.django_session: ~2 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('80jwsies3iu368yd5joc58uw0th0wwxb', '.eJxVjMsOwiAURP-FtSEUEKhL935Dc19I1UDSx8r477ZJF7qcOWfmrQZYlzKss0zDyOqiOnX67RDoKXUH_IB6b5paXaYR9a7og8761lhe18P9Oygwl23to8W-yykyhpxNYG8cGOgpW44EIEEiRjEBk8tClJzZAnlme2byqD5fAtQ5HA:1xD5vl:fWT2jNIsDgm8PuGrS4O943YD4AVxtAvn7Vaa9YspGso', '2026-10-17 20:02:01.494888'),
	('vzfyvrltj2xg0hao51ayi56nrhbfitd3', '.eJxVjMsOwiAURP-FtSEUEKhL935Dc19I1UDSx8r477ZJF7qcOWfmrQZYlzKss0zDyOqiOnX67RDoKXUH_IB6b5paXaYR9a7og8761lhe18P9Oygwl23to8W-yykyhpxNYG8cGOgpW44EIEEiRjEBk8tClJzZAnlme2byqD5fAtQ5HA:1xEc4m:OqT610SxLbDkJmZmm9PH15DNFTI06fhJTaoqL5_KGhQ', '2026-10-22 00:33:36.467197');

-- Volcando estructura para tabla canaco.galeria_publicacion
CREATE TABLE IF NOT EXISTS `galeria_publicacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdat` datetime(6) NOT NULL,
  `archivo_id` bigint(20) NOT NULL,
  `publicacion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `galeria_publicacion_archivo_id_db8fd022_fk_archivo_id` (`archivo_id`),
  KEY `galeria_publicacion_publicacion_id_dc6a52a6_fk_publicacion_id` (`publicacion_id`),
  CONSTRAINT `galeria_publicacion_archivo_id_db8fd022_fk_archivo_id` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`),
  CONSTRAINT `galeria_publicacion_publicacion_id_dc6a52a6_fk_publicacion_id` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.galeria_publicacion: ~5 rows (aproximadamente)
INSERT INTO `galeria_publicacion` (`id`, `createdat`, `archivo_id`, `publicacion_id`) VALUES
	(1, '2026-10-08 00:31:27.064064', 3, 1),
	(2, '2026-10-14 01:25:39.389844', 5, 1),
	(3, '2026-10-14 01:34:13.664347', 7, 2),
	(4, '2026-10-14 01:34:13.684819', 8, 2),
	(5, '2026-10-14 01:34:13.697932', 9, 2);

-- Volcando estructura para tabla canaco.home_perfil
CREATE TABLE IF NOT EXISTS `home_perfil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido_paterno` varchar(80) NOT NULL,
  `apellido_materno` varchar(80) NOT NULL,
  `foto_perfil_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `home_perfil_foto_perfil_id_643a7dbf_fk_archivo_id` (`foto_perfil_id`),
  CONSTRAINT `home_perfil_foto_perfil_id_643a7dbf_fk_archivo_id` FOREIGN KEY (`foto_perfil_id`) REFERENCES `archivo` (`id`),
  CONSTRAINT `home_perfil_user_id_046b9c19_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.home_perfil: ~4 rows (aproximadamente)
INSERT INTO `home_perfil` (`id`, `apellido_paterno`, `apellido_materno`, `foto_perfil_id`, `user_id`) VALUES
	(1, '', '', 1, 1),
	(2, 'Camacho', 'Torres', NULL, 2),
	(3, 'Torres', 'Camacho', NULL, 3),
	(4, 'Camacho', 'Torres', NULL, 4);

-- Volcando estructura para tabla canaco.publicacion
CREATE TABLE IF NOT EXISTS `publicacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(180) NOT NULL,
  `resumen` longtext NOT NULL,
  `contenido` longtext NOT NULL,
  `estado` varchar(20) NOT NULL,
  `visitas` int(10) unsigned NOT NULL CHECK (`visitas` >= 0),
  `createdat` datetime(6) NOT NULL,
  `updatedat` datetime(6) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `categoria_id` bigint(20) DEFAULT NULL,
  `imagen_portada_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publicacion_autor_id_de0e71ad_fk_auth_user_id` (`autor_id`),
  KEY `publicacion_categoria_id_90b47ad9_fk_categoria_id` (`categoria_id`),
  KEY `publicacion_imagen_portada_id_72ac722d_fk_archivo_id` (`imagen_portada_id`),
  CONSTRAINT `publicacion_autor_id_de0e71ad_fk_auth_user_id` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `publicacion_categoria_id_90b47ad9_fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `publicacion_imagen_portada_id_72ac722d_fk_archivo_id` FOREIGN KEY (`imagen_portada_id`) REFERENCES `archivo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla canaco.publicacion: ~2 rows (aproximadamente)
INSERT INTO `publicacion` (`id`, `titulo`, `resumen`, `contenido`, `estado`, `visitas`, `createdat`, `updatedat`, `autor_id`, `categoria_id`, `imagen_portada_id`) VALUES
	(1, 'Presentan una nueva bacteria de estado sólido capaz de cargarse en cinco minutos', 'Un equipo de ingenieros ha desarrollado un prototipo que promete duplicar la autonomía de los teléfonos inteligentes y vehículos eléctricos sin riesgo de sobrecalentamiento.', '<p>El avance utiliza materiales cerámicos de alta conductividad que reemplazan a los electrolitos líquidos tradicionales. Según las primeras pruebas de laboratorio, la batería mantiene el 90% de su capacidad total después de más de 2,000 ciclos de carga. Se espera que la producción comercial comience a finales del próximo año.</p>', 'publicado', 8, '2026-10-08 00:31:27.046841', '2026-10-14 01:42:03.680849', 1, 1, 4),
	(2, 'Telescopio espacial detecta vapor de agua en la atmósfera de un exoplaneta rocoso', 'El planeta, ubicado a 45 años luz de la Tierra, orbita dentro de la zona habitable de su estrella y presenta temperaturas similares a las terrestres.', '<p>Astrónomos internacionales confirmaron el hallazgo tras analizar la luz estelar filtrada a través de la atmósfera del planeta, denominado GJ-402b. Aunque la presencia de agua en estado gaseoso no confirma la existencia de vida, convierte a este cuerpo celeste en el principal candidato para futuras misiones de observación profunda.</p>', 'publicado', 1, '2026-10-14 01:34:13.631049', '2026-10-14 01:37:57.561292', 1, 1, 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
