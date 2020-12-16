-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-02-2020 a las 14:00:19
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `magotteaux`
--
CREATE DATABASE IF NOT EXISTS `magotteaux` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `magotteaux`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `564_cope`
--

CREATE TABLE IF NOT EXISTS `564_cope` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `564_cope`
--

INSERT INTO `564_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '-3999.9744', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `8888_cope`
--

CREATE TABLE IF NOT EXISTS `8888_cope` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `8888_cope`
--

INSERT INTO `8888_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '2260.36', '1243.84', '-1244.69', '80.15', '0.06', '-0.1', '0', '1', '1'),
(2, '2', 'NUMDEC', '5', '0', '2260.36', '1243.84', '-1244.69', '80.15', '0.06', '-0.1', '0', '1', '1'),
(3, '3', 'PIN1', '6', '6', '2260.35', '1243.84', '-1244.29', '80.15', '0.06', '-0.12', '0', '1', '1'),
(4, '4', 'PIN1', '6', '6', '2260.35', '1243.84', '-1244.29', '80.15', '0.06', '-0.12', '0', '1', '1'),
(5, '5', 'EHF', '2', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '70', '0.1', '1'),
(6, '6', 'EHF', '2', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '70', '0.1', '1'),
(7, '7', '6x4x8 ND sleeve', '3', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '70', '1', '1'),
(8, '8', '6x4x8 ND sleeve', '3', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '70', '1', '1'),
(9, '9', 'LOC02', '1', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '0', '1', '1'),
(10, '10', 'LOC02', '1', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '0', '1', '1'),
(11, '11', 'SPRUE', '4', '0', '2259.61', '1230.11', '-1244.36', '80.15', '0.06', '-0.12', '124', '1', '1'),
(12, '12', 'LID02', '8', '0', '2265.47', '1333.01', '-1104.34', '80.15', '0.06', '-0.12', '0', '1', '1'),
(13, '13', 'LID02', '8', '0', '2265.47', '1333.01', '-1104.34', '80.15', '0.06', '-0.12', '0', '1', '1'),
(14, '14', 'PATTERN', '10', '0', '2265.4684', '1333.0148', '1104.342', '2265.4684', '1333.0148', '-1104.342', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `15987`
--

CREATE TABLE IF NOT EXISTS `15987` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `15987`
--

INSERT INTO `15987` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '-4000', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `24500_cope`
--

CREATE TABLE IF NOT EXISTS `24500_cope` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `24500_cope`
--

INSERT INTO `24500_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1549.4992', '-925.931', '30.0875999999998', '132.5688', '-0.266000000000076', '-179.6772', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '1549.4992', '925.931', '30.0875999999998', '1549.4992', '-925.931', '30.0875999999998', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `61782`
--

CREATE TABLE IF NOT EXISTS `61782` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `61782`
--

INSERT INTO `61782` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', 'Numero1', '351.79', '-320.8', '-57', '0.0124', '0.0192', '-0.0028', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', 'Numero2', '372.35', '-323.02', '-43.01', '0', '0', '0', '0', '1', '1'),
(3, '3', 'NUMDEC', '5', 'Numero3', '318.82', '-663.72', '-45', '0.0124', '0.018', '-0.0028', '0', '1', '1'),
(4, '4', 'NUMUNID', '5', 'Numero4', '344.59', '-670.44', '-38.37', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '50', '210.92', '-116.14', '-47.89', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '50', '199.271', '-319.06', '-45.6024', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '50', '209.077', '-463.996', '-42.5488', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '50', '197.645', '-666.79', '-38.7676', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '50', '460.841', '-666.114', '-41.492', '40', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '50', '472.815', '-463.347', '-43.9344', '40', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '50', '462.527', '-318.82', '-47.9892', '40', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '50', '475.055', '-116.748', '-50.802', '0', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '50', '790.071', '-118.92', '-51.7308', '0', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '50', '777.775', '-322.096', '-48.0636', '0', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '50', '788.648', '-467.726', '-46.2708', '0', '0', '0', '0', '', ''),
(16, '16', 'PIN1', '6', '50', '776.29', '-669.876', '-41.6072', '0', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '50', '1041.261', '-672.669', '-42.726', '-147.602', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '50', '1052.781', '-468.875', '-48.3336', '-48.9976', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '50', '1042.181', '-325.112', '-50.952', '-120.004', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '50', '1054.061', '-121.324', '-54.806', '-57.004', '0', '0', '0', '1', '1'),
(21, '101', 'VSAA', '2', 'SI_Apilado', '336.4', '-221.18', '-60.52', '0', '0', '0', '152', '0.1', '1'),
(22, '101', 'VSAA', '2', 'SI_Apilado', '335.55', '-569.98', '-56.38', '0', '0', '0', '152', '0.1', '1'),
(23, '101', 'VSAA', '2', 'SI_Apilado', '913.89', '-572.54', '-62.81', '0', '0', '0', '152', '0.1', '1'),
(24, '101', 'VSAA', '2', 'SI_Apilado', '914.23', '-223.75', '-68.48', '0', '0', '0', '152', '0.1', '1'),
(25, '102', '6x4x8 ND sleeve', '3', 'NO_Apilado', '337.12', '-216.47', '-150.73', '0', '0', '0', '155', '1', '1'),
(26, '102', '6x4x8 ND sleeve', '3', 'NO_Apilado', '337.4', '-566.61', '-146.95', '0', '0', '0', '155', '1', '1'),
(27, '102', '6x4x8 ND sleeve', '3', 'NO_Apilado', '915.85', '-568.69', '-152.69', '0', '0', '0', '155', '1', '1'),
(28, '102', '6x4x8 ND sleeve', '3', 'NO_Apilado', '914.47', '-221.79', '-157.48', '0', '0', '0', '155', '1', '1'),
(29, '28', 'LOC03', '1', 'LOC1', '337.12', '-216.47', '-82.24', '0', '0', '0', '0', '1', '1'),
(30, '29', 'LOC03', '1', 'LOC2', '337.4', '-566.61', '-77.17', '0', '0', '0', '0', '1', '1'),
(31, '30', 'LOC03', '1', 'LOC3', '915.85', '-568.69', '-83.84', '0', '0', '0', '0', '1', '1'),
(32, '31', 'LOC03', '1', 'LOC4', '914.47', '-221.79', '-88.73', '0', '0', '0', '0', '1', '1'),
(33, '103', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '337.12', '-216.47', '-327.31', '0', '0', '0', '155', '1', '1'),
(34, '103', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '337.4', '-566.61', '-320.09', '0', '0', '0', '155', '1', '1'),
(35, '103', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '915.85', '-568.69', '-326.02', '0', '0', '0', '155', '1', '1'),
(36, '103', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '914.47', '-221.79', '-331.49', '0', '0', '0', '155', '1', '1'),
(37, '36', 'LID07', '8', 'Tapa1', '337.12', '-216.47', '-420.58', '0', '0', '0', '0', '1', '-500'),
(38, '37', 'LID07', '8', 'Tapa2', '337.4', '-566.61', '-415.47', '0', '0', '0', '0', '1', '-500'),
(39, '38', 'LID07', '8', 'Tapa1', '915.85', '-568.69', '-422.16', '0', '0', '0', '0', '1', '-500'),
(40, '39', 'LID07', '8', 'Tapa2', '914.47', '-221.79', '-427.02', '0', '0', '0', '0', '1', '-500'),
(41, '40', 'SPRUE', '4', 'SPRUE', '623.01', '-690.38', '-374.94', '0', '0', '0', '124', '1', '1'),
(42, '41', 'PATTERN', '10', 'DimencionesPattern', '1325.75', '896.08', '463.36', '-66.98', '-95.96', '-460.33', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `696969`
--

CREATE TABLE IF NOT EXISTS `696969` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `696969`
--

INSERT INTO `696969` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'BUF', '2', '0', '0', '0', '-500', '0', '0', '0', '141', '0.1', '1'),
(2, '2', 'PATTERN', '10', 'DimencionesPattern', '1802.53', '786.95', '600.08', '-82.46', '309.37', '-599.99', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000210`
--

CREATE TABLE IF NOT EXISTS `6000210` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000210`
--

INSERT INTO `6000210` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'CSL', '2', 'CORE1', '500', '0', '-200', '0', '0', '0', '193', '0.3', '1'),
(2, '2', 'CSL', '2', 'CORE2', '500', '0', '-200', '0', '0', '0', '193', '0.3', '1'),
(3, '3', 'CSL', '2', 'CORE2', '500', '0', '-200', '0', '0', '0', '193', '0.3', '1'),
(4, '4', '4x2x7 ND sleeve', '3', 'Manga1', '500', '0', '-200', '0', '0', '0', '100', '1', '1'),
(5, '5', '4x2x7 ND sleeve', '3', 'Manga2', '500', '0', '-200', '0', '0', '0', '100', '1', '-500'),
(6, '6', '4x2x7 ND sleeve', '3', 'Manga3', '661.054', '-24.648', '-341', '0', '0', '0', '100', '1', '-500'),
(7, '7', 'SPRUE', '4', 'SPRUE', '623.55', '-698.06', '-391', '0', '0', '0', '124', '1', '1'),
(8, '8', 'LID07', '8', 'Tapa 1', '0', '0', '-500', '0', '0', '0', '193', '1', '1'),
(9, '9', 'LID07', '8', 'Tapa 2', '0', '0', '-500', '0', '0', '0', '193', '1', '1'),
(10, '10', 'LID07', '8', 'Tapa 3', '0', '0', '-500', '0', '0', '0', '193', '1', '1'),
(11, '11', 'LOC02', '1', 'Localizador 1', '0', '0', '-500', '0', '0', '0', '0', '1', '1'),
(12, '12', 'LOC02', '1', 'Localizador 2', '0', '0', '-500', '0', '0', '0', '0', '1', '1'),
(13, '13', 'LOC02', '1', 'Localizador 3', '0', '0', '-500', '0', '0', '0', '0', '1', '1'),
(14, '14', 'SPRUE', '4', 'SPRUE', '623.55', '-698.06', '-391', '0', '0', '0', '124', '1', '1'),
(15, '0', 'PATTERN', '10', 'DimencionesPattern', '10', '20', '30', '-1', '-2', '-3', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000365`
--

CREATE TABLE IF NOT EXISTS `6000365` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000365`
--

INSERT INTO `6000365` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'JKVA', '2', 'SI_Apilado', '175.63', '-175.53', '-7.5', '-90', '0', '0', '129', '0.1', '1'),
(2, '102', 'JKB', '2', 'SI_Apilado', '690.31', '-18.96', '-12.61', '-77.77', '0', '0', '90', '0.1', '1'),
(3, '102', 'JKB', '2', 'SI_Apilado', '692.48', '-338.62', '-8.49', '-97.1', '0', '0', '90', '0.1', '1'),
(4, '103', '6x2.9x8 ND sleeve', '3', 'NO_Apilado', '177.91', '-174.19', '-95.78', '0', '0', '0', '153', '1', '1'),
(5, '103', '6x2.9x8 ND sleeve', '3', 'NO_Apilado', '690.38', '-16.89', '-102.59', '0', '0', '0', '153', '1', '-500'),
(6, '103', '6x2.9x8 ND sleeve', '3', 'NO_Apilado', '693.34', '-336.21', '-99.9', '0', '0', '0', '153', '1', '-500'),
(7, '7', 'LOC03', '1', 'LOC01', '177.91', '-174.19', '-23.28', '0', '0', '0', '0', '1', '1'),
(8, '8', 'LOC03', '1', 'LOC02', '690.38', '-16.89', '-30.32', '0', '0', '0', '0', '1', '1'),
(9, '9', 'LOC03', '1', 'LOC03', '693.34', '-336.21', '-27.36', '0', '0', '0', '0', '1', '1'),
(10, '10', 'SPRUE', '4', 'SPRUE', '389.83', '57.21', '-172.4', '0', '0', '0', '124', '1', '1'),
(11, '11', 'LID08', '8', 'Tapa1', '174.91', '-171.19', '-207.89', '0', '0', '0', '0', '1', '-500'),
(12, '12', 'LID08', '8', 'Tapa2', '690.38', '-16.89', '-214.74', '0', '0', '0', '0', '1', '-500'),
(13, '13', 'LID08', '8', 'Tapa1', '693.34', '-336.21', '-212.03', '0', '0', '0', '0', '1', '-500'),
(14, '14', 'PATTERN', '10', 'DimencionesPattern', '934.34', '566.37', '243.59', '-74.92', '243.05', '-243.59', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000535`
--

CREATE TABLE IF NOT EXISTS `6000535` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000535`
--

INSERT INTO `6000535` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', '5x2.5x7ND Foseco sleeve', '3', 'NO_Apilado', '956.772', '-175.782', '-157.63', '0', '0', '0', '130', '1', '1'),
(2, '2', '5x2.5x7ND Foseco sleeve', '3', 'NO_Apilado', '418.387', '-220.665', '-146.376', '0', '0', '0', '130', '1', '1'),
(3, '3', '5x2.5x7ND Foseco sleeve', '3', 'NO_Apilado', '-120.036', '-173.508', '-134.295', '0', '0', '0', '130', '1', '1'),
(4, '4', '5x5 Foseco sleeve', '3', 'NO_Apilado', '956.772', '-175.782', '-316.41', '0', '0', '0', '130', '1', '1'),
(5, '5', '5x5 Foseco sleeve', '3', 'NO_Apilado', '418.387', '-220.665', '-283.86', '0', '0', '0', '130', '1', '-500'),
(6, '6', '5x5 Foseco sleeve', '3', 'NO_Apilado', '-120.036', '-173.508', '-271.99', '0', '0', '0', '130', '1', '-500'),
(7, '7', '6x2.9x8 ND sleeve', '3', 'NO_Apilado', '950.04', '334.37', '-238.42', '0', '0', '0', '150', '1', '1'),
(8, '8', '6x2.9x8 ND sleeve', '3', 'NO_Apilado', '-111.44', '337.83', '-214.04', '0', '0', '0', '150', '1', '1'),
(9, '9', 'SPRUE', '4', 'SPRUE', '416.83', '338.77', '-330.77', '0', '0', '0', '124', '1', '1'),
(10, '10', 'LID08', '8', 'Tapa 1', '953.66', '-171.56', '-383.55', '0', '0', '0', '0', '1', '1'),
(11, '11', 'LID08', '8', 'Tapa 2', '419.08', '-208.46', '-372.56', '0', '0', '0', '0', '1', '1'),
(12, '12', 'LID08', '8', 'Tapa 3', '-123.36', '-166.88', '-356.84', '0', '0', '0', '0', '1', '1'),
(13, '13', 'LID07', '8', 'Tapa 4', '944.4', '337.09', '-355.55', '0', '0', '0', '0', '1', '1'),
(14, '14', 'LID07', '8', 'Tapa 5', '-117.76', '340.63', '-328.27', '0', '0', '0', '0', '1', '1'),
(15, '15', 'PATTERN', '10', 'DimencionesPattern', '1227.95', '449.99', '443.52', '-397.1', '582.25', '-400.52', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000733`
--

CREATE TABLE IF NOT EXISTS `6000733` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000733`
--

INSERT INTO `6000733` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '1530.8', '98.5', '-50.19', '-179.996', '-0.0004', '0.0004', '0', '1', '-500'),
(2, '2', 'PIN1', '6', '70', '1540.77', '-145.947', '-50.19', '-179.996', '-0.0004', '0.0004', '0', '1', '-500'),
(3, '3', 'PIN1', '6', '70', '1529.96', '-328.709', '-50.19', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(4, '4', 'PIN1', '6', '70', '1537.76', '-575.336', '-50.19', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(5, '5', 'PIN1', '6', '70', '1361.65', '-573.651', '-50.19', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(6, '6', 'PIN1', '6', '70', '1353.67', '-327.523', '-50.19', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(7, '7', 'PIN1', '6', '70', '1364.18', '-145.124', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(8, '8', 'PIN1', '6', '70', '1354.99', '99.59', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(9, '9', 'PIN1', '6', '70', '1223.97', '100.832', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(10, '10', 'PIN1', '6', '70', '1234.03', '-144.309', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(11, '11', 'PIN1', '6', '70', '1222.78', '-327.119', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(12, '12', 'PIN1', '6', '70', '1230.44', '-571.931', '-39.81', '-179.699', '-0.0004', '0.0004', '0', '1', '1'),
(13, '13', 'PIN1', '6', '70', '1054.61', '-570.34', '-39.81', '-179.699', '-0.0004', '0.0004', '0', '1', '1'),
(14, '14', 'PIN1', '6', '70', '1046.41', '-325.871', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(15, '15', 'PIN1', '6', '70', '1057.15', '-141.532', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(16, '16', 'PIN1', '6', '70', '1047.71', '101.415', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(17, '17', 'PIN1', '6', '70', '916.244', '101.945', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(18, '18', 'PIN1', '6', '70', '926.138', '-143.057', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(19, '19', 'PIN1', '6', '70', '914.98', '-324.939', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(20, '20', 'PIN1', '6', '70', '923.264', '-570.564', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(21, '21', 'PIN1', '6', '70', '746.785', '-568.743', '-39.81', '179.996', '-0.0004', '0.0004', '0', '1', '1'),
(22, '22', 'PIN1', '6', '70', '739.162', '-324.434', '-39.81', '179.992', '-0.0004', '0.0004', '0', '1', '1'),
(23, '23', 'PIN1', '6', '70', '750.226', '-142.139', '-39.81', '179.992', '-0.0004', '0.0004', '0', '1', '1'),
(24, '24', 'PIN1', '6', '70', '740.865', '103.528', '-39.81', '-179.7', '-0.0004', '0.0004', '0', '1', '1'),
(25, '25', 'PIN1', '6', '70', '609.27', '104.966', '-39.81', '-149', '-0.0004', '0.0004', '0', '1', '1'),
(26, '26', 'PIN1', '6', '70', '433.33', '104.829', '-39.81', '-90', '-0.0004', '0.0004', '0', '1', '1'),
(27, '27', 'PIN1', '6', '70', '619.564', '-139.416', '-39.81', '-179.7', '-0.0004', '0.0004', '0', '1', '1'),
(28, '28', 'PIN1', '6', '70', '607.915', '-324.071', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(29, '29', 'PIN1', '6', '70', '615.51', '-568.397', '-39.81', '-180', '-0.0004', '0.0004', '0', '1', '1'),
(30, '30', 'PIN1', '6', '70', '442.708', '-138.102', '-39.81', '-180', '-0.0004', '0.0004', '0', '1', '1'),
(31, '31', 'PIN1', '6', '70', '431.813', '-322.423', '-39.81', '-179.996', '-0.0004', '0.0004', '0', '1', '1'),
(32, '32', 'PIN1', '6', '70', '439.07', '-566.698', '-39.81', '-180', '0', '0', '0', '1', '1'),
(33, '101', 'CLR', '2', 'NO_Apilado', '658.82', '-17.39', '-69.93', '0', '0', '0', '189', '0.3', '1'),
(34, '34', 'PATTERN', '10', 'DimencionesPattern', '1802.53', '786.95', '600.08', '-82.46', '309.37', '-599.99', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000758_cope`
--

CREATE TABLE IF NOT EXISTS `6000758_cope` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000758_cope`
--

INSERT INTO `6000758_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '66', '241.49', '-141.01', '2.7', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '66', '267.34', '-370.03', '-1.53', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '66', '531.22', '-369.51', '0.95', '0', '0', '0', '0', '1', '1'),
(4, '101', 'EHF', '2', 'SI_Apilado', '758.6212', '-244.07', '-28.6864', '-2.23079999999982', '0.101999999999862', '-0.00360000000000582', '230', '0.1', '1'),
(5, '101', 'EHF', '2', 'SI_Apilado', '760.6656', '206.9928', '-23.0816', '-179.9984', '-0.000399999999899592', '0.00199999999995271', '230', '0.1', '1'),
(6, '6', 'PATTERN', '10', '0', '760.6656', '206.9928', '23.0816', '760.6656', '206.9928', '-23.0816', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000782`
--

CREATE TABLE IF NOT EXISTS `6000782` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000782`
--

INSERT INTO `6000782` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '0', 'NUMDEC', '8', 'Numero1', '355.79', '-325.8', '-57', '0.0124', '0.0192', '-0.0028', '0', '1', '1'),
(2, '0', 'NUMUNID', '8', 'Numero2', '381.104', '-323.23', '-57', '0.0124', '0.0192', '-0.0028', '0', '1', '1'),
(3, '0', 'NUMDEC', '8', 'Numero3', '322.82', '-668.72', '-45', '0.0124', '0.018', '-0.0028', '0', '1', '1'),
(4, '0', 'NUMUNID', '8', 'Numero4', '349.92', '-669.51', '-45', '0.0124', '0.018', '-0.0028', '0', '1', '1'),
(5, '0', 'PIN1', '6', '50', '212.619', '-123.79', '-48.5716', '0', '0', '0', '0', '1', '1'),
(6, '0', 'PIN1', '6', '50', '200.97', '-326.71', '-46.284', '0', '0', '0', '0', '1', '1'),
(7, '0', 'PIN1', '6', '50', '210.776', '-471.646', '-43.2304', '0', '0', '0', '0', '1', '1'),
(8, '0', 'PIN1', '6', '50', '199.344', '-674.44', '-39.4492', '0', '0', '0', '0', '1', '1'),
(9, '0', 'PIN1', '6', '50', '462.54', '-673.764', '-42.1736', '40', '0', '0', '0', '1', '1'),
(10, '0', 'PIN1', '6', '50', '474.514', '-470.997', '-44.616', '40', '0', '0', '0', '1', '1'),
(11, '0', 'PIN1', '6', '50', '464.226', '-326.47', '-48.6708', '40', '0', '0', '0', '1', '1'),
(12, '0', 'PIN1', '6', '50', '476.754', '-124.398', '-51.4836', '0', '0', '0', '0', '1', '1'),
(13, '0', 'PIN1', '6', '50', '791.77', '-126.57', '-52.4124', '0', '0', '0', '0', '1', '1'),
(14, '0', 'PIN1', '6', '50', '779.474', '-329.746', '-48.7452', '0', '0', '0', '0', '1', '1'),
(15, '0', 'PIN1', '6', '50', '790.347', '-475.376', '-46.9524', '0', '0', '0', '0', '', ''),
(16, '0', 'PIN1', '6', '50', '777.989', '-677.526', '-42.2888', '0', '0', '0', '0', '1', '1'),
(17, '0', 'PIN1', '6', '50', '1042.96', '-680.319', '-43.4076', '-147.602', '0', '0', '0', '1', '1'),
(18, '0', 'PIN1', '6', '50', '1054.48', '-476.525', '-49.0152', '-48.9976', '0', '0', '0', '1', '1'),
(19, '0', 'PIN1', '6', '50', '1043.88', '-332.762', '-51.6336', '-120.004', '0', '0', '0', '1', '1'),
(20, '0', 'PIN1', '6', '50', '1055.76', '-128.974', '-55.4876', '-57.004', '0', '0', '0', '1', '1'),
(21, '102', 'VSAA', '2', 'SI_Apilado', '340.15', '-238.6', '-59.41', '0', '0', '0', '152', '0.1', '1'),
(22, '102', 'VSAA', '2', 'SI_Apilado', '339.33', '-587.52', '-52', '0', '0', '0', '152', '0.1', '1'),
(23, '102', 'VSAA', '2', 'SI_Apilado', '917.85', '-589.78', '-60', '0', '0', '0', '152', '0.1', '1'),
(24, '103', '6x4x8 ND sleeve', '3', 'NO_Apilado', '339.54', '-231.41', '-201.48', '0', '0', '0', '155', '1', '1'),
(25, '103', '6x4x8 ND sleeve', '3', 'NO_Apilado', '338.72', '-581.02\r\n', '-193.48\r\n', '0', '0', '0', '155', '1', '1'),
(26, '103', '6x4x8 ND sleeve', '3', 'NO_Apilado', '919.63\r\n', '-582.57\r\n', '-196.48\r\n', '0', '0', '0', '155', '1', '1'),
(27, '0', 'LOC03', '1', 'LOC1', '334.28', '-221.86', '-90', '0', '0', '0', '0', '1', '1'),
(28, '0', 'LOC03', '1', 'LOC2', '335.23', '-572.53', '-90', '0', '0', '0', '0', '1', '1'),
(29, '0', 'LOC03', '1', 'LOC3', '915.47', '-573.72', '-98', '0', '0', '0', '0', '1', '1'),
(30, '104', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '332.1', '-225.46', '-370', '0', '0', '0', '155', '1', '1'),
(31, '104', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '331.9', '-576.46', '-360', '0', '0', '0', '155', '1', '1'),
(32, '104', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '906.21', '-581.24', '-370', '0', '0', '0', '155', '1', '1'),
(33, '0', 'LID08', '8', 'Tapa1', '354.7', '-200', '-370', '0', '0', '0', '0', '1', '-500'),
(34, '0', 'LID01', '8', 'Tapa2', '354.5', '-551', '-360', '0', '0', '0', '0', '1', '-500'),
(35, '0', 'LID01', '8', 'Tapa1', '928.81', '-555.78', '-370', '0', '0', '0', '0', '1', '-500'),
(36, '0', 'SPRUE', '4', 'SPRUE', '624.59', '-703.27', '-400', '0', '0', '0', '124', '1', '1'),
(37, '0', 'DOWEL', '9', 'Dowel', '1384', '990', '431.8', '0', '0', '0', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001131`
--

CREATE TABLE IF NOT EXISTS `6001131` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001131`
--

INSERT INTO `6001131` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '8', 'NUMERODEC', '634.75', '-203.78', '-234.03', '-23.59', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '8', 'NUMERODEC', '610.96', '-193.4', '-232.6', '-23.59', '0', '0', '0', '1', '1'),
(3, '101', 'CLM', '2', 'SI_Apilado', '717.77', '-394.86', '-245.54', '-2.14', '0', '0', '193', '0.2', '1'),
(4, '101', 'CLM', '2', 'SI_Apilado', '360.18', '-391.75', '-234', '-177.9', '0', '0', '193', '0.2', '1'),
(5, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '361.79', '-395.95', '-360.8', '0', '0', '0', '225', '1', '-500'),
(6, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '717.88', '-398.09', '-363.84', '0', '0', '0', '225', '1', '-500'),
(7, '7', 'SPRUE', '4', 'SPRUE', '537.77', '-13.43', '-473.15', '0', '0', '0', '124', '1', '1'),
(8, '8', 'LID04', '8', 'Tapa1', '720.17', '-391.98', '-502.93', '0', '0', '0', '193', '1', '1'),
(9, '8', 'LID04', '8', 'Tapa1', '367.41', '-392.54', '-499.74', '0', '0', '0', '193', '1', '1'),
(10, '8', 'PATTERN', '10', 'DimencionesPattern', '1145.59', '886.57', '556.38', '-69.25', '156.88', '-556.32', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `10024614_drag`
--

CREATE TABLE IF NOT EXISTS `10024614_drag` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `10024614_drag`
--

INSERT INTO `10024614_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '0', '1', '1'),
(2, '2', 'PIN1', '6', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '0', '1', '1'),
(3, '3', 'EHF', '2', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '111', '0.1', '1'),
(4, '4', '6x4x8 ND sleeve', '3', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '80', '1', '1'),
(5, '5', 'LOC03', '1', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '0', '1', '1'),
(6, '6', 'SPRUE', '4', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '124', '1', '1'),
(7, '7', 'LID04', '8', '0', '-1352.53', '-1213.34', '1541.57', '-179.06', '0.09', '-179.81', '0', '1', '1'),
(8, '8', 'PATTERN', '10', '0', '2260.356', '1243.8392', '1244.688', '2260.356', '1243.8392', '-1244.688', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bddin_r2`
--

CREATE TABLE IF NOT EXISTS `bddin_r2` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  `X` varchar(255) NOT NULL,
  `Y` varchar(255) NOT NULL,
  `Z` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `NumEntidad` varchar(255) NOT NULL,
  `Segmento` varchar(255) NOT NULL,
  `Insertar/Sacar` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bddin_r2`
--

INSERT INTO `bddin_r2` (`ID`, `Tipo`, `X`, `Y`, `Z`, `A`, `B`, `C`, `NumEntidad`, `Segmento`, `Insertar/Sacar`) VALUES
(1, 'PATTERN', '934.34', '566.37', '243.59', '-74.92', '243.05', '-243.59', '10', '0', '0'),
(2, 'LID08', '174.91', '-171.19', '-207.89', '0', '0', '0', '8', '8', '1'),
(3, 'LID08', '690.38', '-16.89', '-214.74', '0', '0', '0', '8', '8', '1'),
(4, 'LID08', '693.34', '-336.21', '-212.03', '0', '0', '0', '8', '8', '1'),
(5, 'LID08', '174.91', '-171.19', '-207.89', '0', '0', '0', '8', '8', '0'),
(6, 'LOC03', '177.91', '-174.19', '-23.28', '0', '0', '0', '1', '3', '0'),
(7, 'LID08', '690.38', '-16.89', '-214.74', '0', '0', '0', '8', '8', '0'),
(8, 'LOC03', '690.38', '-16.89', '-30.32', '0', '0', '0', '1', '3', '0'),
(9, 'LID08', '693.34', '-336.21', '-212.03', '0', '0', '0', '8', '8', '0'),
(10, 'LOC03', '693.34', '-336.21', '-27.36', '0', '0', '0', '1', '3', '0'),
(11, 'SPRUE', '389.83', '57.21', '-226.4', '0', '0', '0', '', '', '0'),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(31, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(32, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(33, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(34, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(35, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(36, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(37, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(38, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(39, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(40, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_pallet`
--

CREATE TABLE IF NOT EXISTS `global_pallet` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Core` varchar(255) NOT NULL,
  `Pallet` varchar(255) NOT NULL,
  `Segmento` varchar(255) NOT NULL,
  `Cantidad` varchar(255) NOT NULL,
  `Codificacion` varchar(255) NOT NULL,
  `EsApilado` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `global_pallet`
--

INSERT INTO `global_pallet` (`ID`, `Core`, `Pallet`, `Segmento`, `Cantidad`, `Codificacion`, `EsApilado`) VALUES
(1, 'EHF', '1', '5', '9', '101', '1'),
(2, '6x4x8 ND sleeve', '3', '1', '11', '102', '0'),
(3, '9x10 Tube sleeve', '3', '1', '13', '103', '0'),
(4, ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ''),
(31, ' ', ' ', ' ', ' ', ' ', ''),
(32, ' ', ' ', ' ', ' ', ' ', ''),
(33, ' ', ' ', ' ', ' ', ' ', ''),
(34, ' ', ' ', ' ', ' ', ' ', ''),
(35, ' ', ' ', ' ', ' ', ' ', ''),
(36, ' ', ' ', ' ', ' ', ' ', ''),
(37, ' ', ' ', ' ', ' ', ' ', ''),
(38, ' ', ' ', ' ', ' ', ' ', ''),
(39, ' ', ' ', ' ', ' ', ' ', ''),
(40, ' ', ' ', ' ', ' ', ' ', ''),
(41, ' ', ' ', ' ', ' ', ' ', ''),
(42, ' ', ' ', ' ', ' ', ' ', ''),
(43, ' ', ' ', ' ', ' ', ' ', ''),
(44, ' ', ' ', ' ', ' ', ' ', ''),
(45, ' ', ' ', ' ', ' ', ' ', ''),
(46, ' ', ' ', ' ', ' ', ' ', ''),
(47, ' ', ' ', ' ', ' ', ' ', ''),
(48, ' ', ' ', ' ', ' ', ' ', ''),
(49, ' ', ' ', ' ', ' ', ' ', ''),
(50, ' ', ' ', ' ', ' ', ' ', ''),
(51, ' ', ' ', ' ', ' ', ' ', ''),
(52, ' ', ' ', ' ', ' ', ' ', ''),
(53, ' ', ' ', ' ', ' ', ' ', ''),
(54, ' ', ' ', ' ', ' ', ' ', ''),
(55, ' ', ' ', ' ', ' ', ' ', ''),
(56, ' ', ' ', ' ', ' ', ' ', ''),
(57, ' ', ' ', ' ', ' ', ' ', ''),
(58, ' ', ' ', ' ', ' ', ' ', ''),
(59, ' ', ' ', ' ', ' ', ' ', ''),
(60, ' ', ' ', ' ', ' ', ' ', ''),
(61, ' ', ' ', ' ', ' ', ' ', ''),
(62, ' ', ' ', ' ', ' ', ' ', ''),
(63, ' ', ' ', ' ', ' ', ' ', ''),
(64, ' ', ' ', ' ', ' ', ' ', ''),
(65, ' ', ' ', ' ', ' ', ' ', ''),
(66, ' ', ' ', ' ', ' ', ' ', ''),
(67, ' ', ' ', ' ', ' ', ' ', ''),
(68, ' ', ' ', ' ', ' ', ' ', ''),
(69, ' ', ' ', ' ', ' ', ' ', ''),
(70, ' ', ' ', ' ', ' ', ' ', ''),
(71, ' ', ' ', ' ', ' ', ' ', ''),
(72, ' ', ' ', ' ', ' ', ' ', ''),
(73, ' ', ' ', ' ', ' ', ' ', ''),
(74, ' ', ' ', ' ', ' ', ' ', ''),
(75, ' ', ' ', ' ', ' ', ' ', ''),
(76, ' ', ' ', ' ', ' ', ' ', ''),
(77, ' ', ' ', ' ', ' ', ' ', ''),
(78, ' ', ' ', ' ', ' ', ' ', ''),
(79, ' ', ' ', ' ', ' ', ' ', ''),
(80, ' ', ' ', ' ', ' ', ' ', ''),
(81, ' ', ' ', ' ', ' ', ' ', ''),
(82, ' ', ' ', ' ', ' ', ' ', ''),
(83, ' ', ' ', ' ', ' ', ' ', ''),
(84, ' ', ' ', ' ', ' ', ' ', ''),
(85, ' ', ' ', ' ', ' ', ' ', ''),
(86, ' ', ' ', ' ', ' ', ' ', ''),
(87, ' ', ' ', ' ', ' ', ' ', ''),
(88, ' ', ' ', ' ', ' ', ' ', ''),
(89, ' ', ' ', ' ', ' ', ' ', ''),
(90, ' ', ' ', ' ', ' ', ' ', ''),
(91, ' ', ' ', ' ', ' ', ' ', ''),
(92, ' ', ' ', ' ', ' ', ' ', ''),
(93, ' ', ' ', ' ', ' ', ' ', ''),
(94, ' ', ' ', ' ', ' ', ' ', ''),
(95, ' ', ' ', ' ', ' ', ' ', ''),
(96, ' ', ' ', ' ', ' ', ' ', ''),
(97, ' ', ' ', ' ', ' ', ' ', ''),
(98, ' ', ' ', ' ', ' ', ' ', ''),
(99, ' ', ' ', ' ', ' ', ' ', ''),
(100, ' ', ' ', ' ', ' ', ' ', ''),
(101, ' ', ' ', ' ', ' ', ' ', ''),
(102, ' ', ' ', ' ', ' ', ' ', ''),
(103, ' ', ' ', ' ', ' ', ' ', ''),
(104, ' ', ' ', ' ', ' ', ' ', ''),
(105, ' ', ' ', ' ', ' ', ' ', ''),
(106, ' ', ' ', ' ', ' ', ' ', ''),
(107, ' ', ' ', ' ', ' ', ' ', ''),
(108, ' ', ' ', ' ', ' ', ' ', ''),
(109, ' ', ' ', ' ', ' ', ' ', ''),
(110, ' ', ' ', ' ', ' ', ' ', ''),
(111, ' ', ' ', ' ', ' ', ' ', ''),
(112, ' ', ' ', ' ', ' ', ' ', ''),
(113, ' ', ' ', ' ', ' ', ' ', ''),
(114, ' ', ' ', ' ', ' ', ' ', ''),
(115, ' ', ' ', ' ', ' ', ' ', ''),
(116, ' ', ' ', ' ', ' ', ' ', ''),
(117, ' ', ' ', ' ', ' ', ' ', ''),
(118, ' ', ' ', ' ', ' ', ' ', ''),
(119, ' ', ' ', ' ', ' ', ' ', ''),
(120, ' ', ' ', ' ', ' ', ' ', ''),
(121, ' ', ' ', ' ', ' ', ' ', ''),
(122, ' ', ' ', ' ', ' ', ' ', ''),
(123, ' ', ' ', ' ', ' ', ' ', ''),
(124, ' ', ' ', ' ', ' ', ' ', ''),
(125, ' ', ' ', ' ', ' ', ' ', ''),
(126, ' ', ' ', ' ', ' ', ' ', ''),
(127, ' ', ' ', ' ', ' ', ' ', ''),
(128, ' ', ' ', ' ', ' ', ' ', ''),
(129, ' ', ' ', ' ', ' ', ' ', ''),
(130, ' ', ' ', ' ', ' ', ' ', ''),
(131, ' ', ' ', ' ', ' ', ' ', ''),
(132, ' ', ' ', ' ', ' ', ' ', ''),
(133, ' ', ' ', ' ', ' ', ' ', ''),
(134, ' ', ' ', ' ', ' ', ' ', ''),
(135, ' ', ' ', ' ', ' ', ' ', ''),
(136, ' ', ' ', ' ', ' ', ' ', ''),
(137, ' ', ' ', ' ', ' ', ' ', ''),
(138, ' ', ' ', ' ', ' ', ' ', ''),
(139, ' ', ' ', ' ', ' ', ' ', ''),
(140, ' ', ' ', ' ', ' ', ' ', ''),
(141, ' ', ' ', ' ', ' ', ' ', ''),
(142, ' ', ' ', ' ', ' ', ' ', ''),
(143, ' ', ' ', ' ', ' ', ' ', ''),
(144, ' ', ' ', ' ', ' ', ' ', ''),
(145, ' ', ' ', ' ', ' ', ' ', ''),
(146, ' ', ' ', ' ', ' ', ' ', ''),
(147, ' ', ' ', ' ', ' ', ' ', ''),
(148, ' ', ' ', ' ', ' ', ' ', ''),
(149, ' ', ' ', ' ', ' ', ' ', ''),
(150, ' ', ' ', ' ', ' ', ' ', ''),
(151, ' ', ' ', ' ', ' ', ' ', ''),
(152, ' ', ' ', ' ', ' ', ' ', ''),
(153, ' ', ' ', ' ', ' ', ' ', ''),
(154, ' ', ' ', ' ', ' ', ' ', ''),
(155, ' ', ' ', ' ', ' ', ' ', ''),
(156, ' ', ' ', ' ', ' ', ' ', ''),
(157, ' ', ' ', ' ', ' ', ' ', ''),
(158, ' ', ' ', ' ', ' ', ' ', ''),
(159, ' ', ' ', ' ', ' ', ' ', ''),
(160, ' ', ' ', ' ', ' ', ' ', ''),
(161, ' ', ' ', ' ', ' ', ' ', ''),
(162, ' ', ' ', ' ', ' ', ' ', ''),
(163, ' ', ' ', ' ', ' ', ' ', ''),
(164, ' ', ' ', ' ', ' ', ' ', ''),
(165, ' ', ' ', ' ', ' ', ' ', ''),
(166, ' ', ' ', ' ', ' ', ' ', ''),
(167, ' ', ' ', ' ', ' ', ' ', ''),
(168, ' ', ' ', ' ', ' ', ' ', ''),
(169, ' ', ' ', ' ', ' ', ' ', ''),
(170, ' ', ' ', ' ', ' ', ' ', ''),
(171, ' ', ' ', ' ', ' ', ' ', ''),
(172, ' ', ' ', ' ', ' ', ' ', ''),
(173, ' ', ' ', ' ', ' ', ' ', ''),
(174, ' ', ' ', ' ', ' ', ' ', ''),
(175, ' ', ' ', ' ', ' ', ' ', ''),
(176, ' ', ' ', ' ', ' ', ' ', ''),
(177, ' ', ' ', ' ', ' ', ' ', ''),
(178, ' ', ' ', ' ', ' ', ' ', ''),
(179, ' ', ' ', ' ', ' ', ' ', ''),
(180, ' ', ' ', ' ', ' ', ' ', ''),
(181, ' ', ' ', ' ', ' ', ' ', ''),
(182, ' ', ' ', ' ', ' ', ' ', ''),
(183, ' ', ' ', ' ', ' ', ' ', ''),
(184, ' ', ' ', ' ', ' ', ' ', ''),
(185, ' ', ' ', ' ', ' ', ' ', ''),
(186, ' ', ' ', ' ', ' ', ' ', ''),
(187, ' ', ' ', ' ', ' ', ' ', ''),
(188, ' ', ' ', ' ', ' ', ' ', ''),
(189, ' ', ' ', ' ', ' ', ' ', ''),
(190, ' ', ' ', ' ', ' ', ' ', ''),
(191, ' ', ' ', ' ', ' ', ' ', ''),
(192, ' ', ' ', ' ', ' ', ' ', ''),
(193, ' ', ' ', ' ', ' ', ' ', ''),
(194, ' ', ' ', ' ', ' ', ' ', ''),
(195, ' ', ' ', ' ', ' ', ' ', ''),
(196, ' ', ' ', ' ', ' ', ' ', ''),
(197, ' ', ' ', ' ', ' ', ' ', ''),
(198, ' ', ' ', ' ', ' ', ' ', ''),
(199, ' ', ' ', ' ', ' ', ' ', ''),
(200, ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_1`
--

CREATE TABLE IF NOT EXISTS `pallet_1` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `C1` varchar(255) NOT NULL,
  `C2` varchar(255) NOT NULL,
  `C3` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `P1` varchar(255) NOT NULL,
  `P2` varchar(255) NOT NULL,
  `P3` varchar(255) NOT NULL,
  `P4` varchar(255) NOT NULL,
  `P5` varchar(255) NOT NULL,
  `P6` varchar(255) NOT NULL,
  `P7` varchar(255) NOT NULL,
  `P8` varchar(255) NOT NULL,
  `P9` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pallet_1`
--

INSERT INTO `pallet_1` (`ID`, `C1`, `C2`, `C3`, `Core`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `P7`, `P8`, `P9`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(2, ' ', 'EHF;', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(4, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_2`
--

CREATE TABLE IF NOT EXISTS `pallet_2` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `C1` varchar(255) NOT NULL,
  `C2` varchar(255) NOT NULL,
  `C3` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `P1` varchar(255) NOT NULL,
  `P2` varchar(255) NOT NULL,
  `P3` varchar(255) NOT NULL,
  `P4` varchar(255) NOT NULL,
  `P5` varchar(255) NOT NULL,
  `P6` varchar(255) NOT NULL,
  `P7` varchar(255) NOT NULL,
  `P8` varchar(255) NOT NULL,
  `P9` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pallet_2`
--

INSERT INTO `pallet_2` (`ID`, `C1`, `C2`, `C3`, `Core`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `P7`, `P8`, `P9`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(4, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_3`
--

CREATE TABLE IF NOT EXISTS `pallet_3` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `C1` varchar(255) NOT NULL,
  `C2` varchar(255) NOT NULL,
  `C3` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `P1` varchar(255) NOT NULL,
  `P2` varchar(255) NOT NULL,
  `P3` varchar(255) NOT NULL,
  `P4` varchar(255) NOT NULL,
  `P5` varchar(255) NOT NULL,
  `P6` varchar(255) NOT NULL,
  `P7` varchar(255) NOT NULL,
  `P8` varchar(255) NOT NULL,
  `P9` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pallet_3`
--

INSERT INTO `pallet_3` (`ID`, `C1`, `C2`, `C3`, `Core`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `P7`, `P8`, `P9`) VALUES
(1, '6x4x8 ND sleeve;9x10 Tube sleeve;', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(4, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_4`
--

CREATE TABLE IF NOT EXISTS `pallet_4` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `C1` varchar(255) NOT NULL,
  `C2` varchar(255) NOT NULL,
  `C3` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `P1` varchar(255) NOT NULL,
  `P2` varchar(255) NOT NULL,
  `P3` varchar(255) NOT NULL,
  `P4` varchar(255) NOT NULL,
  `P5` varchar(255) NOT NULL,
  `P6` varchar(255) NOT NULL,
  `P7` varchar(255) NOT NULL,
  `P8` varchar(255) NOT NULL,
  `P9` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pallet_4`
--

INSERT INTO `pallet_4` (`ID`, `C1`, `C2`, `C3`, `Core`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `P7`, `P8`, `P9`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(4, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_5`
--

CREATE TABLE IF NOT EXISTS `pallet_5` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `C1` varchar(255) NOT NULL,
  `C2` varchar(255) NOT NULL,
  `C3` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `P1` varchar(255) NOT NULL,
  `P2` varchar(255) NOT NULL,
  `P3` varchar(255) NOT NULL,
  `P4` varchar(255) NOT NULL,
  `P5` varchar(255) NOT NULL,
  `P6` varchar(255) NOT NULL,
  `P7` varchar(255) NOT NULL,
  `P8` varchar(255) NOT NULL,
  `P9` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pallet_5`
--

INSERT INTO `pallet_5` (`ID`, `C1`, `C2`, `C3`, `Core`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `P7`, `P8`, `P9`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(4, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_6`
--

CREATE TABLE IF NOT EXISTS `pallet_6` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `C1` varchar(255) NOT NULL,
  `C2` varchar(255) NOT NULL,
  `C3` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `P1` varchar(255) NOT NULL,
  `P2` varchar(255) NOT NULL,
  `P3` varchar(255) NOT NULL,
  `P4` varchar(255) NOT NULL,
  `P5` varchar(255) NOT NULL,
  `P6` varchar(255) NOT NULL,
  `P7` varchar(255) NOT NULL,
  `P8` varchar(255) NOT NULL,
  `P9` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pallet_6`
--

INSERT INTO `pallet_6` (`ID`, `C1`, `C2`, `C3`, `Core`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `P7`, `P8`, `P9`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(4, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(5, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(6, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(8, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(9, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(10, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(11, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(12, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(13, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(14, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(15, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(16, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(17, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(18, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(19, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(20, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(21, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(22, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(23, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(24, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(25, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(26, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(27, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(28, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(29, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
(30, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pattern_produccion`
--

CREATE TABLE IF NOT EXISTS `pattern_produccion` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID Pattern` varchar(255) NOT NULL,
  `Conteo Produccion` varchar(255) NOT NULL,
  `Limite Produccion` varchar(255) NOT NULL,
  `Sprue Position` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pattern_produccion`
--

INSERT INTO `pattern_produccion` (`ID`, `ID Pattern`, `Conteo Produccion`, `Limite Produccion`, `Sprue Position`) VALUES
(1, '8888_cope', '0', '8', '1'),
(2, ' ', '', '', ''),
(3, ' ', '', '', ''),
(4, ' ', '', '', ''),
(5, ' ', '', '', ''),
(6, ' ', '', '', ''),
(7, ' ', '', '', ''),
(8, ' ', '', '', ''),
(9, ' ', '', '', ''),
(10, ' ', '', '', ''),
(11, ' ', '', '', ''),
(12, ' ', '', '', ''),
(13, ' ', '', '', ''),
(14, ' ', '', '', ''),
(15, ' ', '', '', ''),
(16, ' ', '', '', ''),
(17, ' ', '', '', ''),
(18, ' ', '', '', ''),
(19, ' ', '', '', ''),
(20, ' ', '', '', ''),
(21, ' ', '', '', ''),
(22, ' ', '', '', ''),
(23, ' ', '', '', ''),
(24, ' ', '', '', ''),
(25, ' ', '', '', ''),
(26, ' ', '', '', ''),
(27, ' ', '', '', ''),
(28, ' ', '', '', ''),
(29, ' ', '', '', ''),
(30, ' ', '', '', ''),
(31, ' ', '', '', ''),
(32, ' ', '', '', ''),
(33, ' ', '', '', ''),
(34, ' ', '', '', ''),
(35, ' ', '', '', ''),
(36, ' ', '', '', ''),
(37, ' ', '', '', ''),
(38, ' ', '', '', ''),
(39, ' ', '', '', ''),
(40, ' ', '', '', ''),
(41, ' ', '', '', ''),
(42, ' ', '', '', ''),
(43, ' ', '', '', ''),
(44, ' ', '', '', ''),
(45, ' ', '', '', ''),
(46, ' ', '', '', ''),
(47, ' ', '', '', ''),
(48, ' ', '', '', ''),
(49, ' ', '', '', ''),
(50, ' ', '', '', ''),
(51, ' ', '', '', ''),
(52, ' ', '', '', ''),
(53, ' ', '', '', ''),
(54, ' ', '', '', ''),
(55, ' ', '', '', ''),
(56, ' ', '', '', ''),
(57, ' ', '', '', ''),
(58, ' ', '', '', ''),
(59, ' ', '', '', ''),
(60, ' ', '', '', ''),
(61, ' ', '', '', ''),
(62, ' ', '', '', ''),
(63, ' ', '', '', ''),
(64, ' ', '', '', ''),
(65, ' ', '', '', ''),
(66, ' ', '', '', ''),
(67, ' ', '', '', ''),
(68, ' ', '', '', ''),
(69, ' ', '', '', ''),
(70, ' ', '', '', ''),
(71, ' ', '', '', ''),
(72, ' ', '', '', ''),
(73, ' ', '', '', ''),
(74, ' ', '', '', ''),
(75, ' ', '', '', ''),
(76, ' ', '', '', ''),
(77, ' ', '', '', ''),
(78, ' ', '', '', ''),
(79, ' ', '', '', ''),
(80, ' ', '', '', ''),
(81, ' ', '', '', ''),
(82, ' ', '', '', ''),
(83, ' ', '', '', ''),
(84, ' ', '', '', ''),
(85, ' ', '', '', ''),
(86, ' ', '', '', ''),
(87, ' ', '', '', ''),
(88, ' ', '', '', ''),
(89, ' ', '', '', ''),
(90, ' ', '', '', ''),
(91, ' ', '', '', ''),
(92, ' ', '', '', ''),
(93, ' ', '', '', ''),
(94, ' ', '', '', ''),
(95, ' ', '', '', ''),
(96, ' ', '', '', ''),
(97, ' ', '', '', ''),
(98, ' ', '', '', ''),
(99, ' ', '', '', ''),
(100, ' ', '', '', ''),
(101, ' ', '', '', ''),
(102, ' ', '', '', ''),
(103, ' ', '', '', ''),
(104, ' ', '', '', ''),
(105, ' ', '', '', ''),
(106, ' ', '', '', ''),
(107, ' ', '', '', ''),
(108, ' ', '', '', ''),
(109, ' ', '', '', ''),
(110, ' ', '', '', ''),
(111, ' ', '', '', ''),
(112, ' ', '', '', ''),
(113, ' ', '', '', ''),
(114, ' ', '', '', ''),
(115, ' ', '', '', ''),
(116, ' ', '', '', ''),
(117, ' ', '', '', ''),
(118, ' ', '', '', ''),
(119, ' ', '', '', ''),
(120, ' ', '', '', ''),
(121, ' ', '', '', ''),
(122, ' ', '', '', ''),
(123, ' ', '', '', ''),
(124, ' ', '', '', ''),
(125, ' ', '', '', ''),
(126, ' ', '', '', ''),
(127, ' ', '', '', ''),
(128, ' ', '', '', ''),
(129, ' ', '', '', ''),
(130, ' ', '', '', ''),
(131, ' ', '', '', ''),
(132, ' ', '', '', ''),
(133, ' ', '', '', ''),
(134, ' ', '', '', ''),
(135, ' ', '', '', ''),
(136, ' ', '', '', ''),
(137, ' ', '', '', ''),
(138, ' ', '', '', ''),
(139, ' ', '', '', ''),
(140, ' ', '', '', ''),
(141, ' ', '', '', ''),
(142, ' ', '', '', ''),
(143, ' ', '', '', ''),
(144, ' ', '', '', ''),
(145, ' ', '', '', ''),
(146, ' ', '', '', ''),
(147, ' ', '', '', ''),
(148, ' ', '', '', ''),
(149, ' ', '', '', ''),
(150, ' ', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_actualproduction`
--

CREATE TABLE IF NOT EXISTS `ram_actualproduction` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pattern` varchar(255) NOT NULL,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `Pallet` varchar(255) NOT NULL,
  `Segmento` varchar(255) NOT NULL,
  `Cantidad` varchar(255) NOT NULL,
  `Codificacion` varchar(255) NOT NULL,
  `EsApilado` varchar(255) NOT NULL,
  `PorctCoreDetection` varchar(255) NOT NULL,
  `Sprue Exist` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_actualproduction`
--

INSERT INTO `ram_actualproduction` (`ID`, `Pattern`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Core`, `Pallet`, `Segmento`, `Cantidad`, `Codificacion`, `EsApilado`, `PorctCoreDetection`, `Sprue Exist`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', '', ' ', ' ', ' ', ' ', ' ', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_localizadores`
--

CREATE TABLE IF NOT EXISTS `ram_localizadores` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL,
  `N9` varchar(255) NOT NULL,
  `N10` varchar(255) NOT NULL,
  `N11` varchar(255) NOT NULL,
  `N12` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_localizadores`
--

INSERT INTO `ram_localizadores` (`ID`, `N1`, `N2`, `N3`, `N4`, `N5`, `N6`, `N7`, `N8`, `N9`, `N10`, `N11`, `N12`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', ''),
(2, ' ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_numeros`
--

CREATE TABLE IF NOT EXISTS `ram_numeros` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL,
  `N9` varchar(255) NOT NULL,
  `N10` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_numeros`
--

INSERT INTO `ram_numeros` (`ID`, `N1`, `N2`, `N3`, `N4`, `N5`, `N6`, `N7`, `N8`, `N9`, `N10`) VALUES
(1, '0', '0', ' ', ' ', ' ', '', '', '', '', ''),
(2, 'Ultimo Cmd BDD R1', 'Cambio de Pattern', ' ', ' ', ' ', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_patternproductionline`
--

CREATE TABLE IF NOT EXISTS `ram_patternproductionline` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PatterInConveyor` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_patternproductionline`
--

INSERT INTO `ram_patternproductionline` (`ID`, `PatterInConveyor`) VALUES
(1, ' '),
(2, ' '),
(3, ' '),
(4, ' '),
(5, ' '),
(6, ' '),
(7, ' '),
(8, ' '),
(9, ' '),
(10, ' ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_sprues`
--

CREATE TABLE IF NOT EXISTS `ram_sprues` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_sprues`
--

INSERT INTO `ram_sprues` (`ID`, `N1`, `N2`, `N3`, `N4`, `N5`, `N6`, `N7`, `N8`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', '', '', ''),
(2, ' ', ' ', ' ', ' ', ' ', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_tapas`
--

CREATE TABLE IF NOT EXISTS `ram_tapas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL,
  `N9` varchar(255) NOT NULL,
  `N10` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_tapas`
--

INSERT INTO `ram_tapas` (`ID`, `N1`, `N2`, `N3`, `N4`, `N5`, `N6`, `N7`, `N8`, `N9`, `N10`) VALUES
(1, ' ', ' ', ' ', ' ', ' ', '', '', '', '', ''),
(2, ' ', ' ', ' ', ' ', ' ', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `whiterecipe`
--

CREATE TABLE IF NOT EXISTS `whiterecipe` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RamCodificacion` varchar(255) NOT NULL,
  `Cod Core` varchar(255) NOT NULL,
  `Entidad_ID` varchar(255) NOT NULL,
  `Profundidad Agujero` varchar(255) NOT NULL,
  `Ref Pos X` varchar(255) NOT NULL,
  `Ref Pos Y` varchar(255) NOT NULL,
  `Ref Pos Z` varchar(255) NOT NULL,
  `Ref Pos A` varchar(255) NOT NULL,
  `Ref Pos B` varchar(255) NOT NULL,
  `Ref Pos C` varchar(255) NOT NULL,
  `DiametroTomaCore[mm]` varchar(255) NOT NULL,
  `PorcentajeDeteccion Core` varchar(255) NOT NULL,
  `Altura Patron Entidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `whiterecipe`
--

INSERT INTO `whiterecipe` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '9', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(3, '3', 'EHF', '2', '0', '0', '0', '-1000', '0', '0', '0', '144', '0.1', '1'),
(4, '4', '6x4x8 ND sleeve', '3', '0', '0', '0', '-1000', '0', '0', '0', '80', '1', '1'),
(5, '5', 'LOC03', '1', '0', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(6, '6', 'SPRUE', '4', '0', '0', '0', '-1000', '0', '0', '0', '124', '1', '1'),
(7, '7', 'LID03', '8', '0', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PATTERN', '10', '0', '1352.5254', '1213.3362', '1541.5656', '-1352.5254', '-1213.3362', '1541.5656', '0', '1', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
