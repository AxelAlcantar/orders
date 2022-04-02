-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2017 a las 01:59:48
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
-- Estructura de tabla para la tabla `user_group`
--

CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `permission` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`, `date_added`) VALUES
(1, 'Super Administrador', 'Inicio,1,1,1;Compras,1,1,1;Productos,1,1,1;Fabricantes,1,1,1;Clientes,1,1,1;Proveedores,1,1,1;Ventas,1,1,1;Reportes,1,1,1;Configuracion,1,1,1;Usuarios,1,1,1;Permisos,1,1,1;Cotizaciones,1,1,1;Ordenes,1,1,1;Servicios,1,1,1;Sucursales,1,1,1;Documentos,1,1,1;Tirajes,1,1,1;Cajas,1,1,1;Cortes,1,1,1;Egresos,1,1,1;Traslados,1,1,1;Ajustes,1,1,1;Tecnicos,1,1,1;Categorias,1,1,1;Formas_pago,1,1,1;Guias,1,1,1;', '2016-09-12 18:06:57'),
(2, 'Vendedores', 'Inicio,1,1,1;Compras,1,1,1;Productos,1,1,1;Fabricantes,1,1,1;Clientes,1,1,1;Proveedores,1,1,1;Ventas,1,1,1;Reportes,1,1,1;Configuracion,0,0,0;Usuarios,0,0,0;Permisos,0,0,0;Cotizaciones,1,1,1;Ordenes,1,1,1;Servicios,1,1,1;Sucursales,1,0,0;Documentos,0,0,0;Tirajes,0,0,0;Cajas,1,1,1;Cortes,1,1,1;Egresos,1,1,1;Traslados,1,1,1;Ajustes,1,1,1;Tecnicos,0,0,0;Categorias,1,1,1;Formas_pago,1,1,1;Guias,1,1,1;', '2017-05-29 19:38:46'),
(3, 'Administrador', 'Inicio,1,1,1;Compras,1,1,1;Productos,1,1,1;Fabricantes,1,1,1;Clientes,1,1,1;Proveedores,1,1,1;Ventas,1,1,1;Reportes,1,1,1;Configuracion,1,1,1;Usuarios,0,0,0;Permisos,1,1,1;Cotizaciones,1,1,1;Ordenes,1,1,1;Servicios,1,1,1;Sucursales,1,1,1;Documentos,1,1,1;Tirajes,1,1,1;Cajas,1,1,1;Cortes,1,1,1;Egresos,1,1,1;Traslados,1,1,1;Ajustes,1,1,1;Tecnicos,1,1,1;Categorias,1,1,1;Formas_pago,1,1,1;Guias,1,1,1;', '2017-05-29 19:40:22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_group_id` (`user_group_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `user_group`
--
ALTER TABLE `user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
