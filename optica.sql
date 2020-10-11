-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2020 a las 13:46:48
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `adreça_postal` varchar(50) DEFAULT NULL,
  `telefon` int(11) DEFAULT NULL,
  `mail` varchar(40) DEFAULT NULL,
  `data_registre` date DEFAULT NULL,
  `id_amic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `cognom` varchar(20) DEFAULT NULL,
  `ullera_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `adreça` varchar(100) DEFAULT NULL,
  `telefon` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `NIF` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `ullera_id` int(11) NOT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `grad_dreta` int(11) DEFAULT NULL,
  `grad_esquerra` int(11) DEFAULT NULL,
  `montura` varchar(15) DEFAULT NULL,
  `color_mont` varchar(15) DEFAULT NULL,
  `color_vidre_dreta` varchar(15) DEFAULT NULL,
  `color_vidre_esq` varchar(15) DEFAULT NULL,
  `preu` int(11) DEFAULT NULL,
  `id_proveidor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`),
  ADD KEY `ullera_id` (`ullera_id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`ullera_id`),
  ADD KEY `id_proveidor` (`id_proveidor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD CONSTRAINT `empleats_ibfk_1` FOREIGN KEY (`ullera_id`) REFERENCES `ulleres` (`ullera_id`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidors` (`id_proveidor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
