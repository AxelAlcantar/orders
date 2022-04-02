-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:04:49
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
-- Estructura de tabla para la tabla `purchase_order_product`
--

CREATE TABLE `purchase_order_product` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `branch_id` int(11) NOT NULL,
  `oc` tinyint(1) NOT NULL DEFAULT '1',
  `qty_rec` int(11) NOT NULL,
  `status_oc` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `purchase_order_product`
--

INSERT INTO `purchase_order_product` (`id`, `purchase_order_id`, `product_id`, `qty`, `unit_price`, `branch_id`, `oc`, `qty_rec`, `status_oc`) VALUES
(1, 1, 1, 2, 29, 1, 1, 0, 'entregado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `purchase_order_product`
--
ALTER TABLE `purchase_order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_cotizacion` (`purchase_order_id`,`product_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `purchase_order_product`
--
ALTER TABLE `purchase_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
