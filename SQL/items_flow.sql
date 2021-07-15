-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2021 年 07 月 16 日 01:26
-- 伺服器版本： 10.4.19-MariaDB
-- PHP 版本： 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `lunar_phase`
--

-- --------------------------------------------------------

--
-- 資料表結構 `items_flow`
--

CREATE TABLE `items_flow` (
  `flowId` int(11) NOT NULL COMMENT '流量編號',
  `flowName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流量名稱',
  `flowImg` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流量圖片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `items_flow`
--

INSERT INTO `items_flow` (`flowId`, `flowName`, `flowImg`) VALUES
(1, '日常使用', 'flow01.svg'),
(2, '量少', 'flow02.svg'),
(3, '一般', 'flow03.svg'),
(4, '量多', 'flow04.svg'),
(5, '量多加強', 'flow05.svg');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `items_flow`
--
ALTER TABLE `items_flow`
  ADD PRIMARY KEY (`flowId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `items_flow`
--
ALTER TABLE `items_flow`
  MODIFY `flowId` int(11) NOT NULL AUTO_INCREMENT COMMENT '流量編號', AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
