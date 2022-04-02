-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:02:19
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
-- Estructura de tabla para la tabla `business_profile`
--

CREATE TABLE `business_profile` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country_id` int(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `industry` varchar(150) NOT NULL,
  `number_id` varchar(12) NOT NULL,
  `tax` int(2) NOT NULL,
  `currency_id` int(10) NOT NULL,
  `timezone_id` int(10) NOT NULL,
  `date_added` datetime NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `business_profile`
--

INSERT INTO `business_profile` (`id`, `name`, `address`, `city`, `postal_code`, `state`, `country_id`, `phone`, `email`, `industry`, `number_id`, `tax`, `currency_id`, `timezone_id`, `date_added`, `logo_url`, `skin_id`) VALUES
(1, 'La casa de los Tiradores SRL', 'Av. Pachacutec Mz G Lt 03 Parque Industrial ', 'Villa El Salvador', '20085', 'Lima', 604, '01-2534885', 'jhorepo86@gmail.com', 'Ferreteria', '20524244960', 18, 1, 18, '2015-11-21 11:00:00', 'img/logo/your_logo.png', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `business_profile`
--
ALTER TABLE `business_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `business_profile`
--
ALTER TABLE `business_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
