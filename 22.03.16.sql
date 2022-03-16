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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.calendar:~28 rows (대략적) 내보내기
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT IGNORE INTO `calendar` (`ID`, `GROUPID`, `TITLE`, `WRITER`, `CONTENT`, `START1`, `END1`, `ALLDAY`, `TEXTCOLOR`, `BACKGROUNDCOLOR`, `BORDERCOLOR`, `USERNAME`, `LEADER_ID`, `CATECODE`, `CATEMAX`, `CATEMIN`) VALUES
	(1, NULL, '할일title', 'test', '내용-content', '2021-05-01 00:00:00', '2021-05-03 00:00:00', 1, 'yellow', 'navy', 'navy', '나', '나', '10', NULL, 1),
	(2, NULL, '할일title', 'test', '내용-content', '2021-05-01 00:00:00', '2021-05-03 00:00:00', 1, 'yellow', 'navy', 'navy', '나', '나', '203', NULL, 1),
	(3, NULL, '할일title', 'test', '내용-content', '2022-03-08 00:00:00', '2022-03-08 00:00:00', 1, 'yellow', 'navy', 'navy', '1', '1', '203', NULL, 1),
	(4, NULL, '쿠쿠세이튼', 'test', '내용-content', '2022-03-07 00:00:00', '2022-03-07 00:00:00', 1, 'yellow', 'navy', 'navy', '1', '1', '203', NULL, 1),
	(5, NULL, '쿠쿠세이튼', 'test', '내용-content', '2022-03-07 08:00:00', '2022-03-07 00:00:00', 1, 'yellow', 'navy', 'navy', '1', '1', '203', NULL, 1),
	(6, NULL, '쿠쿠세이튼', 'test', '내용-content', '2022-03-07 12:00:00', '2022-03-07 00:00:00', 1, 'yellow', 'navy', 'navy', '0', '0', '203', 8, 1),
	(7, NULL, '토벌전', '한다임', '토벌전 갈사람', '2022-03-26 20:30:00', '2022-03-26 20:30:00', 1, 'yellow', 'navy', 'navy', NULL, '한다임', '101', 100, 1),
	(8, NULL, '토벌전', '한다임', '토벌전 갈사람', '2022-03-26 20:30:00', '2022-03-26 20:30:00', 1, 'yellow', 'navy', 'navy', NULL, '한다임', '101', 100, 1),
	(9, NULL, '토벌전', '한다임', '토벌전 갈사람', '2022-03-26 20:30:00', '2022-03-26 20:30:00', 1, 'yellow', 'navy', 'navy', NULL, '한다임', '101', 100, 1),
	(10, NULL, '토벌전', '한다임', '토벌전 갈사람', '2022-03-26 20:30:00', '2022-03-26 20:30:00', 1, 'yellow', 'navy', 'navy', NULL, '한다임', '101', 100, 1),
	(11, NULL, '토벌전', '한다임', '토벌전 갈사람', '2022-03-26 20:30:00', '2022-03-26 20:30:00', 1, 'yellow', 'navy', 'navy', NULL, '203', '101', 100, 1),
	(12, NULL, '타이틀', '한다임', '점령전ㄱ?', '2022-03-27 20:30:00', '2022-03-27 20:30:00', 1, 'yellow', 'navy', 'navy', NULL, '한다임', '102', 16, 1),
	(13, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(14, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(15, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(16, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(17, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(18, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(19, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(20, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(21, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(22, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, NULL, NULL, 1),
	(23, NULL, 'ㅇ', '한다임', 'ㅇㄻㄴㄹ', '2022-03-16 22:30:00', '2020-03-16 22:30:00', 1, 'yellow', 'navy', 'navy', NULL, '한다임', '102', 16, 1),
	(24, NULL, 'ㅇ', NULL, 'ㅇㄻㄴㄹㅇ', '2022-03-16 22:30:00', '2020-03-16 22:30:00', 1, 'yellow', 'navy', 'navy', NULL, NULL, '102', 16, 1),
	(25, NULL, '제목', '한다임', '내용', '2022-03-16 22:30:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, '한다임', '101', 100, 1),
	(26, NULL, 'safsaf', NULL, 'fsaf', '2022-03-16 22:30:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, '202', 8, 1),
	(27, NULL, 'd', NULL, '뭐요&nbsp;', '2022-03-17 10:20:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, '101', 100, 1),
	(28, NULL, '응애', '한다임/1,545.00/스카우터,한다임/1,545.00/스카우터', 'd', '2022-03-16 22:10:00', NULL, 1, 'yellow', 'navy', 'navy', NULL, NULL, '102', 16, 1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.rade:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `rade` DISABLE KEYS */;
INSERT IGNORE INTO `rade` (`id`, `calid`, `nickname`) VALUES
	(1, 6, '한다임'),
	(2, 6, '둘다임'),
	(3, 6, 'com.bbs.domain.User@2a954de6'),
	(4, 6, 'com.bbs.domain.User@227c9351'),
	(5, 6, '한다임/1,545.00/스카우터'),
	(6, 6, '한다임/1,545.00/스카우터'),
	(7, 6, ''),
	(8, 6, '한다임/1,545.00/스카우터'),
	(9, 27, '한다임/1,545.00/스카우터'),
	(10, 27, '한다임/1,545.00/스카우터'),
	(11, 6, '한다임/1,545.00/스카우터'),
	(12, 6, '한다임/1,545.00/스카우터'),
	(13, 6, '한다임/1,545.00/스카우터'),
	(14, 6, '한다임/1,545.00/스카우터'),
	(15, 6, '한다임/1,545.00/스카우터'),
	(16, 6, '한다임/1,545.00/스카우터'),
	(17, 28, '한다임/1,545.00/스카우터'),
	(18, 28, '한다임/1,545.00/스카우터'),
	(19, 28, '한다임/1,545.00/스카우터'),
	(20, 28, '한다임/1,545.00/스카우터'),
	(21, 25, '한다임/1,545.00/스카우터'),
	(22, 25, '한다임/1,545.00/스카우터'),
	(23, 6, '한다임/1,545.00/스카우터'),
	(24, 6, '한다임/1,545.00/스카우터');
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
  `yellowCardWhy` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='유저테이블\r\n';

-- 테이블 데이터 test.user:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `username`, `nickname`, `name`, `lv`, `role`, `last_tobal`, `issu`, `yellowCard`, `yellowCardWhy`) VALUES
	('267430837207826444', '다임', '한다임/1,545.00/스카우터', '한다임', '1,545.00', '스카우터', '', '', 0, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
