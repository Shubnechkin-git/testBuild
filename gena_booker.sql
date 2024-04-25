-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 25 2024 г., 22:33
-- Версия сервера: 8.0.19
-- Версия PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gena_booker`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` text NOT NULL,
  `category` text NOT NULL,
  `count` int NOT NULL,
  `price` float NOT NULL,
  `total_price` float NOT NULL,
  `table_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `product_name`, `category`, `count`, `price`, `total_price`, `table_name`) VALUES
(303, 70, 1, 'Товар 1', 'Популярные товары', 1, 3000, 3000, 'items'),
(304, 70, 2, 'Товар 2', 'Популярные товары', 1, 4000, 4000, 'items'),
(306, 70, 2, 'Товар 2', 'Новинки', 1, 2343, 2343, 'novelty'),
(438, 97, 2, 'Товар 2', 'Популярные товары', 1, 4000, 4000, 'items'),
(439, 97, 3, 'Товар 3', 'Популярные товары', 2, 6900, 13800, 'items'),
(441, 97, 5, 'Товар 5', 'Популярные товары', 3, 10000, 30000, 'items'),
(444, 98, 1, 'Товар 1', 'Популярные товары', 1, 3000, 3000, 'items');

-- --------------------------------------------------------

--
-- Структура таблицы `discounts`
--

CREATE TABLE `discounts` (
  `id` int NOT NULL,
  `title` text,
  `price` int DEFAULT NULL,
  `img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `discounts`
--

INSERT INTO `discounts` (`id`, `title`, `price`, `img`) VALUES
(1, 'Товар 1', 2000, 'https://mamcupy.com/images/menu-mobile/prod.png'),
(2, 'Товар 2', 2500, 'https://mamcupy.com/upload/resize_cache/iblock/b58/600_600_240cd750bba9870f18aada2478b24840a/b585e1a7341724cab1356d513d6ad33f.jpg'),
(3, 'Товар 3', 3465, 'https://mamcupy.com/upload/resize_cache/iblock/aff/600_600_240cd750bba9870f18aada2478b24840a/aff2e716c11517acb903c0385a1f5e5a.jpg'),
(4, 'Товар 4', 8900, 'https://mamcupy.com/upload/resize_cache/iblock/109/600_600_240cd750bba9870f18aada2478b24840a/1096ef60f61a3c18c5c41e8f8f97d6f0.jpg'),
(5, 'Товар 5', 2356, 'https://mamcupy.com/upload/resize_cache/iblock/0dc/600_600_240cd750bba9870f18aada2478b24840a/0dce44249247967a457a647a341f43bd.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `title` text,
  `price` int DEFAULT NULL,
  `img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `title`, `price`, `img`) VALUES
(1, 'Товар 1', 3000, 'https://mamcupy.com/images/menu-mobile/contact.png?v=1'),
(2, 'Товар 2', 4000, 'https://mamcupy.com/images/menu-mobile/delivery.png'),
(3, 'Товар 3', 6900, 'https://mamcupy.com/images/menu-mobile/faq.png'),
(4, 'Товар 4', 7000, 'https://mamcupy.com/images/menu-mobile/help.png'),
(5, 'Товар 5', 10000, 'https://mamcupy.com/images/menu-mobile/outlets.png');

-- --------------------------------------------------------

--
-- Структура таблицы `novelty`
--

CREATE TABLE `novelty` (
  `id` int NOT NULL,
  `title` text,
  `price` int DEFAULT NULL,
  `img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `novelty`
--

INSERT INTO `novelty` (`id`, `title`, `price`, `img`) VALUES
(1, 'Товар 1', 3560, 'https://mamcupy.com/upload/resize_cache/iblock/0df/600_600_240cd750bba9870f18aada2478b24840a/0df8a28e9259546f0a533069345a7422.jpg'),
(2, 'Товар 2', 2343, 'https://mamcupy.com/upload/resize_cache/iblock/432/600_600_240cd750bba9870f18aada2478b24840a/432833cab812f4034685fa4704ac99a4.jpg'),
(3, 'Товар 3', 5667, 'https://mamcupy.com/upload/resize_cache/iblock/181/600_600_240cd750bba9870f18aada2478b24840a/1812e4954e65862a38b32a65e586a172.jpg'),
(4, 'Товар 4', 9887, 'https://mamcupy.com/upload/resize_cache/iblock/432/600_600_240cd750bba9870f18aada2478b24840a/432833cab812f4034685fa4704ac99a4.jpg'),
(5, 'Товар 5', 4667, 'https://mamcupy.com/upload/resize_cache/iblock/444/600_600_240cd750bba9870f18aada2478b24840a/444f20329acf0a08a1ce841af5873415.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `price` int NOT NULL,
  `category` text NOT NULL,
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `test` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `category`, `img`, `test`) VALUES
(1, 'Title 1', 3000, 'Худи', 'https://mamcupy.com/upload/resize_cache/iblock/9c5/602_401_240cd750bba9870f18aada2478b24840a/9c52c4b4d109dd27ece0574eb82f7447.jpg', ''),
(2, 'Title 2', 2500, 'Футболки', 'https://mamcupy.com/upload/resize_cache/iblock/5ab/602_401_240cd750bba9870f18aada2478b24840a/5abbccd18e6d2c482a575dabe6ca030f.jpg', '');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `navbar` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `background` varchar(7) NOT NULL,
  `footer` varchar(7) NOT NULL,
  `text_color` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`navbar`, `background`, `footer`, `text_color`) VALUES
