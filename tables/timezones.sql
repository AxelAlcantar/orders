-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 02:01:42
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
-- Estructura de tabla para la tabla `timezones`
--

CREATE TABLE `timezones` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `timezones`
--

INSERT INTO `timezones` (`id`, `name`) VALUES
(1, 'America/Guatemala'),
(2, 'US/Samoa'),
(3, 'US/Hawaii'),
(4, 'US/Alaska'),
(5, 'US/Pacific'),
(6, 'America/Tijuana'),
(7, 'US/Arizona'),
(8, 'US/Mountain'),
(9, 'America/Chihuahua'),
(10, 'America/Mazatlan'),
(11, 'America/Mexico_City'),
(12, 'America/Monterrey'),
(13, 'Canada/Saskatchewan'),
(14, 'US/Central'),
(15, 'US/Eastern'),
(16, 'US/East-Indiana'),
(17, 'America/Bogota'),
(18, 'America/Lima'),
(19, 'America/Caracas'),
(20, 'Canada/Atlantic'),
(21, 'America/La_Paz'),
(22, 'America/Santiago'),
(23, 'Canada/Newfoundland'),
(24, 'America/Buenos_Aires'),
(25, 'Greenland'),
(26, 'Atlantic/Stanley'),
(27, 'Atlantic/Azores'),
(28, 'Atlantic/Cape_Verde'),
(29, 'Africa/Casablanca'),
(30, 'Europe/Dublin'),
(31, 'Europe/Lisbon'),
(32, 'Europe/London'),
(33, 'Africa/Monrovia'),
(34, 'Europe/Amsterdam'),
(35, 'Europe/Belgrade'),
(36, 'Europe/Berlin'),
(37, 'Europe/Bratislava'),
(38, 'Europe/Brussels'),
(39, 'Europe/Budapest'),
(40, 'Europe/Copenhagen'),
(41, 'Europe/Ljubljana'),
(42, 'Europe/Madrid'),
(43, 'Europe/Paris'),
(44, 'Europe/Prague'),
(45, 'Europe/Rome'),
(46, 'Europe/Sarajevo'),
(47, 'Europe/Skopje'),
(48, 'Europe/Stockholm'),
(49, 'Europe/Vienna'),
(50, 'Europe/Warsaw'),
(51, 'Europe/Zagreb'),
(52, 'Europe/Athens'),
(53, 'Europe/Bucharest'),
(54, 'Africa/Cairo'),
(55, 'Africa/Harare'),
(56, 'Europe/Helsinki'),
(57, 'Europe/Istanbul'),
(58, 'Asia/Jerusalem'),
(59, 'Europe/Kiev'),
(60, 'Europe/Minsk'),
(61, 'Europe/Riga'),
(62, 'Europe/Sofia'),
(63, 'Europe/Tallinn'),
(64, 'Europe/Vilnius'),
(65, 'Asia/Baghdad'),
(66, 'Asia/Kuwait'),
(67, 'Africa/Nairobi'),
(68, 'Asia/Riyadh'),
(69, 'Asia/Tehran'),
(70, 'Europe/Moscow'),
(71, 'Asia/Baku'),
(72, 'Europe/Volgograd'),
(73, 'Asia/Muscat'),
(74, 'Asia/Tbilisi'),
(75, 'Asia/Yerevan'),
(76, 'Asia/Kabul'),
(77, 'Asia/Karachi'),
(78, 'Asia/Tashkent'),
(79, 'Asia/Kolkata'),
(80, 'Asia/Kathmandu'),
(81, 'Asia/Yekaterinburg'),
(82, 'Asia/Almaty'),
(83, 'Asia/Dhaka'),
(84, 'Asia/Novosibirsk'),
(85, 'Asia/Bangkok'),
(86, 'Asia/Ho_Chi_Minh'),
(87, 'Asia/Jakarta'),
(88, 'Asia/Krasnoyarsk'),
(89, 'Asia/Chongqing'),
(90, 'Asia/Hong_Kong'),
(91, 'Asia/Kuala_Lumpur'),
(92, 'Australia/Perth'),
(93, 'Asia/Singapore'),
(94, 'Asia/Taipei'),
(95, 'Asia/Ulaanbaatar'),
(96, 'Asia/Urumqi'),
(97, 'Asia/Irkutsk'),
(98, 'Asia/Seoul'),
(99, 'Asia/Tokyo'),
(100, 'Australia/Adelaide'),
(101, 'Australia/Darwin'),
(102, 'Asia/Yakutsk'),
(103, 'Australia/Brisbane'),
(104, 'Australia/Canberra'),
(105, 'Pacific/Guam'),
(106, 'Australia/Hobart'),
(107, 'Australia/Melbourne'),
(108, 'Pacific/Port_Moresby'),
(109, 'Australia/Sydney'),
(110, 'Asia/Vladivostok'),
(111, 'Asia/Magadan'),
(112, 'Pacific/Auckland'),
(113, 'Pacific/Fiji'),
(114, 'America/El_Salvador'),
(115, 'America/Costa_Rica');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
