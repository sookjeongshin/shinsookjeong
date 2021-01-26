-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- 생성 시간: 21-01-26 07:03
-- 서버 버전: 10.4.13-MariaDB
-- PHP 버전: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `edu`
--

DELIMITER $$
--
-- 프로시저
--
DROP PROCEDURE IF EXISTS `dummyBoard`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dummyBoard` (IN `p_loop` INT)  BEGIN
	declare cnt int default 2;
    delete from tbl_board where bno > 1;
    while cnt <= p_loop do
    INSERT INTO tbl_board(bno,title,content,writer)
    VALUES
    (cnt, concat(cnt,'번째 게시물 입니다.'), '게시물 내용 입니다.', 'admin');
    set cnt = cnt + 1;
    end while;
END$$

DROP PROCEDURE IF EXISTS `dummyMember`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dummyMember` (IN `p_loop` INT)  BEGIN
	declare cnt int default 1;#반복문 변수선언
    delete from tbl_member where user_id like 'dummy%';
    while cnt <= p_loop do
		INSERT INTO tbl_member(user_id,user_pw,user_name,email,point,enabled,levels) 
		VALUES 
		(concat('dummy_',cnt) , '1234', '관리자', 'admin@abc.com', '0', '1', 'ROLE_ADMIN');
        set cnt = cnt + 1;
    end while;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 테이블 구조 `tbl_attach`
--

