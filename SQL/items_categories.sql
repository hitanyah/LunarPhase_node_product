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
-- 資料表結構 `items_categories`
--

CREATE TABLE `items_categories` (
  `categoryId` int(11) NOT NULL COMMENT '商品類別編號',
  `categoryName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品類別名稱',
  `categoryParentId` int(11) NOT NULL COMMENT '商品類別父層編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `items_categories`
--

INSERT INTO `items_categories` (`categoryId`, `categoryName`, `categoryParentId`) VALUES
(1, '衛生棉', 0),
(2, '衛生棉條', 0),
(3, '布衛生棉', 0),
(4, '月亮杯', 0),
(5, '月亮褲', 0),
(6, '其他', 0),
(7, '日用', 1),
(8, '夜用', 1),
(9, '護墊', 1),
(10, '一般型', 2),
(11, '量少型', 2),
(12, '量多型', 2),
(13, '日用', 3),
(14, '夜用', 3),
(15, '教學杯', 4),
(16, '標準杯', 4),
(17, '滿月杯', 4),
(18, '一般', 5),
(19, '加強', 5);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `items_categories`
--
ALTER TABLE `items_categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `items_categories`
--
ALTER TABLE `items_categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品類別編號', AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