('#f03d3d', '#efc2c2', '#8c9be8', '#00ccff');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sessionId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `number`, `sessionId`, `isAdmin`) VALUES
(70, 'Ivan', 'Ivan', 'ewsfewfre@mail.ru', '+7 (343) 543-5344', 'bbbafa27-1464-4914-b466-c034bb675654', 0),
(84, 'Amin', '12345678', 'dfghdfjg@mail.ru', '+7 (232) 323-2323', '4f855ead-2a6f-43d7-86b2-ac2e03e9a224', 0),
(85, 'Ivan24', '12345678', 'ывыаываыва@mail.ru', '+7 (232) 453-2323', 'a86702e1-4f7e-4368-a562-b0e385b8d81f', 0),
(86, 'Ivan245', '12345678', 'sdfsdfsdfsdf@maui.ru', '+7 (546) 658-7897', 'a8478c39-a2c4-4f0e-947d-f783da4f131b', 0),
(87, 'Ivan2456', '12345678', 'weqwerre@mail.ru', '+7 (232) 323-3323', 'ec911172-80a4-4f12-98e2-c25fca349370', 0),
(88, 'Ivan24568', '12345678', 'eewrwerewe4@mail.ru', '+7 (232) 346-2323', '6bf9a395-d7fb-4003-9f47-2695db0a15d6', 0),
(89, 'Ivan245689', '12345678', 'sfjhgdsg@mail.ru', '+7 (879) 756-5756', '12ef3426-61b4-47ba-8699-9a576ecca4cc', 0),
(90, 'danilsdf', 'GrS-dX7-6Ju-EWx', 'dabgfjhhgf@mail.ru', '+7 (333) 423-4324', '5526c3b1-d00e-4767-8cc4-cd36119e27b9', 0),
(91, 'Amin3', 'ABC-YSG-dH3-Sxh', 'amin@mail.ru', '+7 (343) 434-3434', '3d2fa7ad-c045-419b-bfbc-81c2dc297f3c', 0),
(92, 'Ivan24563', '6hm-E3Y-Zg5-8fp', 'weqwerwre@mail.ru', '+7 (232) 343-3323', '82a5e5d3-7751-4d98-8c17-f502d1586263', 0),
(93, 'Ivan2456893', 'mRG-DSd-4ue-Qbb', 'sfjhgfdsg@mail.ru', '+7 (879) 756-4756', '51575309-74e1-46ba-81e4-a676497068dc', 0),
(94, 'Ivan245556893', '65D-wMT-UPE-LwQ', 'sfjhgdfhhhhdfsfg@mail.ru', '+7 (879) 756-3767', 'cc2b0a90-b9d7-4389-8946-e12fee3b9f6a', 0),
(95, 'ываываыв', 'qTJ-j9N-dpQ-vjj', 'asdasdaывавы3s@mail.ru', '+7 (324) 345-4565', '9e30febe-7e3e-49a7-8353-51e9f471627d', 0),
(96, 'asdasdasd', 'gde-XQ6-G9w-ujL', 'adsdasdasdas@mail.rt', '+7 (343) 434-3433', '0aeff617-12b9-4917-a9e5-40aa2857ef4f', 0),
(97, 'danilsdf32324', 'fTZ-5HC-Pc5-79t', 'dasasdads@mail.ru', '+7 (223) 232-3233', 'f1a3230a-2a37-4199-ad6b-68dc2f46c4b5', 0),
(98, 'Test', 'jRy-Wk6-2xW-TxP', 'danilka-2323@mail.ru', '+7 (922) 511-3433', 'c21a14ed-e623-40d1-88ff-1be5353ebd3c', 0),
(99, 'admin', 'admin', 'admin@example.com', 'xxxxxxxxxxxxxx', 'fc183b26-5eb7-454a-8840-61e4b03d6f1c', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_user_product_index` (`user_id`,`product_id`,`table_name`) USING BTREE;

--
-- Индексы таблицы `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `novelty`
--
ALTER TABLE `novelty`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT для таблицы `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `novelty`
--
ALTER TABLE `novelty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
