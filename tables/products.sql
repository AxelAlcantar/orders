-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:13:05
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventory_jhonny`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '0=Inactive,1=Active',
  `manufacturer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `buying_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `profit` int(4) DEFAULT NULL,
  `presentation` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `image_path` varchar(300) NOT NULL,
  `is_service` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `model`, `product_name`, `note`, `status`, `manufacturer_id`, `category_id`, `buying_price`, `selling_price`, `profit`, `presentation`, `created_at`, `image_path`, `is_service`) VALUES
(1, '1', 'Modelo01', 'Producto01', '', 1, 1, 1, 26, 31.2, 20, 'Presentacion01', '2017-05-30 10:26:04', 'img/productos/1496158151_450_ds-2ce16d1t-it5_1.png', 0),
(2, '2', 'Modelo02', 'Producto02', '', 1, 2, 2, 15, 18, 20, 'Presentacion02', '2017-05-30 10:28:33', 'img/productos/1496158256_2000354524762_2.jpg', 0),
(3, '3', 'Modelo03', 'Producto03', '', 1, 3, 3, 30, 37.5, 25, 'Presentacion03', '2017-05-30 10:30:21', 'img/productos/1496158313_Sirena30.jpg', 0),
(4, '1496158265-5', '', '', '', 1, 0, 0, 0, 0, NULL, NULL, '2017-05-30 10:31:05', 'img/productos/horneando.png', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_code` (`product_code`),
  ADD KEY `fk_manufacturer_id` (`manufacturer_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
