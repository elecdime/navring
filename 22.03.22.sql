-- --------------------------------------------------------
-- 호스트:                          localhost
-- 서버 버전:                        10.7.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `test`;

-- 테이블 test.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.admin:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT IGNORE INTO `admin` (`id`, `password`) VALUES
	('nabring', 'dmddo');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 test.cal 구조 내보내기
CREATE TABLE IF NOT EXISTS `cal` (
  `IDX` decimal(20,0) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `STARTDATE` datetime(6) DEFAULT current_timestamp(6),
  `CATECODE` bigint(20) DEFAULT 0,
  `LEADER_ID` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.cal:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cal` DISABLE KEYS */;
/*!40000 ALTER TABLE `cal` ENABLE KEYS */;

-- 테이블 test.calendar 구조 내보내기
CREATE TABLE IF NOT EXISTS `calendar` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `GROUPID` double DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `WRITER` varchar(50) DEFAULT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `START1` datetime DEFAULT NULL,
  `END1` datetime DEFAULT NULL,
  `ALLDAY` tinyint(4) DEFAULT 1,
  `TEXTCOLOR` varchar(50) DEFAULT 'yellow',
  `BACKGROUNDCOLOR` varchar(50) DEFAULT 'navy',
  `BORDERCOLOR` varchar(50) DEFAULT 'navy',
  `USERNAME` varchar(100) DEFAULT NULL,
  `LEADER_ID` varchar(100) DEFAULT NULL,
  `CATECODE` varchar(50) DEFAULT NULL,
  `CATEMAX` int(5) DEFAULT NULL,
  `CATEMIN` int(5) DEFAULT 1,
  `userid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.calendar:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT IGNORE INTO `calendar` (`ID`, `GROUPID`, `TITLE`, `WRITER`, `CONTENT`, `START1`, `END1`, `ALLDAY`, `TEXTCOLOR`, `BACKGROUNDCOLOR`, `BORDERCOLOR`, `USERNAME`, `LEADER_ID`, `CATECODE`, `CATEMAX`, `CATEMIN`, `userid`) VALUES
	(38, NULL, '토벌전', '한다임/1,550.00/스카우터', 'ㄱㄱ', '2022-03-21 16:15:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, '한다임/1,550.010/스카우터', '101', 100, 2, '352356236'),
	(39, NULL, 'ㅁㄴㄹ', '한다임/1,550.00/스카우터', 'ㅁㄴㅇㄹ', '2022-03-21 16:20:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, '한다임/1,550.00/스카우터', '101', 100, 2, '1234'),
	(40, NULL, '테스트1', '한다임/1,550.00/스카우터', 'ㅁㄴㄻㄹㅁㅇㄴㄹ', '2022-03-21 19:18:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, 'asfsafas', '202', 8, 5, '267430837207826444'),
	(41, NULL, '테스트2', '한다임/1,550.00/스카우터', '346436', '2022-03-21 18:28:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, '한다임/1,550.00/스카우터', '101', 100, 2, '267430837207826444'),
	(42, NULL, '테스트3', '한다임/1,550.00/스카우터', '', '2022-03-22 21:29:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, '한다임3', '302', 8, -1, '267430837207826444'),
	(43, NULL, '테스트4', '한다임/1,550.00/스카우터', 'asfasf', '2022-03-22 11:05:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, '한다임', '101', 100, 1, '267430837207826444');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;

-- 테이블 test.categori_jh 구조 내보내기
CREATE TABLE IF NOT EXISTS `categori_jh` (
  `CATENAME` varchar(20) DEFAULT NULL,
  `CATECODE` varchar(30) DEFAULT NULL,
  `CATECODEREF` varchar(30) DEFAULT NULL,
  `CATEMAX` int(10) DEFAULT 8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='categori_jh				\r\n컬럼명	자료형	null	제약조건	용도\r\ncatename	varchar2(30)	not null		카테고리 이름\r\ncatecode	varchar2(30)	not null	pk	board 게시판의 catecode 와 연동\r\ncatecoderef	varchar2(30)		FK,references catecode	게싯글 내용\r\n';

-- 테이블 데이터 test.categori_jh:~18 rows (대략적) 내보내기
/*!40000 ALTER TABLE `categori_jh` DISABLE KEYS */;
INSERT IGNORE INTO `categori_jh` (`CATENAME`, `CATECODE`, `CATECODEREF`, `CATEMAX`) VALUES
	('길드콘텐츠', '100', NULL, NULL),
	('토벌전', '101', '100', 100),
	('점령전', '102', '100', 16),
	('레이드 노말', '200', NULL, NULL),
	('발탄노말', '201', '200', 8),
	('비아노말', '202', '200', 8),
	('쿠크노말', '203', '200', 4),
	('아브노말1-2', '204', '200', 8),
	('아브노말3-4', '206', '200', 8),
	('아브노말5-6', '207', '200', 8),
	('아브노말1-4', '205', '200', 8),
	('레이드 하드', '300', NULL, NULL),
	('발탄하드', '301', '300', 8),
	('비아하드', '302', '300', 8),
	('아브하드1-2', '303', '300', 8),
	('아브하드3-4', '305', '300', 8),
	('아브하드5-6', '306', '300', 8),
	('아브하드1-4', '304', '300', 8);
/*!40000 ALTER TABLE `categori_jh` ENABLE KEYS */;

-- 테이블 test.rade 구조 내보내기
CREATE TABLE IF NOT EXISTS `rade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calid` int(11) DEFAULT 0,
  `nickname` varchar(50) NOT NULL DEFAULT '0',
  `userid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.rade:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `rade` DISABLE KEYS */;
INSERT IGNORE INTO `rade` (`id`, `calid`, `nickname`, `userid`) VALUES
	(68, 42, '한다임/1,550.00/스카우터', '267430837207826444'),
	(79, 40, '한다임/1,550.00/스카우터', '43643643'),
	(81, 40, '한다임/1,550.00/스카우터', '45747'),
	(83, 40, '한다임/1,550.00/스카우터', '267430837207826444');
/*!40000 ALTER TABLE `rade` ENABLE KEYS */;

-- 테이블 test.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `lv` varchar(50) NOT NULL DEFAULT '',
  `role` varchar(50) NOT NULL DEFAULT '',
  `last_tobal` varchar(50) DEFAULT '',
  `issu` varchar(50) DEFAULT '',
  `yellowCard` int(3) DEFAULT 0,
  `yellowCardWhy` varchar(1000) DEFAULT 'ex)월루로 인한 경고1회 + 치킨혼자먹어서 경고1회',
  `real_tobal` varchar(50) DEFAULT NULL,
  `sooncut` varchar(50) DEFAULT 'Y',
  `a` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='유저테이블\r\n';

-- 테이블 데이터 test.user:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `username`, `nickname`, `name`, `lv`, `role`, `last_tobal`, `issu`, `yellowCard`, `yellowCardWhy`, `real_tobal`, `sooncut`, `a`) VALUES
	('267430837207826444', '다임', '한다임/1,550.00/스카우터', '한다임', '1,550.00', '스카우터', '2022-03-21 18:28:00', '게임을 너무잘함', 1, '<img alt="" src="/resources/ckUpload/b4e8c86a-010b-400f-adda-d75f968af5b4_데이터무제한요금제를_월3만원대에_이용.tif" /><img alt="" src="/web/resources/ckUpload/ed966557-2acd-410a-9862-68d7731ddd03_PMS_________.jpg" />월루로 인한 경고1회 + 치킨혼자먹어서 경고1회', '2022-03-14 11:12:00', 'N', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
