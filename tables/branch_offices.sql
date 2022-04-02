-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:15:57
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
-- Estructura de tabla para la tabla `branch_offices`
--

CREATE TABLE `branch_offices` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `branch_offices`
--

INSERT INTO `branch_offices` (`id`, `code`, `name`, `address`, `phone`, `user_id`, `status`) VALUES
(1, 'ALMPRIN', 'Almacen Principal', 'Av. Pachacutec Mz G Lt 03 Parque Industrial - V.E.S', '01-2534885', 2, 1),
(2, 'Villa01', 'Villa 01', 'Av. Juan Velazco Alvarado Mz N Lt 04 Parque Industrial - V.E.S.', '964299753', 3, 1),
(3, 'Villa02', 'Villa 02', 'Av. El Sol Mz s/n V.E.S.', '966314780', 4, 1),
(4, 'Villa03', 'Villa 03', 'Cal Los Ebanistas Mz K1 Lt 08 Parque Industrial - V.E.S', '966313914', 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `branch_offices`
--
ALTER TABLE `branch_offices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_contacto` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `branch_offices`
--
ALTER TABLE `branch_offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
