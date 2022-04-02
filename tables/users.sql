-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 01:59:24
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
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `fullname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `user_name`, `user_password_hash`, `user_email`, `date_added`, `user_group_id`, `status`) VALUES
(1, 'Jhonny Reque Porras', 'admin', '$2y$10$.McIBQLeVXhPg4RI7Um83ul1jugVd/1GID581WbWr7s1uVb6CVdNO', 'jreque@recomsac.com', '2017-05-29 20:03:02', 1, 1),
(2, 'Eder HuamÃ¡n Sulluchuco', 'ehuaman', '$2y$10$4MxshnkPYpApFdanAP8nNe6T7OHoP2N9eyiVRJbokg7vGlwPigkFO', 'ehuaman@gmail.com', '2017-05-29 19:36:33', 2, 1),
(3, 'Janet Panayfo', 'jpanayfo', '$2y$10$5qKRUjA0FeqzaRHdezLmc.QTmO/y0DcVvIM5Aa6ejDCIgwOFkUgTO', 'jpanayfo@gmail.com', '2017-05-29 19:53:49', 2, 1),
(4, 'Elena Caulla', 'ecaulla', '$2y$10$qOjTZlQbEW7kgy19MM1feOEyldJLwu9fWU1xozVnLulDpmwTUvOqG', 'ecaulla@gmail.com', '2017-05-29 20:04:01', 2, 1),
(5, 'Joshias Espinoza', 'jespinoza', '$2y$10$grKVGpO1kBamH8ReWDxORefI/QBrTQfUTaRdwzSQ3on3AZsx8S8Za', 'jespinoza@gmail.com', '2017-05-29 20:06:01', 2, 1),
(6, 'CÃ©sar Paredes Salas', 'cparedes', '$2y$10$/qAT4T.aUj54l1o4hkKIbOwhMp5QZrWCYuDfYKBa7HOkVwmWQw2.2', 'cparedes@gmail.com', '2017-05-30 07:30:51', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `fk_user_group_id` (`user_group_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