DROP TABLE IF EXISTS `tbl_attach`;
CREATE TABLE IF NOT EXISTS `tbl_attach` (
  `save_file_name` varchar(255) NOT NULL COMMENT '서버에 저잗되는 한글명이 아닌 파일명',
  `real_file_name` varchar(255) DEFAULT NULL COMMENT '여러분 PC에서 한글로된 진짜 파일명',
  `bno` int(11) NOT NULL COMMENT '부모게시물의 일련번호',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시',
  PRIMARY KEY (`save_file_name`),
  KEY `fk_tbl_attach_tbl_board_idx` (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시물첨부파일';

--
-- 테이블의 덤프 데이터 `tbl_attach`
--

INSERT INTO `tbl_attach` (`save_file_name`, `real_file_name`, `bno`, `reg_date`) VALUES
('9d1adad6-b044-4887-a0dd-dbd9c2e641a6.jpg', 'slide_01.jpg.jpg', 2, '2021-01-17 06:17:31');

-- --------------------------------------------------------

--
-- 테이블 구조 `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물일련번호, AI(Auto Increament)일련번호를 자동증가기능',
  `board_type` varchar(45) DEFAULT NULL COMMENT '게시판타입:tbl_board_type테이블의 값을 가져다 사용\n',
  `title` varchar(255) DEFAULT NULL COMMENT '게시물제목',
  `content` text DEFAULT NULL COMMENT '게시물내용',
  `writer` varchar(45) DEFAULT NULL COMMENT '작성자',
  `view_count` int(11) DEFAULT 0 COMMENT '게시글조회수',
  `reply_count` int(11) DEFAULT 0 COMMENT '댓글개수',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='게시물관리';

--
-- 테이블의 덤프 데이터 `tbl_board`
--

INSERT INTO `tbl_board` (`bno`, `board_type`, `title`, `content`, `writer`, `view_count`, `reply_count`, `reg_date`, `update_date`) VALUES
(1, 'gallery', '업데이트 수정1번째 게시물 입니다. ', '게시물 내용 입니다.', 'admin', 22, 0, '2020-12-23 03:21:06', '2021-01-25 02:14:28'),
(2, 'gallery', '2번=======째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 50, 1, '2020-12-23 05:51:52', '2021-01-25 00:30:25'),
(3, 'gallery', '3번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 9, 0, '2020-12-23 05:51:52', '2021-01-25 00:44:42'),
(4, 'gallery', '4번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 4, 0, '2020-12-23 05:51:52', '2021-01-25 01:43:04'),
(5, 'gallery', '5번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(6, 'notice', '6번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 8, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(7, 'notice', '7번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(8, 'notice', '8번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(10, 'notice', '10번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(11, 'notice', '11번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(12, 'notice', '12번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(13, 'notice', '13번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(14, 'notice', '14번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(15, 'notice', '15번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(16, 'notice', '16번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(17, 'notice', '17번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(18, 'notice', '18번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(19, 'notice', '19번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(20, 'notice', '20번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(21, 'notice', '21번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(22, 'notice', '22번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(23, 'notice', '23번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(24, 'notice', '24번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(25, 'notice', '25번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(26, 'notice', '26번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(27, 'notice', '27번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(28, 'notice', '28번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(29, 'notice', '29번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(30, 'notice', '30번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(31, 'notice', '31번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(32, 'notice', '32번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(33, 'notice', '33번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(34, 'notice', '34번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(35, 'notice', '35번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(36, 'notice', '36번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(37, 'notice', '37번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(38, 'notice', '38번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(39, 'notice', '39번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(40, 'notice', '40번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(41, 'notice', '41번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(42, 'notice', '42번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(43, 'notice', '43번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(44, 'notice', '44번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(45, 'notice', '45번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(46, 'notice', '46번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(47, 'notice', '47번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(48, 'notice', '48번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(49, 'notice', '49번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(50, 'notice', '50번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(51, 'notice', '51번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(52, 'notice', '52번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(53, 'notice', '53번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(54, 'notice', '54번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(55, 'notice', '55번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 6, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(56, 'notice', '56번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(57, 'notice', '57번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(58, 'notice', '58번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(59, 'notice', '59번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(60, 'notice', '60번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(61, 'notice', '61번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(62, 'notice', '62번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(63, 'notice', '63번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(64, 'notice', '64번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(65, 'notice', '65번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(66, 'notice', '66번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(67, 'notice', '67번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(68, 'notice', '68번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(69, 'notice', '69번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(70, 'notice', '70번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(71, 'notice', '71번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(72, 'notice', '72번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(73, 'notice', '73번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(74, 'notice', '74번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(75, 'notice', '75번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(76, 'notice', '76번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(77, 'notice', '77번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(78, 'notice', '78번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(79, 'notice', '79번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(80, 'notice', '80번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(81, 'notice', '81번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(82, 'notice', '82번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(83, 'notice', '83번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(84, 'notice', '84번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(85, 'notice', '85번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(86, 'notice', '86번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(87, 'notice', '87번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(88, 'notice', '88번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(89, 'notice', '89번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(90, 'notice', '90번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(91, 'notice', '91번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(92, 'notice', '92번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(93, 'notice', '93번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(94, 'notice', '94번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(95, 'notice', '95번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(96, 'notice', '96번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(97, 'notice', '97번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(98, 'notice', '98번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(99, 'notice', '99번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(100, 'notice', '100번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(101, 'notice', '101번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(102, 'notice', '102번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(103, 'notice', '103번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(104, 'notice', '104번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(105, 'notice', '105번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(106, 'notice', '106번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(107, 'notice', '107번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(108, 'notice', '108번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(109, 'notice', '109번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(110, 'notice', '110번째 게시물 입니다.', '게시물 내용 입니다.', 'admin', 0, 0, '2020-12-23 05:51:52', '2020-12-23 05:51:52'),
(116, 'gallery', 'sd', '<p>sd<br></p>', 'sd', 7, 0, '2021-01-25 08:49:22', '2021-01-25 08:53:21'),
(117, 'gallery', '1', '<p>11<br></p>', '1', 5, 0, '2021-01-26 02:02:35', '2021-01-26 02:40:50'),
(118, 'gallery', 'test', '<p>1<br></p>', '1', 3, 0, '2021-01-26 02:42:24', '2021-01-26 02:42:55'),
(120, 'notice', 'test', '<p>1<br></p>', '123', 14, 0, '2021-01-26 02:47:11', '2021-01-26 02:48:57');

-- --------------------------------------------------------

--
-- 테이블 구조 `tbl_board_type`
--

DROP TABLE IF EXISTS `tbl_board_type`;
CREATE TABLE IF NOT EXISTS `tbl_board_type` (
  `board_type` varchar(45) NOT NULL COMMENT '게시판타입: notice, gallery, qna',
  `board_name` varchar(45) DEFAULT NULL COMMENT '게시판 이름',
  `board_sun` int(11) DEFAULT NULL COMMENT '게시판 출력 순서',
  PRIMARY KEY (`board_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판생성:게시판종류생성 갤러리, 공지사항, 묻고답하기';

--
-- 테이블의 덤프 데이터 `tbl_board_type`
--

INSERT INTO `tbl_board_type` (`board_type`, `board_name`, `board_sun`) VALUES
('gallery', '겔러리', 2),
('notice', '공지사항', 1),
('test', '테스트', 3);

-- --------------------------------------------------------

--
-- 테이블 구조 `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `user_id` varchar(45) NOT NULL COMMENT '회원아이디',
  `user_pw` varchar(255) DEFAULT NULL COMMENT '회원 로그인 암호',
  `user_name` varchar(255) DEFAULT NULL COMMENT '회원 이름',
  `email` varchar(255) DEFAULT NULL COMMENT '회원 이메일',
  `point` int(11) DEFAULT 0 COMMENT '회원 적립포인트',
  `enabled` int(1) DEFAULT 1 COMMENT '인증값(Authentication),활동 가능한 회원 여부, 0 로그인불가능, 1 로그인가능',
  `levels` varchar(45) DEFAULT 'ROLE_USER' COMMENT '권한값(Authority),2가지 레벨, ROLE_ADMIN(관리자), ROLE_USER(사용자)',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일자,1970부터 초단위로 현재까지 계산한 값',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일자',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원관리';

--
-- 테이블의 덤프 데이터 `tbl_member`
--

INSERT INTO `tbl_member` (`user_id`, `user_pw`, `user_name`, `email`, `point`, `enabled`, `levels`, `reg_date`, `update_date`) VALUES
('111', '$2a$10$n82a6RvD8vHOJ2f6xrqgWOHsPNRMVH6J0sY5XlcG1HMChvGFP/U..', '111', '11@jjj.jjj', 10, 0, 'ROLE_USER', '2021-01-26 04:04:39', '2021-01-26 04:04:39'),
('1212', '$2a$10$DfvTuxfcxMlv4YJW/HLnG.YT9mAiWHq5MwT/5QFqS7TrUNFfolJB2', '1212', '1212@1212.com', 10, 0, 'ROLE_USER', '2021-01-26 03:58:19', '2021-01-26 04:03:32'),
('123', '$2a$10$OGWRVNmKOQNBYXKKUvlnh.tNDsB6sPn5T74VWa4fScvr3IQD21kZu', '123', '123@123.123', 10, 0, 'ROLE_USER', '2021-01-25 09:30:39', '2021-01-25 09:30:39'),
('1234', '$2a$10$/LTvlRMmnU/xsBuu4Z40kuKmoKm6GrcFasqCwKuxkwm/2rxIoNhPa', '1234', '1234@1234.vcv', 10, 0, 'ROLE_USER', '2021-01-25 09:21:22', '2021-01-25 09:21:22'),
('12345', '$2a$10$t102jU2yeXjHML2dkZWUwO3MTao6YtWHsVjetMC1xQDZCAragMsny', '12345', '123@m.com', 10, 0, 'ROLE_USER', '2021-01-26 03:57:51', '2021-01-26 03:57:51'),
('admin', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '최고관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 03:03:08', '2021-01-22 05:35:31'),
('dummy_1', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_10', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_100', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_101', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_102', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_103', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_104', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_105', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_106', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_107', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_108', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_109', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_11', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_110', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_12', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_13', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_14', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_15', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_16', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_17', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_18', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_19', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_2', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_20', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_21', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_22', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_23', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_24', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_25', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_26', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_27', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_28', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_29', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_3', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_30', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_31', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_32', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_33', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_34', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_35', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_36', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_37', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_38', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_39', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_4', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_40', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_41', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_42', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_43', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_44', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_45', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_46', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_47', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_48', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_49', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_5', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_50', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_51', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_52', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_53', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_54', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_55', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_56', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_57', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_58', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_59', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_6', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_60', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_61', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_62', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_63', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_64', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_65', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_66', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_67', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_68', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_69', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_7', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_70', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_71', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_72', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_73', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_74', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_75', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_76', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_77', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_78', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_79', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_8', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_80', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_81', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_82', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_83', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_84', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_85', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_86', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_87', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_88', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_89', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_9', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_90', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_91', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_92', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_93', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:47', '2020-12-23 05:51:47'),
('dummy_94', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '수정관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-24 03:47:52'),
('dummy_95', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_96', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_97', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_98', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48'),
('dummy_99', '$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO', '관리자', 'admin@abc.com', 0, 1, 'ROLE_ADMIN', '2020-12-23 05:51:48', '2020-12-23 05:51:48');

-- --------------------------------------------------------

--
-- 테이블 구조 `tbl_reply`
--

DROP TABLE IF EXISTS `tbl_reply`;
CREATE TABLE IF NOT EXISTS `tbl_reply` (
  `rno` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글의 일련번호',
  `bno` int(11) NOT NULL COMMENT '부모게시물의 일련번호',
  `reply_text` varchar(1000) DEFAULT NULL COMMENT '댓글내용',
  `replyer` varchar(45) DEFAULT NULL COMMENT '작성자',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`rno`),
  KEY `fk_tbl_reply_tbl_board1_idx` (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='댓글관리';

--
-- 테이블의 덤프 데이터 `tbl_reply`
--

INSERT INTO `tbl_reply` (`rno`, `bno`, `reply_text`, `replyer`, `reg_date`, `update_date`) VALUES
(3, 2, 'aaa', 'aaa', '2021-01-17 06:25:16', '2021-01-17 06:28:50');

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `tbl_attach`
--
ALTER TABLE `tbl_attach`
  ADD CONSTRAINT `fk_tbl_attach_tbl_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 테이블의 제약사항 `tbl_reply`
--
ALTER TABLE `tbl_reply`
  ADD CONSTRAINT `fk_tbl_reply_tbl_board1` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
