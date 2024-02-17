-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 17 2024 г., 14:11
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
  `count` int NOT NULL,
  `price` float NOT NULL,
  `total_price` float NOT NULL,
  `table_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(2, 'Товар 2', 2500, 'https://mamcupy.com/upload/resize_cache/iblock/444/600_600_240cd750bba9870f18aada2478b24840a/444f20329acf0a08a1ce841af5873415.jpg'),
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
(1, 'Товар 1', 4566, 'https://mamcupy.com/upload/resize_cache/iblock/0df/600_600_240cd750bba9870f18aada2478b24840a/0df8a28e9259546f0a533069345a7422.jpg'),
(2, 'Товар 2', 2343, 'https://mamcupy.com/upload/resize_cache/iblock/103/600_600_240cd750bba9870f18aada2478b24840a/1032939cc44125e829910a184e6954f5.jpg'),
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
  `image` text NOT NULL,
  `test` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `category`, `image`, `test`) VALUES
(1, 'Title 1', 3000, 'Худи', 'https://mamcupy.com/upload/resize_cache/iblock/9c5/602_401_240cd750bba9870f18aada2478b24840a/9c52c4b4d109dd27ece0574eb82f7447.jpg', ''),
(2, 'Title 2', 2500, 'Футболки', 'https://mamcupy.com/upload/resize_cache/iblock/5ab/602_401_240cd750bba9870f18aada2478b24840a/5abbccd18e6d2c482a575dabe6ca030f.jpg', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` text NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mail` text NOT NULL,
  `number` text NOT NULL,
  `sessionId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `number`, `sessionId`) VALUES
(70, 'Ivan', 'Ivan', 'ewsfewfre@mail.ru', '+7 (343) 543-5344', 'c79bdef4-aace-4265-8751-a33803be1b67'),
(84, 'Amin', '12345678', 'dfghdfjg@mail.ru', '+7 (232) 323-2323', '471fe4c6-52a7-494b-a956-fee43a85ff6e'),
(85, 'Ivan24', '12345678', 'ывыаываыва@mail.ru', '+7 (232) 453-2323', 'a86702e1-4f7e-4368-a562-b0e385b8d81f'),
(86, 'Ivan245', '12345678', 'sdfsdfsdfsdf@maui.ru', '+7 (546) 658-7897', 'a8478c39-a2c4-4f0e-947d-f783da4f131b'),
(87, 'Ivan2456', '12345678', 'weqwerre@mail.ru', '+7 (232) 323-3323', 'ec911172-80a4-4f12-98e2-c25fca349370'),
(88, 'Ivan24568', '12345678', 'eewrwerewe4@mail.ru', '+7 (232) 346-2323', '6bf9a395-d7fb-4003-9f47-2695db0a15d6'),
(89, 'Ivan245689', '12345678', 'sfjhgdsg@mail.ru', '+7 (879) 756-5756', '12ef3426-61b4-47ba-8699-9a576ecca4cc'),
(90, 'danilsdf', 'GrS-dX7-6Ju-EWx', 'dabgfjhhgf@mail.ru', '+7 (333) 423-4324', '5526c3b1-d00e-4767-8cc4-cd36119e27b9'),
(91, 'Amin3', 'ABC-YSG-dH3-Sxh', 'amin@mail.ru', '+7 (343) 434-3434', 'e6d428e8-09d8-4e0f-81b5-5f2ded0a9b6e'),
(92, 'Ivan24563', '6hm-E3Y-Zg5-8fp', 'weqwerwre@mail.ru', '+7 (232) 343-3323', '82a5e5d3-7751-4d98-8c17-f502d1586263'),
(93, 'Ivan2456893', 'mRG-DSd-4ue-Qbb', 'sfjhgfdsg@mail.ru', '+7 (879) 756-4756', '51575309-74e1-46ba-81e4-a676497068dc'),
(94, 'Ivan245556893', '65D-wMT-UPE-LwQ', 'sfjhgdfhhhhdfsfg@mail.ru', '+7 (879) 756-3767', 'cc2b0a90-b9d7-4389-8946-e12fee3b9f6a');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

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
