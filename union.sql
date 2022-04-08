-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2022 a las 19:03:54
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `union`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `paterno` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `materno` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `tipo_doc` int(1) NOT NULL,
  `doc_identidad` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `genero` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `paterno`, `materno`, `tipo_doc`, `doc_identidad`, `fecha_nac`, `genero`) VALUES
(1, 'Erik', 'Maquera', 'Cañasto', 3, '8286974', '1991-10-06', 1),
(2, 'Rosario', 'Quispe', 'Alanoca', 3, '10093622', '1996-01-05', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `tipo_prod` int(1) DEFAULT NULL,
  `num_cuenta` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `moneda` char(2) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `sucursal` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `id_cliente`, `tipo_prod`, `num_cuenta`, `moneda`, `monto`, `fecha_creacion`, `sucursal`) VALUES
(1, 1, 1, '10000010563225', 'BS', '10000.00', '2022-04-05', 1),
(2, 1, 2, '10000010885412', 'US', '15000.00', '2022-04-06', 1),
(3, 2, 1, '10000020523652', 'BS', '18000.00', '2022-04-07', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ic` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `fk_ic` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
