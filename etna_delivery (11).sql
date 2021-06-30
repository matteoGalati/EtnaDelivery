-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 30, 2021 alle 15:12
-- Versione del server: 10.4.17-MariaDB
-- Versione PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etnadelivery`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `options_to_remove` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options_to_remove`)),
  `qta` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `delivery`
--

CREATE TABLE `delivery` (
  `id_delivery_man` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `working_week_day` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`working_week_day`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `delivery`
--

INSERT INTO `delivery` (`id_delivery_man`, `id_user`, `working_week_day`) VALUES
(1, 11, '{\"week-day\":[\"mon\",\"tue\",\"Wed\"]}'),
(2, 11, '{\"week-day\":[\"mon\",\"tue\"]}');

-- --------------------------------------------------------

--
-- Struttura della tabella `images`
--

CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `path` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `images`
--

INSERT INTO `images` (`id_image`, `path`) VALUES
(2, 'cornetto.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `options`
--

CREATE TABLE `options` (
  `id_option` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `option_name` varchar(50) NOT NULL,
  `priceAdded` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `options`
--

INSERT INTO `options` (`id_option`, `id_product`, `option_name`, `priceAdded`) VALUES
(1, 2, 'panna', '0.20'),
(2, 1, 'zucchero', '0.10'),
(3, 3, 'ripienoDiPistavvhio', '0.40'),
(4, 4, 'cremaDiPistacchio', '0.40'),
(5, 2, 'panna sgravata', '0.30');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `datatime` datetime NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_shop` int(11) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `is_delivered` tinyint(1) NOT NULL DEFAULT 0,
  `fk_id_delivery_man` int(11) DEFAULT NULL COMMENT 'ALTER TABLE orders ADD CONSTRAINT fk_fk_id_delivery_man FOREIGN KEY (fk_id_delivery_man) REFERENCES delivery(id_delivery_man);\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id_order`, `id_user`, `datatime`, `products`, `id_shop`, `is_accepted`, `is_delivered`, `fk_id_delivery_man`) VALUES
(159, 1, '2021-04-13 15:47:00', '{\"info\":{\"id_product\":[\"2\"],\"price\":[\"1.20\"],\"product_name\":[\"Cappuccino\"],\"shop_name\":[\"caffetteria\"],\"qta\":[\"1\"],\"total_price\":[\"1.40\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"panna\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"panna\",\"zucchero\"]}],\"id_shop\":[\"1\"],\"closing_day\":[\"\"],\"opening_time\":[\"10:00:00\"],\"closing_time\":[\"1583089200\"],\"path\":[\"cornetto.jpg\"],\"cart_total_price\":1.4},\"html\":[],\"0\":\"cart_total_price\"}', 1, 1, 0, 1),
(160, 1, '2021-04-13 15:47:00', '{\"info\":{\"id_product\":[\"2\"],\"price\":[\"1.20\"],\"product_name\":[\"Cappuccino\"],\"shop_name\":[\"caffetteria\"],\"qta\":[\"1\"],\"total_price\":[\"1.40\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"panna\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"panna\",\"zucchero\"]}],\"id_shop\":[\"1\"],\"closing_day\":[\"\"],\"opening_time\":[\"10:00:00\"],\"closing_time\":[\"1583089200\"],\"path\":[\"cornetto.jpg\"],\"cart_total_price\":1.4},\"html\":[],\"0\":\"cart_total_price\"}', 1, 1, 0, 1),
(161, 1, '2021-04-13 15:47:00', '{\"info\":{\"id_product\":[\"2\"],\"price\":[\"1.20\"],\"product_name\":[\"Cappuccino\"],\"shop_name\":[\"caffetteria\"],\"qta\":[\"1\"],\"total_price\":[\"1.40\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"panna\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"panna\",\"zucchero\"]}],\"id_shop\":[\"1\"],\"closing_day\":[\"\"],\"opening_time\":[\"10:00:00\"],\"closing_time\":[\"1583089200\"],\"path\":[\"cornetto.jpg\"],\"cart_total_price\":1.4},\"html\":[],\"0\":\"cart_total_price\"}', 1, 1, 0, 1),
(162, 1, '2021-04-13 15:47:00', '{\"info\":{\"id_product\":[\"2\"],\"price\":[\"1.20\"],\"product_name\":[\"Cappuccino\"],\"shop_name\":[\"caffetteria\"],\"qta\":[\"1\"],\"total_price\":[\"1.40\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"panna\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"panna\",\"zucchero\"]}],\"id_shop\":[\"1\"],\"closing_day\":[\"\"],\"opening_time\":[\"10:00:00\"],\"closing_time\":[\"1583089200\"],\"path\":[\"cornetto.jpg\"],\"cart_total_price\":1.4},\"html\":[],\"0\":\"cart_total_price\"}', 1, 1, 0, 1),
(164, 1, '2021-04-14 02:27:00', '{\"info\":{\"id_product\":[\"2\",\"2\"],\"price\":[\"1.20\",\"1.20\"],\"product_name\":[\"Cappuccino\",\"Cappuccino\"],\"shop_name\":[\"caffetteria\",\"caffetteria\"],\"qta\":[\"10\",\"3\"],\"total_price\":[\"18.00\",\"4.20\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"panna\",\"zucchero\"],[\"panna\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"panna\",\"zucchero\"]},{\"prices\":[0.2,0.4],\"name\":[\"panna\",\"zucchero\"]}],\"id_shop\":[\"1\",\"1\"],\"closing_day\":[\"\",\"\"],\"opening_time\":[\"10:00:00\",\"10:00:00\"],\"closing_time\":[\"1583089200\",\"1583089200\"],\"path\":[\"cornetto.jpg\",\"cornetto.jpg\"],\"cart_total_price\":22.2},\"html\":[],\"0\":\"cart_total_price\"}', 1, 0, 0, NULL),
(218, 1, '2021-04-20 20:38:00', '{\"info\":{\"product_name\":[\"cornetto\",\"prova1\",\"cornetto\"],\"price\":[\"1.00\",\"2.00\",\"1.00\"],\"id_product\":[\"3\",\"7\",\"3\"],\"qta\":[\"3\",\"2\",\"2\"],\"total_price\":[5.4,4,2.4],\"optionsCart\":{\"0\":[\"panna\",\"zucchero\",\"panna\"],\"2\":[\"pistacchio\"]},\"cart_total_price\":10,\"shop_name\":[]},\"shop_name\":{\"1\":\"caffetteria\",\"2\":\"caffetteria\",\"3\":\"caffetteria\"}}', 1, 0, 0, NULL),
(219, 1, '2021-04-20 20:49:00', '{\"info\":{\"product_name\":[\"cornetto\",\"prova1\",\"cornetto\"],\"price\":[\"1.00\",\"2.00\",\"1.00\"],\"id_product\":[\"3\",\"7\",\"3\"],\"qta\":[\"2\",\"4\",\"2\"],\"total_price\":[3.6,10.4,3.2],\"optionsCart\":[[\"panna\",\"zucchero\",\"pistacchio\"],[\"cioccolatto\",\"pistacchio\"],[\"zucchero\",\"pistacchio\"]],\"cart_total_price\":14,\"shop_name\":[]},\"shop_name\":{\"1\":\"caffetteria\",\"2\":\"caffetteria\",\"3\":\"caffetteria\"}}', 1, 0, 0, NULL),
(220, 1, '2021-04-20 16:45:00', '{\"info\":{\"product_name\":[\"cornetto\"],\"price\":[\"1.00\"],\"id_product\":[\"3\"],\"qta\":[\"3\"],\"total_price\":[6.6000000000000005],\"optionsCart\":[[\"panna\",\"zucchero\",\"pistacchio\",\"cioccolatto\"]],\"cart_total_price\":4.2,\"shop_name\":[]},\"shop_name\":{\"1\":\"caffetteria\"}}', 1, 0, 0, NULL),
(221, 1, '2021-04-21 22:24:00', '{\"info\":{\"id_product\":[\"3\",\"3\",\"3\"],\"price\":[\"1.00\",\"1.00\",\"1.00\"],\"product_name\":[\"cornetto\",\"cornetto\",\"cornetto\"],\"shop_name\":[\"caffetteria\",\"caffetteria\",\"caffetteria\"],\"qta\":[\"2\",\"2\",\"10\"],\"total_price\":[\"2.00\",\"2.40\",\"1.00\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"pistacchio\",\"cioccolatto\"],[\"cioccolatto\"],[\"pistacchio\",\"cioccolatto\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"pistacchio\",\"cioccolatto\"]},{\"prices\":[0.2,0.4],\"name\":[\"pistacchio\",\"cioccolatto\"]},{\"prices\":[0.2,0.4],\"name\":[\"pistacchio\",\"cioccolatto\"]}],\"id_shop\":[\"1\",\"1\",\"1\"],\"closing_day\":[\"\",\"\",\"\"],\"opening_time\":[\"10:00:00\",\"10:00:00\",\"10:00:00\"],\"closing_time\":[\"1583089200\",\"1583089200\",\"1583089200\"],\"path\":[\"cornetto.jpg\",\"cornetto.jpg\",\"cornetto.jpg\"],\"options_to_remove_cart\":[[\"pistacchio\",\"cioccolatto\"],[\"pistacchio\"],[\"pistacchio\",\"cioccolatto\",\"bambini\"]],\"cart_total_price\":5.4},\"html\":[],\"0\":\"cart_total_price\"}', 1, 0, 0, NULL),
(222, 1, '2021-04-21 22:34:00', '{\"info\":{\"id_product\":[\"3\"],\"price\":[\"1.00\"],\"product_name\":[\"cornetto\"],\"shop_name\":[\"caffetteria\"],\"qta\":[\"1\"],\"total_price\":[\"0.60\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"pistacchio\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"pistacchio\",\"cioccolatto\"]}],\"id_shop\":[\"1\"],\"closing_day\":[\"\"],\"opening_time\":[\"10:00:00\"],\"closing_time\":[\"1583089200\"],\"path\":[\"cornetto.jpg\"],\"options_to_remove_cart\":[[\"pistacchio\",\"cioccolatto\"]],\"cart_total_price\":0.6},\"html\":[],\"0\":\"cart_total_price\"}', 1, 0, 0, NULL),
(223, 1, '2021-04-21 22:48:00', '{\"info\":{\"id_product\":[\"3\"],\"price\":[\"1.00\"],\"product_name\":[\"cornetto\"],\"shop_name\":[\"caffetteria\"],\"qta\":[\"1\"],\"total_price\":[\"0.10\"],\"0\":\"cart_total_price\",\"optionsCart\":[[\"pistacchio\",\"cioccolatto\"]],\"allOptions\":[{\"prices\":[0.2,0.4],\"name\":[\"pistacchio\",\"cioccolatto\"]}],\"id_shop\":[\"1\"],\"closing_day\":[\"\"],\"opening_time\":[\"10:00:00\"],\"closing_time\":[\"1583089200\"],\"path\":[\"cornetto.jpg\"],\"options_to_remove_cart\":[[\"pistacchio\",\"cioccolatto\",\"bambini\"]],\"cart_total_price\":0.1},\"html\":[],\"0\":\"cart_total_price\"}', 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_description` varchar(200) NOT NULL,
  `id_shop_seller` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `options_to_remove` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options_to_remove`)),
  `id_category` int(11) DEFAULT NULL,
  `product_image` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `product`
--

INSERT INTO `product` (`id_product`, `product_name`, `product_description`, `id_shop_seller`, `price`, `options`, `options_to_remove`, `id_category`, `product_image`) VALUES
(1, 'espresso', '           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae suscipit, similique perspiciatis cum eius modi odit alias id inventore impedit veniam dolores e', 2, '0.80', '{ \"prices\":[0.20,0.40] ,\"name\":[\"pistacchio\",\"cioccolatto\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 6, 2),
(2, 'Cappuccino', '           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 1, '1.20', '{ \"prices\":[0.20,0.40] ,\"name\":[\"panna\",\"zucchero\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 5, 2),
(3, 'cornetto', '           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 1, '1.00', '{ \"prices\":[0.20,0.40] ,\"name\":[\"pistacchio\",\"cioccolatto\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 3, 2),
(4, 'crostatina', '           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 3, '1.00', '{ \"prices\":[0.20,0.40] ,\"name\":[\"pistacchio\",\"cioccolatto\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 3, 2),
(7, 'prova1', '           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 1, '2.00', '{ \"prices\":[0.20,0.40] ,\"name\":[\"pistacchio\",\"cioccolatto\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 3, 2),
(10, 'vaccino', 'v           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 1, '2.00', '{ \"prices\":[0.20,0.40] ,\"name\":[\"panna\",\"zucchero\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 3, 2),
(12, 'provacaffè', 'v           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 1, '2.00', '{ \"prices\":[0.20,0.40] ,\"name\":[\"panna\",\"zucchero\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 4, 2),
(14, 'patatine_fritte', '           Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus dolore, deserunt recusandae ', 1, '2.00', '{ \"prices\":[0.20,0.40] ,\"name\":[\"pistacchio\",\"cioccolatto\"]}', '{ \"prices\":[0.20,0.40,0.90] ,\"name\":[\"pistacchio\",\"cioccolatto\",\"bambini\"]}', 6, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `products_categories`
--

CREATE TABLE `products_categories` (
  `id_category` int(11) NOT NULL,
  `product_category_name` varchar(80) DEFAULT NULL,
  `id_shop_category` int(11) DEFAULT NULL,
  `image_path` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `products_categories`
--

INSERT INTO `products_categories` (`id_category`, `product_category_name`, `id_shop_category`, `image_path`) VALUES
(1, 'pasticcieria', NULL, 2),
(3, 'tavolaCalda', NULL, 2),
(4, 'pasticcieria', NULL, 2),
(5, 'caffè', NULL, 2),
(6, 'fritture', NULL, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `reviews`
--

CREATE TABLE `reviews` (
  `id_review` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `stars` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `reviews`
--

INSERT INTO `reviews` (`id_review`, `id_user`, `id_shop`, `title`, `content`, `stars`) VALUES
(1, 11, 1, 'Consegna veloce sempre disponibili', 'ho ordinato x in poco tempo...', 4),
(3, 9, 1, '', 'mi piacciono i bambinimi piacciono i bambinimi piacciono i bambini', 3),
(4, 12, 1, 'Consegna veloce sempre disponibili', 'Consegna veloce sempre disponibili', 2),
(8, 1, 1, 'Consegna veloce sempre disponibili', 'lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `shops`
--

CREATE TABLE `shops` (
  `id_shop` int(11) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `shop_category` varchar(30) NOT NULL,
  `shop_sell` int(11) NOT NULL,
  `shop_img` varchar(60) NOT NULL,
  `fk_id_user` int(11) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` varchar(50) NOT NULL DEFAULT current_timestamp(),
  `closing_day` varchar(5) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `shops`
--

INSERT INTO `shops` (`id_shop`, `shop_name`, `shop_category`, `shop_sell`, `shop_img`, `fk_id_user`, `opening_time`, `closing_time`, `closing_day`, `description`) VALUES
(1, 'caffetteria', 'bar', 0, 'caffetteria_homepage.jpg', 1, '10:00:00', '1583089200', '', 'something'),
(2, 'divincenzo', 'bar', 0, 'divincenzo_homepage.jpg', NULL, '10:00:00', '2021-03-18 20:00:00', '', 'something'),
(3, 'caprice', 'bar', 0, 'caprice_homepage.jpg', NULL, '10:00:00', '1583089200', '', 'something'),
(4, 'Yogurtlandia', 'ristorante', 0, 'yogurtlandia_homepage.jpg', NULL, '10:00:00', '2021-03-18 00:00:00', '', 'something');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telephone_number` varchar(10) NOT NULL,
  `completed_orders` int(11) NOT NULL,
  `money_spent` decimal(10,0) DEFAULT 0,
  `confirm` tinyint(1) NOT NULL,
  `admin` smallint(1) DEFAULT 0,
  `vkey` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='porco dio';

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `telephone_number`, `completed_orders`, `money_spent`, `confirm`, `admin`, `vkey`) VALUES
(1, 'Matteo Galati', 'matteogalati123@gmail.com', '123', '0', 0, '3', 1, 1, NULL),
(2, '', 'matteogalati123@gmail.co', '123', '0', 0, '0', 0, 0, 0),
(3, '', 'matteogalati123@gma', '123', '0', 0, '0', 0, 0, 0),
(4, '', 'matteogalati123@gm', '123', '0', 0, '0', 0, 0, 0),
(5, '', 'sss@a', '123', '1234567890', 0, '0', 0, 0, 0),
(6, '', 'dede@xn--e-wpn', '123', '0', 0, '0', 0, 0, 0),
(7, '', 'e@dedeeeeeeeeeeeeeeeedw', '123', '0', 0, '0', 0, 0, 0),
(8, '', 'w@w', '123', '0', 0, '0', 0, 0, 0),
(9, '', 'matteoga@e', '123', '0', 0, '0', 0, 0, 0),
(10, '', 'matteogalati123@gmail.cdedee', '123', '0', 0, '0', 0, 0, 0),
(11, 'afar', 'a@f', '123', '0', 0, '0', 0, 2, 0),
(12, '', 'mmm@fdfdfd', '123', '0', 0, '0', 0, 0, 0),
(16, '', 'aot@1dadswdww', '123', '0', 0, '0', 0, 0, 0),
(18, '', 'csccdd@ddddddddd', '123', '2147483647', 0, '0', 0, 0, 0),
(19, '', 'hh@hhh', '123', '2147483647', 0, '0', 0, 0, 0),
(21, '', 'gg@hhh', '123', '3278972901', 0, '0', 0, 0, 0),
(22, '', 'newuser@f', '123', '3333333333', 0, '0', 1, 0, 0),
(23, '', 'frfrff@grgrr', '123', '3278972903', 0, '0', 1, 0, NULL),
(24, '', 'frfrff@grgrra', '123', '3278972904', 0, '0', 1, 0, NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indici per le tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id_delivery_man`),
  ADD KEY `id_user` (`id_user`);

--
-- Indici per le tabelle `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`);

--
-- Indici per le tabelle `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_product` (`id_product`);

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Indici per le tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_shop_seller` (`id_shop_seller`),
  ADD KEY `fk_id_category` (`id_category`),
  ADD KEY `fk_product_image` (`product_image`);

--
-- Indici per le tabelle `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `id_shop_category` (`id_shop_category`),
  ADD KEY `image_path` (`image_path`);

--
-- Indici per le tabelle `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indici per le tabelle `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id_shop`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT per la tabella `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id_delivery_man` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `images`
--
ALTER TABLE `images`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `options`
--
ALTER TABLE `options`
  MODIFY `id_option` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT per la tabella `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `shops`
--
ALTER TABLE `shops`
  MODIFY `id_shop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Limiti per la tabella `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Limiti per la tabella `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Limiti per la tabella `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_id_category` FOREIGN KEY (`id_category`) REFERENCES `products_categories` (`id_category`),
  ADD CONSTRAINT `fk_product_image` FOREIGN KEY (`product_image`) REFERENCES `images` (`id_image`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_shop_seller`) REFERENCES `shops` (`id_shop`);

--
-- Limiti per la tabella `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_ibfk_1` FOREIGN KEY (`id_shop_category`) REFERENCES `shops` (`id_shop`),
  ADD CONSTRAINT `products_categories_ibfk_2` FOREIGN KEY (`image_path`) REFERENCES `images` (`id_image`);

--
-- Limiti per la tabella `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id_shop`);

--
-- Limiti per la tabella `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
