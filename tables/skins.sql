-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:03:30
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
-- Estructura de tabla para la tabla `skins`
--

CREATE TABLE `skins` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `skins`
--

INSERT INTO `skins` (`id`, `name`, `value`) VALUES
(1, 'Negro claro', 'skin-black'),
(2, 'Azul', 'skin-blue'),
(3, 'P&uacute;rpura', 'skin-purple'),
(4, 'Rojo', 'skin-red'),
(5, 'Verde', 'skin-green'),
(6, 'Amarillo', 'skin-yellow'),
(7, 'Azul claro', 'skin-blue-light'),
(8, 'Blanco', 'skin-black-light'),
(9, 'P&uacute;rpura claro', 'skin-purple-light'),
(10, 'Verde claro', 'skin-green-light'),
(11, 'Amarillo claro', 'skin-yellow-light'),
(12, 'Rojo claro', 'skin-red-light');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `skins`
--
ALTER TABLE `skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
