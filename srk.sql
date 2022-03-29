-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2022 a las 04:09:53
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `srk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(7, 'Laptops', '2020-11-04 20:12:24'),
(8, 'Monitores', '2020-11-04 20:12:36'),
(9, 'PC', '2020-11-04 20:12:48'),
(10, 'Estabilizador', '2020-11-04 20:12:58'),
(11, 'Teclado', '2020-11-04 20:13:10'),
(12, 'Impresora', '2020-11-05 01:19:01'),
(13, 'Mouse', '2020-12-15 02:06:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` text COLLATE utf8_spanish_ci NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(23, 'Prueba', 12345678, 'prueba@prueba.com.pe', '(999) 999-999-999', 'Sistemas', '20/06/2021', 10, '2021-06-20 21:57:22', '2021-06-21 02:57:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(62, 7, '0002', 'Lenovo i8', 'vistas/img/productos/0002/432.jpg', 10, 1, 1, 3, '2021-06-21 02:57:22'),
(63, 8, '25214', 'Monitor DELL', 'vistas/img/productos/25214/191.png', 5, 1, 1, 7, '2021-06-21 02:57:00'),
(64, 9, '0003', 'Cooler Master', 'vistas/img/productos/0003/352.jpg', 15, 1, 1, 5, '2021-06-21 02:54:45'),
(65, 13, '00555', 'Mouse Logitech', 'vistas/img/productos/00555/279.png', 6, 1, 1, 8, '2022-03-29 02:07:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', 'vistas/img/usuarios/admin/540.png', 1, '2022-03-28 21:08:30', '2022-03-29 02:08:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`) VALUES
(55, 10006, 16, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"13\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"64\",\"descripcion\":\"Cooler Master\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 2, 2, 'Salida - N° Guía -25514', '2021-05-28 01:41:04'),
(56, 10007, 19, 1, '[{\"id\":\"64\",\"descripcion\":\"Cooler Master\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"10\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 2, 2, 'Salida - N° Guía -1025', '2021-05-28 01:48:43'),
(57, 10008, 15, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"11\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 1, 1, 'Salida - N° Guía -25550', '2021-06-09 18:30:22'),
(59, 10010, 16, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"64\",\"descripcion\":\"Cooler Master\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"8\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"62\",\"descripcion\":\"Lenovo i8\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 4, 4, 'Salida - N° Guía -1234567', '2021-06-10 01:04:28'),
(60, 10011, 23, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"8\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"64\",\"descripcion\":\"Cooler Master\",\"cantidad\":\"1\",\"stock\":\"13\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"7\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 3, 3, 'Salida - N° Guía -222222', '2021-06-21 00:18:40'),
(62, 10012, 23, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"64\",\"descripcion\":\"Cooler Master\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"8\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"62\",\"descripcion\":\"Lenovo i8\",\"cantidad\":\"1\",\"stock\":\"11\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 4, 4, 'Retorno  N° Guía -2500', '2021-06-21 02:54:45'),
(63, 10013, 15, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"8\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 1, 1, 'Retorno  N° Guía -2500', '2021-06-21 02:54:58'),
(64, 10014, 23, 1, '[{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"7\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 1, 1, 'Retorno  N° Guía -2500', '2021-06-21 02:55:17'),
(65, 10015, 16, 1, '[{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"6\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 1, 1, 'Salida - N° Guía -2500', '2021-06-21 02:56:45'),
(66, 10016, 19, 1, '[{\"id\":\"63\",\"descripcion\":\"Monitor DELL\",\"cantidad\":\"1\",\"stock\":\"5\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 1, 1, 'Salida - N° Guía -25005', '2021-06-21 02:57:00'),
(67, 10017, 23, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"7\",\"precio\":\"1\",\"total\":\"1\"},{\"id\":\"62\",\"descripcion\":\"Lenovo i8\",\"cantidad\":\"1\",\"stock\":\"10\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 2, 2, 'Salida - N° Guía -25444', '2021-06-21 02:57:22'),
(68, 10018, 16, 1, '[{\"id\":\"65\",\"descripcion\":\"Mouse Logitech\",\"cantidad\":\"1\",\"stock\":\"6\",\"precio\":\"1\",\"total\":\"1\"}]', 0, 1, 1, 'Salida - N° Guía -123456', '2022-03-29 02:07:29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
