-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
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
  `ID` double DEFAULT NULL,
  `GROUPID` double DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `WRITER` varchar(50) DEFAULT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `START1` datetime DEFAULT NULL,
  `END1` datetime DEFAULT NULL,
  `ALLDAY` tinyint(4) DEFAULT NULL,
  `TEXTCOLOR` varchar(50) DEFAULT NULL,
  `BACKGROUNDCOLOR` varchar(50) DEFAULT NULL,
  `BORDERCOLOR` varchar(50) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `LEADER_ID` varchar(100) DEFAULT NULL,
  `CATECODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 test.calendar:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT IGNORE INTO `calendar` (`ID`, `GROUPID`, `TITLE`, `WRITER`, `CONTENT`, `START1`, `END1`, `ALLDAY`, `TEXTCOLOR`, `BACKGROUNDCOLOR`, `BORDERCOLOR`, `USERNAME`, `LEADER_ID`, `CATECODE`) VALUES
	(1, NULL, '할일title', 'test', '내용-content', '2021-05-01 00:00:00', '2021-05-03 00:00:00', 1, 'yellow', 'navy', 'navy', '나', '나', '10'),
	(2, NULL, '할일title', 'test', '내용-content', '2021-05-01 00:00:00', '2021-05-03 00:00:00', 1, 'yellow', 'navy', 'navy', '나', '나', '10'),
	(3, NULL, '할일title', 'test', '내용-content', '2022-03-08 00:00:00', '2022-03-08 00:00:00', 1, 'yellow', 'navy', 'navy', '1', '1', '1'),
	(4, NULL, '쿠쿠세이튼', 'test', '내용-content', '2022-03-07 00:00:00', '2022-03-07 00:00:00', 1, 'yellow', 'navy', 'navy', '1', '1', '1'),
	(5, NULL, '쿠쿠세이튼', 'test', '내용-content', '2022-03-07 00:00:00', '2022-03-07 00:00:00', 1, 'yellow', 'navy', 'navy', '1', '1', '1'),
	(6, NULL, '쿠쿠세이튼', 'test', '내용-content', '2022-03-07 00:00:00', '2022-03-07 00:00:00', 1, 'yellow', 'navy', 'navy', '0', '0', '0');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;

-- 테이블 test.categori_jh 구조 내보내기
CREATE TABLE IF NOT EXISTS `categori_jh` (
  `CATENAME` varchar(20) DEFAULT NULL,
  `CATECODE` varchar(30) DEFAULT NULL,
  `CATECODEREF` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='categori_jh				\r\n컬럼명	자료형	null	제약조건	용도\r\ncatename	varchar2(30)	not null		카테고리 이름\r\ncatecode	varchar2(30)	not null	pk	board 게시판의 catecode 와 연동\r\ncatecoderef	varchar2(30)		FK,references catecode	게싯글 내용\r\n';

-- 테이블 데이터 test.categori_jh:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `categori_jh` DISABLE KEYS */;
INSERT IGNORE INTO `categori_jh` (`CATENAME`, `CATECODE`, `CATECODEREF`) VALUES
	('길드', '100', NULL),
	('토벌전', '101', '100'),
	('점령전', '102', '100'),
	('레이드', '200', NULL),
	('발탄', '201', '200'),
	('비아', '202', '200'),
	('카테고리 없음', '0', NULL),
	('카테고리 없음', '00', '0');
/*!40000 ALTER TABLE `categori_jh` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
