-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:04:40
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
-- Estructura de tabla para la tabla `purchases_order`
--

CREATE TABLE `purchases_order` (
  `purchase_order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `terms` varchar(255) NOT NULL,
  `ship_via` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `includes_tax` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `purchases_order`
--

INSERT INTO `purchases_order` (`purchase_order_id`, `created_at`, `terms`, `ship_via`, `status`, `note`, `employee_id`, `supplier_id`, `subtotal`, `tax`, `total`, `includes_tax`, `currency_id`) VALUES
(1, '2017-06-24 18:03:44', 'Contado', 'DHL', 0, 'Urge el pedido', 1, 1, 58, 10.44, 68.44, 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `purchases_order`
--
ALTER TABLE `purchases_order`
  ADD PRIMARY KEY (`purchase_order_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `purchases_order`
--
ALTER TABLE `purchases_order`
  MODIFY `purchase_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
