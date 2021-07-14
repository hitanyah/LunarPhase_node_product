-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2021 年 07 月 14 日 20:19
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
-- 資料表結構 `items_options`
--

CREATE TABLE `items_options` (
  `optionId` int(11) NOT NULL COMMENT '商品規格編號',
  `optionName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品規格名稱',
  `optionQtyPerPack` int(11) NOT NULL COMMENT '商品包裝內個數',
  `optionWings` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '翅膀類型',
  `optionApplicator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '導管類型',
  `optionColor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '顏色',
  `optionClothSize` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '衣類尺寸'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `items_options`
--

INSERT INTO `items_options` (`optionId`, `optionName`, `optionQtyPerPack`, `optionWings`, `optionApplicator`, `optionColor`, `optionClothSize`) VALUES
(1, '潔翼 15片', 15, '潔翼', NULL, NULL, NULL),
(2, '潔翼 10片', 10, '潔翼', NULL, NULL, NULL),
(3, '無側翼 15片', 15, '無側翼', NULL, NULL, NULL),
(4, '潔翼 13片', 13, '潔翼', NULL, NULL, NULL),
(5, '潔翼 9片', 9, '潔翼', NULL, NULL, NULL),
(6, '潔翼 10片', 10, '潔翼', NULL, NULL, NULL),
(7, '潔翼 6片', 6, '潔翼', NULL, NULL, NULL),
(8, '潔翼 9片', 9, '潔翼', NULL, NULL, NULL),
(9, '潔翼 4片', 4, '潔翼', NULL, NULL, NULL),
(10, '潔翼 18片', 18, '潔翼', NULL, NULL, NULL),
(11, '潔翼 12片', 12, '潔翼', NULL, NULL, NULL),
(12, '40片', 40, NULL, NULL, NULL, NULL),
(13, '28片', 28, NULL, NULL, NULL, NULL),
(14, '導管式 7入', 7, NULL, '導管式', NULL, NULL),
(15, '指入式 20入', 20, NULL, '指入式', NULL, NULL),
(16, '導管式 5入', 5, NULL, '導管式', NULL, NULL),
(17, '指入式 16入', 16, NULL, '指入式', NULL, NULL),
(18, 'A款 1件裝', 1, NULL, NULL, 'A款', NULL),
(19, 'B款 1件裝', 1, NULL, NULL, 'B款', NULL),
(20, '1+1優惠組', 2, NULL, NULL, 'A+B款', NULL),
(21, '1入 附收納袋', 1, NULL, NULL, NULL, NULL),
(22, 'S號 1件裝', 1, NULL, NULL, NULL, 'S'),
(23, 'M號 1件裝', 1, NULL, NULL, 'A+B款', 'M'),
(24, 'L號 1件裝', 1, NULL, NULL, 'A款', 'L'),
(25, 'B款 1件裝', 1, NULL, NULL, 'B款', NULL),
(26, '1+1優惠組', 2, NULL, NULL, 'A+B款', NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `items_options`
--
ALTER TABLE `items_options`
  ADD PRIMARY KEY (`optionId`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `items_options`
--
ALTER TABLE `items_options`
  MODIFY `optionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品規格編號', AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
