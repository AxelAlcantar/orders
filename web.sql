-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2022 a las 05:29:34
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web`
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
(1, '01', 'yant & marc QuerÃ©taro', 'PeÃ±a pobre #2', '4424673761 ', 2, 1);

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
(1, 'yant & marc', 'PeÃ±a pobre #2', 'QuerÃ©taro de Arteaga', '76116', ' QuerÃ©taro', 484, '4424673761 ', 'marcyant69@gmail.com', 'Panificadora ', 'MAMM690803CG', 16, 28, 11, '2015-11-21 11:00:00', 'img/logo/Logo YANT & MARC.png', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` char(40) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `date_added`) VALUES
(1, 'Tradicional', 1, '2022-02-15 16:12:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `work_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `created_at`, `name`, `address1`, `city`, `state`, `postal_code`, `country_id`, `work_phone`, `website`, `tax_number`) VALUES
(1, '2022-02-15 22:12:29', 'MiscelÃ¡nea MarÃ­a', '1ra de Mayo', 'Acambaro', 'Acambaro', '38700', 484, '417 172 3402', 'N/A', 'G352G1TF'),
(2, '2022-02-18 02:17:22', 'MiscelÃ¡nea Caro', 'NiÃ±o artillero #8', 'Acambaro', 'Acambaro', '38977', 484, '4175678756', 'N/A', '34567GR4S3X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts_clients`
--

CREATE TABLE `contacts_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contacts_clients`
--

INSERT INTO `contacts_clients` (`id`, `client_id`, `first_name`, `last_name`, `email`, `phone`) VALUES
(1, 1, 'MarÃ­a', 'PÃ©rez', 'maria@gmail.com', '662 470 5638'),
(2, 2, 'Pedro', 'Maldonado', 'avenidamisvisnes2@hotmail.com', '662 470 5638');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `capital` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `citizenship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_sub_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_3166_2` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso_3166_3` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `region_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sub_region_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eea` tinyint(1) NOT NULL DEFAULT '0',
  `swap_postal_code` tinyint(1) NOT NULL DEFAULT '0',
  `swap_currency_symbol` tinyint(1) NOT NULL DEFAULT '0',
  `thousand_separator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `capital`, `citizenship`, `country_code`, `currency`, `currency_code`, `currency_sub_unit`, `full_name`, `iso_3166_2`, `iso_3166_3`, `name`, `region_code`, `sub_region_code`, `eea`, `swap_postal_code`, `swap_currency_symbol`, `thousand_separator`, `decimal_separator`) VALUES
(484, 'Mexico City', 'Mexican', '484', 'Mexican peso', 'MXN', 'centavo', 'United Mexican States', 'MX', 'MEX', 'Mexico', '019', '013', 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `code`) VALUES
(1, 'Dolares estadounidenses', '$', '2', ',', '.', 'USD'),
(28, 'Pesos Mexicanos', '$', '2', ',', '.', 'MXN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `product_quantity` int(5) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `name` char(40) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `status`, `date_added`) VALUES
(1, 'yant & marc', 1, '2022-02-15 16:12:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL,
  `nombre_modulo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `nombre_modulo`) VALUES
(1, 'Inicio'),
(3, 'Productos'),
(4, 'Fabricantes'),
(6, 'Proveedores'),
(8, 'Reportes'),
(9, 'Configuracion'),
(10, 'Usuarios'),
(11, 'Permisos'),
(15, 'Sucursales'),
(24, 'Categorias'),
(27, 'Pedidos');

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
  `stock` bigint(20) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `production_price` double DEFAULT NULL,
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

INSERT INTO `products` (`product_id`, `product_code`, `model`, `product_name`, `note`, `status`, `stock`, `manufacturer_id`, `category_id`, `production_price`, `selling_price`, `profit`, `presentation`, `created_at`, `image_path`, `is_service`) VALUES
(1, '1', 'Dulce', 'Cocha', '100 g', 1, 9, 1, 1, 8.33, 10, 20, 'Bolsa', '2022-02-15 16:12:59', 'img/productos/1644963213_Concha+Blanca.png', 0),
(2, '2', 'Dulce', 'Pan de muerto', '200 g', 1, 9, 1, 1, 12, 12.96, 8, 'Bolsa', '2022-02-18 10:53:51', 'img/productos/1645203273_ELG_panCidra_Familiar_1080x1080-copia.jpg', 0),
(3, '3', 'Dulce', 'Pan de pipas', '200 g', 1, 9, 1, 1, 12, 12.48, 4, 'Bolsa', '2022-03-06 23:58:24', 'img/productos/1646632730_Barritas-de-pipas-pan-tostado-especial.jpg', 0),
(4, '4', 'Dulce', 'Acambarita', '300 g', 1, 11, 1, 1, 10, 10.2, 2, 'Bolsa', '2022-03-11 21:58:54', 'img/productos/1647057555_dia-mundial-pan-deleitan-acambaritas-paladares-guanajuato-mexico.jpg_1359985867.jpg', 0);

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
  `client_id` int(11) DEFAULT NULL,
  `subtotal` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `includes_tax` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `purchases_order`
--

INSERT INTO `purchases_order` (`purchase_order_id`, `created_at`, `terms`, `ship_via`, `status`, `note`, `employee_id`, `client_id`, `subtotal`, `tax`, `total`, `includes_tax`, `currency_id`) VALUES
(1, '2022-02-17 13:05:38', 'Efectivo', 'Alan', 0, 'Centro', 2, 1, 8.62, 1.38, 10, 1, 28),
(2, '2022-02-17 13:24:12', 'Efectivo', 'Roberto', 2, 'Centro', 2, 1, 10, 1.6, 11.6, 0, 28),
(3, '2022-02-17 20:32:29', 'Efectivo', 'JosÃ©', 1, 'Centro', 2, 2, 19.79, 3.17, 22.96, 1, 28),
(4, '2022-03-06 23:59:29', 'Tarjeta de crÃ©dito/debito', 'Axel', 0, 'Centro', 2, 1, 39.34, 6.3, 45.64, 1, 28);

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
(6, 1, 1, 1, 10, 1, 1, 0, ''),
(5, 2, 1, 1, 10, 1, 1, 0, ''),
(7, 3, 1, 1, 10, 1, 1, 0, ''),
(8, 3, 2, 1, 12.96, 1, 1, 0, ''),
(9, 4, 1, 1, 10, 1, 1, 0, ''),
(10, 4, 2, 1, 12.96, 1, 1, 0, ''),
(11, 4, 3, 1, 12.48, 1, 1, 0, ''),
(12, 4, 4, 1, 10.2, 1, 1, 0, '');

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
(11, 'America/Mexico_City'),
(12, 'America/Monterrey');

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
(2, 'Roberto Villafuerte', 'admin', '$2y$10$OSOUqhZjJ9jg12v0sS2f..aPgdOfgIFgxu2yLgSO0zKGPT4UBSg9e', 'AxelA@gmail.com', '2022-02-13 20:03:02', 2, 1);

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
(2, 'Super Usuario', 'Inicio,1,1,1;Productos,1,1,1;Fabricantes,1,1,1;Clientes,1,1,1;Reportes,0,0,0;Configuracion,1,1,1;Usuarios,1,1,1;Permisos,1,1,1;Sucursales,1,1,1;Categorias,1,1,1;Pedidos,1,1,1;', '2022-02-15 18:06:57');

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
-- Indices de la tabla `business_profile`
--
ALTER TABLE `business_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_country_id_foreign` (`country_id`);

--
-- Indices de la tabla `contacts_clients`
--
ALTER TABLE `contacts_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_client_id_index` (`client_id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indices de la tabla `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_code` (`product_code`),
  ADD KEY `fk_manufacturer_id` (`manufacturer_id`);

--
-- Indices de la tabla `purchases_order`
--
ALTER TABLE `purchases_order`
  ADD PRIMARY KEY (`purchase_order_id`);

--
-- Indices de la tabla `purchase_order_product`
--
ALTER TABLE `purchase_order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_cotizacion` (`purchase_order_id`,`product_id`);

--
-- Indices de la tabla `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `fk_user_group_id` (`user_group_id`);

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
-- AUTO_INCREMENT de la tabla `branch_offices`
--
ALTER TABLE `branch_offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `business_profile`
--
ALTER TABLE `business_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `contacts_clients`
--
ALTER TABLE `contacts_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;
--
-- AUTO_INCREMENT de la tabla `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `purchases_order`
--
ALTER TABLE `purchases_order`
  MODIFY `purchase_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `purchase_order_product`
--
ALTER TABLE `purchase_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `skins`
--
ALTER TABLE `skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user_group`
--
ALTER TABLE `user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
