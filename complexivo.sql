-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2022 a las 04:44:55
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `complexivo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_USER` int(11) NOT NULL,
  `NOM_USER` varchar(150) NOT NULL,
  `PASS_USER` varchar(50) NOT NULL,
  `ID_ROL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_USER`, `NOM_USER`, `PASS_USER`, `ID_ROL`) VALUES
(1, 'marco', '12345', 2),
(2, 'vinicio', '$2b$10$ItRZ2fJe8O4moBMWDkbsDeatixeRHnygxHoRBHI2gx/', 2),
(3, 'marco1', '12345', 2),
(5, 'vinicio', '12345', 2),
(7, 'mvat', '12345', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_tren`
--

CREATE TABLE `cliente_tren` (
  `ID_CTREN` int(11) NOT NULL,
  `ID_TREN` int(11) NOT NULL,
  `ID_CLI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL,
  `NOM_ROL` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_ROL`, `NOM_ROL`) VALUES
(1, 'Administrator'),
(2, 'Client');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tren`
--

CREATE TABLE `tren` (
  `ID_TREN` int(11) NOT NULL,
  `ASIENTOS_TREN` int(11) DEFAULT NULL,
  `VENDIDOS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tren`
--

INSERT INTO `tren` (`ID_TREN`, `ASIENTOS_TREN`, `VENDIDOS`) VALUES
(1, 50, 0),
(2, 60, 0),
(3, 70, 0),
(4, 80, 0),
(5, 90, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- Indices de la tabla `cliente_tren`
--
ALTER TABLE `cliente_tren`
  ADD PRIMARY KEY (`ID_CTREN`),
  ADD KEY `ID_TREN` (`ID_TREN`),
  ADD KEY `ID_CLI` (`ID_CLI`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indices de la tabla `tren`
--
ALTER TABLE `tren`
  ADD PRIMARY KEY (`ID_TREN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente_tren`
--
ALTER TABLE `cliente_tren`
  MODIFY `ID_CTREN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tren`
--
ALTER TABLE `tren`
  MODIFY `ID_TREN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `cliente_tren`
--
ALTER TABLE `cliente_tren`
  ADD CONSTRAINT `cliente_tren_ibfk_1` FOREIGN KEY (`ID_TREN`) REFERENCES `tren` (`ID_TREN`),
  ADD CONSTRAINT `cliente_tren_ibfk_2` FOREIGN KEY (`ID_CLI`) REFERENCES `cliente` (`ID_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
