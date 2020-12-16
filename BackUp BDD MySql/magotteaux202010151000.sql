-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 15:00:06
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
-- Estructura de tabla para la tabla `1patt_cope`
--

CREATE TABLE IF NOT EXISTS `1patt_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `1patt_cope`
--

INSERT INTO `1patt_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '239.18', '-133.85', '18.61', '0.03', '0', '-0.01', '0', '1', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '759.22', '206.82', '-16.76', '-179.95', '0.17', '-0.13', '230', '0.3', '1'),
(3, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '758.1', '208.47', '-143.49', '0', '-0.05', '0.2', '205', '1', '1'),
(4, '4', 'PATTERN', '10', '0', '758.1024', '208.4736', '143.4872', '758.1024', '208.4736', '-143.4872', '0', '1', '1');

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
-- Estructura de tabla para la tabla `600testrecp`
--

CREATE TABLE IF NOT EXISTS `600testrecp` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `600testrecp`
--

INSERT INTO `600testrecp` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', '1', 'PIN1', '6', '0', '239.18', '-133.85', '18.61', '0.03', '0', '-0.01', '0', '1'),
(2, '2', '101', 'EHF', '2', 'SI_Apilado', '759.22', '206.82', '-16.76', '-179.95', '0.17', '-0.13', '230', '0.1'),
(3, '3', '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '758.1', '208.47', '-143.49', '0', '-0.05', '0.2', '205', '1'),
(4, '4', '4', 'PATTERN', '10', '0', '758.1024', '208.4736', '143.4872', '758.1024', '208.4736', '-143.4872', '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `8888xx`
--

CREATE TABLE IF NOT EXISTS `8888xx` (
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
-- Volcado de datos para la tabla `8888xx`
--

INSERT INTO `8888xx` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
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
-- Estructura de tabla para la tabla `6000220_cope`
--

CREATE TABLE IF NOT EXISTS `6000220_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000220_cope`
--

INSERT INTO `6000220_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '715.1', '-330.33', '-1.87', '-9.96', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '689.76', '-326.18', '-2.68', '-9.96', '0', '0', '0', '1', '1'),
(3, '101', 'HWEA', '2', 'SI_Apilado', '1000.85', '-321.99', '-23.47', '0', '0', '0', '189', '0.3', '1'),
(4, '101', 'HWEA', '2', 'SI_Apilado', '294.44', '-238.88', '-21.78', '0', '0', '0', '189', '0.3', '1'),
(5, '102', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '291.63', '-236.53', '-139.61', '0', '0', '0', '228', '1', '1'),
(6, '102', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '998.75', '-321.08', '-140.1', '0', '0', '0', '228', '1', '1'),
(7, '7', 'LOC07', '1', '0', '295.33', '-236.68', '-48.95', '0', '0', '0', '0', '1', '1'),
(8, '8', 'LOC07', '1', '0', '1001.25', '-321.59', '-50.22', '0', '0', '0', '0', '1', '1'),
(9, '9', 'SPRUE', '4', '0', '936.87', '-610.12', '-262.3', '-12.4', '-0.01', '0', '124', '1', '1'),
(10, '10', 'LID05', '8', '0', '998.75', '-321.08', '-274.72', '0', '0', '0', '0', '1', '1'),
(11, '11', 'LID05', '8', '0', '291.63', '-236.53', '-272.82', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PATTERN', '10', '0', '184.3672', '282.4268', '290.756', '1499.2808', '-781.9482', '-289.278', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000220_drag`
--

CREATE TABLE IF NOT EXISTS `6000220_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000220_drag`
--

INSERT INTO `6000220_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '190.8776', '288.0384', '201.086', '1507.6376', '-759.2398', '-202.1036', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000696again_cope`
--

CREATE TABLE IF NOT EXISTS `6000696again_cope` (
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
-- Volcado de datos para la tabla `6000696again_cope`
--

INSERT INTO `6000696again_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '170.68', '164.33', '1.25', '0.47', '0', '-0.02', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '388.09', '162.92', '10.97', '0.47', '0', '-0.02', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '452.54', '161.85', '10.59', '0.47', '0', '-0.02', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '556.03', '161.21', '12.76', '0.47', '0', '-0.02', '0', '1', '1'),
(5, '5', 'epk', '2', '0', '556.03', '161.21', '12.76', '0.47', '0', '-0.02', '130', '0.3', '1'),
(6, '6', 'PATTERN', '10', '0', '556.0328', '161.208', '12.7628', '556.0328', '161.208', '12.7628', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000696d3_cope`
--

CREATE TABLE IF NOT EXISTS `6000696d3_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000696d3_cope`
--

INSERT INTO `6000696d3_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '171.12', '164.39', '9.55', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '388.84', '162.31', '12.16', '0.14', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '451.84', '162.31', '13.47', '0.14', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '555.21', '161.19', '16.29', '0.14', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '736.85', '159.16', '18.48', '0.14', '0', '0.01', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '840.38', '159.16', '16.57', '0.14', '0', '0.01', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '903.13', '158.38', '15.81', '0.14', '0', '0.01', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '1119.97', '155.85', '10.9', '0.14', '0', '0.01', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '227.86', '-62.03', '28.52', '-3.55', '0', '0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '398.22', '-64.69', '27.68', '-3.55', '0', '0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '566.21', '-67.03', '26.73', '-3.55', '0', '0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '736.72', '-67.03', '27.83', '-3.55', '0', '0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '903.97', '-67.78', '21.8', '-3.55', '0', '0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '1073.37', '-69.16', '25.32', '-26.44', '0', '0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '168.2', '-221.6', '9.39', '-1.1', '0', '0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '385.13', '-223.52', '13.66', '-1.1', '0', '0.01', '0', '1', '1'),
(17, '17', 'PIN1', '6', '69', '449.89', '-223.52', '20.26', '-1.1', '0', '0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '69', '553.44', '-224.13', '22.89', '-1.1', '0', '0.01', '0', '1', '1'),
(19, '19', 'PIN1', '6', '69', '734.97', '-224.96', '14.55', '9.72', '0', '0.01', '0', '1', '1'),
(20, '20', 'PIN1', '6', '69', '837.8', '-224.96', '10.13', '9.72', '0', '0.01', '0', '1', '1'),
(21, '21', 'PIN1', '6', '69', '900.6', '-225.87', '20.52', '9.72', '0', '0.01', '0', '1', '1'),
(22, '22', 'PIN1', '6', '69', '1117.71', '-227.73', '15.7', '9.72', '0', '0.01', '0', '1', '1'),
(23, '23', 'PIN1', '6', '69', '225.09', '-449.73', '20.46', '-4.33', '0', '0.01', '0', '1', '1'),
(24, '24', 'PIN1', '6', '69', '395.9', '-450.52', '27.79', '-4.33', '0', '0.01', '0', '1', '1'),
(25, '25', 'PIN1', '6', '69', '563.68', '-450.98', '29.25', '-4.33', '0', '0.01', '0', '1', '1'),
(26, '26', 'PIN1', '6', '69', '734.93', '-452.16', '31.58', '-4.33', '0', '0.01', '0', '1', '1'),
(27, '27', 'PIN1', '6', '69', '901.75', '-452.88', '28.77', '-4.33', '0', '0.01', '0', '1', '1'),
(28, '28', 'PIN1', '6', '69', '1073.28', '-454.62', '24.94', '113.15', '0', '0', '0', '1', '1'),
(29, '101', 'epk', '2', 'SI_Apilado', '646.69', '83.49', '-17.39', '90.04', '0.2', '-0.13', '180', '0.3', '1'),
(30, '101', 'epk', '2', 'SI_Apilado', '646.69', '-296.79', '-18.07', '90.04', '0.2', '-0.13', '180', '0.3', '1'),
(31, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '644.55', '-284.46', '-152.2', '1.94', '0.27', '-0.2', '177', '1', '1'),
(32, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '645.17', '96.36', '-150.81', '1.94', '0.26', '-0.2', '177', '1', '1'),
(33, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '643.06', '-275.4', '-364.66', '19.41', '0.3', '-0.24', '178', '1', '1'),
(34, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '645.48', '100.71', '-361.37', '19.41', '0.3', '-0.24', '178', '1', '1'),
(35, '35', 'PATTERN', '10', '0', '645.4844', '100.708', '361.3704', '645.4844', '100.708', '-361.3704', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000696nm_cope`
--

CREATE TABLE IF NOT EXISTS `6000696nm_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000696nm_cope`
--

INSERT INTO `6000696nm_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1037.91', '-408.8', '4.9', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1012.7', '-408.58', '7.95', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '169.79', '162.54', '-2.89', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '387.69', '161.21', '0.13', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '451.12', '160.67', '2.76', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '554.09', '159.79', '3.97', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '735.79', '158.75', '3.98', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '839.25', '157.93', '3.22', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '901.55', '157.51', '1.68', '0', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '1119.68', '155.05', '-0.5', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '226.44', '-63.65', '10.33', '-8.46', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '397.41', '-66.23', '10.32', '-8.46', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '564.82', '-68.08', '12.83', '-8.46', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '736.29', '-67.77', '16.62', '-8.46', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '902.79', '-69.2', '15.18', '-8.46', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '1072.92', '-70.93', '14.02', '-34.34', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '69', '168.05', '-223.61', '-4.17', '1.91', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '69', '384.56', '-225.01', '-0.75', '1.91', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '69', '448.47', '-225.55', '1.96', '1.91', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '69', '552.18', '-226.01', '2.11', '1.91', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '69', '733.69', '-226.65', '0.4', '1.91', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '69', '837.68', '-227.07', '0.38', '1.91', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '69', '900.85', '-227.77', '2.02', '1.91', '0', '0', '0', '1', '1'),
(24, '24', 'PIN1', '6', '69', '1117.04', '-229.64', '-2.73', '1.91', '0', '0', '0', '1', '1'),
(25, '25', 'PIN1', '6', '69', '224.42', '-451.35', '6.58', '1.91', '0', '0', '0', '1', '1'),
(26, '26', 'PIN1', '6', '69', '395.15', '-449.92', '17.9', '-8.23', '0', '0', '0', '1', '1'),
(27, '27', 'PIN1', '6', '69', '563.24', '-452.66', '13.43', '-3.46', '0', '0', '0', '1', '1'),
(28, '28', 'PIN1', '6', '69', '733.68', '-454.18', '14', '-3.46', '0', '0', '0', '1', '1'),
(29, '29', 'PIN1', '6', '69', '901.09', '-454.24', '12.44', '-3.46', '0', '0', '0', '1', '1'),
(30, '30', 'PIN1', '6', '69', '1071.04', '-455.21', '10.3', '25.04', '0', '0', '0', '1', '1'),
(31, '31', 'epk', '2', '0', '643.88', '-299.01', '-20.65', '89.99', '0', '0', '180', '0.3', '1'),
(32, '32', 'epk', '2', '0', '644.01', '83.06', '-18.9', '89.99', '0', '0', '180', '0.3', '1'),
(33, '33', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '642.35', '95.74', '-156.81', '-3.58', '0.2', '-0.13', '178', '1', '1'),
(34, '34', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '644.26', '-288.8', '-159.3', '-3.58', '0.2', '-0.13', '178', '1', '1'),
(35, '35', 'LOC07', '1', '0', '644.76', '-288.15', '-52.8', '-1.21', '0', '0', '0', '1', '1'),
(36, '36', 'LOC07', '1', '0', '645.25', '93.98', '-52.01', '-1.21', '0', '0', '0', '1', '1'),
(37, '37', 'kmx_2000_tube_7x4 sleeve', '3', '0', '645.42', '-280.74', '-353.2', '9.64', '0.17', '-0.11', '178', '1', '1'),
(38, '38', 'kmx_2000_tube_7x4 sleeve', '3', '0', '648.82', '101.7', '-349.21', '9.64', '0.17', '-0.11', '178', '1', '1'),
(39, '39', 'SPRUE', '4', '0', '1344.01', '-514.35', '-386.86', '2.34', '0', '0', '124', '1', '1'),
(40, '40', 'PATTERN', '10', '0', '1344.0128', '514.3496', '386.8588', '1344.0128', '-514.3496', '-386.8588', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000721_cope`
--

CREATE TABLE IF NOT EXISTS `6000721_cope` (
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
-- Volcado de datos para la tabla `6000721_cope`
--

INSERT INTO `6000721_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '257.44', '89.4', '-56.75', '59.1', '0.68', '-0.33', '0', '1', '1'),
(2, '2', 'NUMDEC', '5', '0', '243.64', '68.02', '-54.08', '59.22', '0.68', '-0.33', '0', '1', '1'),
(3, '3', 'NUMUNID', '5', '0', '1157.91', '93.15', '-50.33', '58.12', '0.68', '-0.33', '0', '1', '1'),
(4, '4', 'NUMDEC', '5', '0', '1144.51', '71.98', '-50.02', '58.12', '0.68', '-0.33', '0', '1', '1'),
(5, '101', 'blk_stl', '2', 'SI_Apilado', '341.23', '-164.37', '-71', '-1', '0.13', '-0.08', '190', '0.3', '1'),
(6, '101', 'blk_stl', '2', 'SI_Apilado', '1245.48', '-170.31', '-69.31', '-0.37', '0.21', '-0.14', '190', '0.3', '1'),
(7, '102', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '341.9', '-164.23', '-198.23', '25.24', '0.28', '-0.23', '225', '1', '1'),
(8, '102', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '1245.46', '-168.75', '-197.96', '25.24', '0.28', '-0.23', '225', '1', '1'),
(9, '9', 'LOC06', '1', '0', '339.27', '-161.08', '-99.8', '-1.3', '0', '0.01', '0', '1', '1'),
(10, '10', 'LOC06', '1', '0', '1245.54', '-167.67', '-96.87', '-1.3', '0', '0.01', '0', '1', '1'),
(11, '11', 'SPRUE', '4', '0', '789.48', '-484.29', '-315.42', '-1.45', '-0.01', '0', '124', '1', '1'),
(12, '12', 'LID05', '8', '0', '339.19', '-161.06', '-328.23', '0', '0', '0', '0', '1', '1'),
(13, '13', 'LID05', '8', '0', '1245.41', '-167.25', '-326.22', '0', '0', '0', '0', '1', '1'),
(14, '14', 'PATTERN', '10', '0', '1775.9188', '649.8834', '341.3436', '-188.774', '441.2248', '-338.9808', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000721_drag`
--

CREATE TABLE IF NOT EXISTS `6000721_drag` (
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
  `Altura Patron Entidad` mediumtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000721_drag`
--

INSERT INTO `6000721_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'eox_eoy_stl', '2', 'SI_Apilado', '312.32', '-35.04', '-145.47', '1.25', '0.06', '-0.04', '80', '0.03', '1'),
(2, '101', 'eox_eoy_stl', '2', 'SI_Apilado', '1214.35', '-45.87', '-145.9', '-0.04', '0.06', '-0.04', '80', '0.03', '1'),
(3, '3', 'PATTERN', '10', '0', '222.6264', '373.938', '255.0888', '1750.1964', '-770.2216', '-254.0764', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000728_cope`
--

CREATE TABLE IF NOT EXISTS `6000728_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000728_cope`
--

INSERT INTO `6000728_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '802.36', '223.35', '-19.7', '0.08', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '802.78', '248.9', '-17.23', '0.08', '0', '0', '0', '1', '1'),
(3, '101', 'epl_stl', '2', 'SI_Apilado', '944.45', '238.09', '-45.96', '-0.01', '0.19', '-0.15', '225', '0.3', '1'),
(4, '101', 'epl_stl', '2', 'SI_Apilado', '364.45', '245.3', '-44.72', '-0.01', '0.19', '-0.15', '225', '0.3', '1'),
(5, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '365.52', '249.06', '-197.51', '3.74', '0.04', '-0.03', '254', '1', '1'),
(6, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '944.52', '242.41', '-198.24', '3.74', '0.04', '-0.03', '254', '1', '1'),
(7, '7', 'LOC07', '1', '0', '365.01', '249.25', '-81.27', '1.92', '0', '0', '0', '1', '1'),
(8, '8', 'LOC07', '1', '0', '944.85', '242.16', '-82.58', '1.93', '0', '0', '0', '1', '1'),
(9, '9', 'SPRUE', '4', '0', '636.74', '-43', '-345.4', '-0.12', '-0.01', '0', '124', '1', '1'),
(10, '10', 'LID05', '8', '0', '944.85', '242.16', '-356.32', '0', '0', '0', '0', '1', '1'),
(11, '11', 'LID05', '8', '0', '365.01', '249.25', '-356.77', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PATTERN', '10', '0', '1475.2544', '237.6208', '371.0892', '-160.2136', '574.23', '-375.6756', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000728_drag`
--

CREATE TABLE IF NOT EXISTS `6000728_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000728_drag`
--

INSERT INTO `6000728_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '75', '1032.69', '-150.84', '-63.73', '-0.09', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '75', '375.4', '-140.6', '-66.39', '-0.09', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '75', '1193.63', '-156.57', '-61.35', '139.47', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '75', '864.25', '-150.96', '-85.53', '139.47', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '75', '699.67', '-147.86', '-65.41', '139.47', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '75', '536.43', '-145.09', '-64.79', '139.47', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '75', '207.33', '-138.03', '-89.85', '128.03', '-0.01', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '75', '42.23', '-135.95', '-63.26', '123.86', '-0.01', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '75', '71.28', '-373.94', '-63.76', '-0.83', '-0.01', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '75', '236.03', '-376.81', '-64.22', '-0.83', '-0.01', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '75', '399.72', '-379.29', '-66.15', '-0.83', '-0.01', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '75', '565.19', '-382.72', '-64.46', '-0.83', '-0.01', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '75', '728.39', '-385.6', '-65.45', '-0.83', '-0.01', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '75', '894.03', '-387.92', '-63.17', '-0.83', '-0.01', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '75', '1056.8', '-390.71', '-62.87', '-0.83', '-0.01', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '75', '1219.88', '-391.67', '-62.15', '66.31', '-0.01', '0', '0', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '1456.9628', '585.508', '203.8872', '-187.5356', '189.8708', '-210.6492', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000731_cope`
--

CREATE TABLE IF NOT EXISTS `6000731_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000731_cope`
--

INSERT INTO `6000731_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1322.87', '288.22', '-1.15', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1348.39', '289.16', '0.25', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '40', '131.36', '350.05', '-2.49', '16.27', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '40', '358.1', '352.53', '-1.97', '16.27', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '40', '542.19', '352.72', '-1.7', '16.27', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '40', '769.21', '353.54', '-1.95', '16.27', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '40', '954.07', '354.84', '1.66', '16.27', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '40', '1180.62', '354.83', '2.73', '16.27', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '40', '1364.88', '356.05', '2.56', '16.27', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '40', '1592.69', '355.54', '2.54', '-112.44', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '40', '156.48', '108.78', '-1.05', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '40', '384.52', '110.34', '-1.37', '0', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '40', '568.43', '111.77', '-1.62', '0', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '40', '796.26', '110.79', '-0.71', '0', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '40', '981.2', '112.44', '0.75', '0', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '40', '1208.68', '112.23', '1.11', '0', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '40', '1392', '112.53', '2.33', '0', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '40', '1620.97', '113.53', '0.65', '156.23', '0', '0', '0', '1', '1'),
(19, '101', 'epl_stl', '2', 'SI_Apilado', '876.28', '233.63', '-31.4', '0', '0', '0', '225', '0.3', '1'),
(20, '102', 'drd_stl', '2', 'SI_Apilado', '260.76', '227.3', '-22', '90.27', '0.08', '-0.05', '35', '0.05', '1'),
(21, '102', 'drd_stl', '2', 'SI_Apilado', '1115.86', '231.06', '-20.12', '90.27', '0.08', '-0.05', '35', '0.05', '1'),
(22, '102', 'drd_stl', '2', 'SI_Apilado', '1491.95', '235.89', '-20.72', '-90.16', '0.08', '-0.05', '35', '0.05', '1'),
(23, '102', 'drd_stl', '2', 'SI_Apilado', '637.57', '234.74', '-21.48', '-90.16', '0.08', '-0.05', '35', '0.05', '1'),
(24, '103', 'kmx_21_rnd_9x6-3x10 sleeve', '3', 'NO_Apilado', '873.97', '230.44', '-158.99', '0', '0', '0', '225', '1', '1'),
(25, '25', 'LOC09', '1', '0', '876.68', '232.72', '-65.94', '0.34', '0', '0', '0', '1', '1'),
(26, '104', 'kmx_2000_tube_9x6 sleeve', '3', 'NO_Apilado', '873.97', '230.44', '-366.12', '0', '0', '0', '225', '1', '1'),
(27, '27', 'SPRUE', '4', '0', '878.03', '-60.43', '-424.3', '0.11', '-0.01', '0', '124', '1', '1'),
(28, '28', 'LID07', '8', '0', '873.97', '230.44', '-449.72', '0', '0', '0', '0', '1', '1'),
(29, '29', 'PATTERN', '10', '0', '1905.69', '253.89', '456.8608', '-128.84', '597.25', '-449.46', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000731_drag`
--

CREATE TABLE IF NOT EXISTS `6000731_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000731_drag`
--

INSERT INTO `6000731_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'drd_stl', '2', '0', '259.15', '-191.58', '-106', '88.45', '0.15', '-0.09', '35', '0.05', '1'),
(2, '2', 'drd_stl', '2', '0', '259.39', '-259.87', '-106', '88.45', '0.15', '-0.09', '35', '0.05', '1'),
(3, '3', 'drd_stl', '2', '0', '1115.18', '-259.92', '-103', '88.45', '0.15', '-0.09', '35', '0.05', '1'),
(4, '4', 'drd_stl', '2', '0', '1115.04', '-192.75', '-103', '88.45', '0.15', '-0.09', '35', '0.05', '1'),
(5, '5', 'drd_stl', '2', '0', '1494.7', '-189.11', '-103.5', '-90.56', '0.15', '-0.09', '35', '0.05', '1'),
(6, '6', 'drd_stl', '2', '0', '1494.81', '-254.8', '-103.5', '-90.56', '0.15', '-0.09', '35', '0.05', '1'),
(7, '7', 'drd_stl', '2', '0', '639.53', '-253.77', '-103.5', '-90.56', '0.15', '-0.09', '35', '0.05', '1'),
(8, '8', 'drd_stl', '2', '0', '639.93', '-187.1', '-103.5', '-90.56', '0.15', '-0.09', '35', '0.05', '1'),
(9, '9', 'PATTERN', '10', '0', '1867.8792', '601.5892', '214.1492', '-125.0224', '247.9124', '-214.9976', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000736_cope`
--

CREATE TABLE IF NOT EXISTS `6000736_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000736_cope`
--

INSERT INTO `6000736_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1016.99', '220.96', '-49.12', '-89.45', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1041.83', '219.96', '-49.86', '-89.45', '0', '0', '0', '1', '1'),
(3, '3', 'epa_stl', '2', '0', '627.15', '244.46', '-66.59', '7.98', '0.1', '-0.06', '190', '0.3', '1'),
(4, '4', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '622.22', '244.57', '-205.14', '8.18', '0.1', '-0.07', '202', '1', '1'),
(5, '5', 'LOC08', '1', '0', '629.41', '241.75', '-105.78', '-0.01', '0', '0.04', '0', '1', '1'),
(6, '6', 'kmx_21_tube_8x4 sleeve', '3', '0', '621.08', '251.63', '-379.27', '9.42', '0.14', '-0.08', '190', '1', '1'),
(7, '7', 'SPRUE', '4', '0', '759.71', '-21.16', '-413.3', '0.31', '0', '0', '124', '1', '1'),
(8, '8', 'LID01', '8', '0', '620.12', '249.35', '-421.85', '8.98', '0.32', '-0.27', '0', '1', '1'),
(9, '9', 'PATTERN', '10', '0', '1481.5924', '235.7856', '448.79', '-238.3292', '630.2264', '-442.2704', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000736_drag`
--

CREATE TABLE IF NOT EXISTS `6000736_drag` (
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
-- Volcado de datos para la tabla `6000736_drag`
--

INSERT INTO `6000736_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '363.13', '-154.8', '-46.16', '-0.03', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '70', '955.45', '-160.35', '-42.31', '145.98', '0.01', '-0.02', '0', '1', '1'),
(3, '3', 'PIN1', '6', '70', '769', '-157.33', '-45.48', '145.99', '0.01', '-0.02', '0', '1', '1'),
(4, '4', 'PIN1', '6', '70', '550.57', '-154.06', '-44.71', '43.59', '0.01', '-0.02', '0', '1', '1'),
(5, '5', 'PIN1', '6', '70', '1178.83', '-168.46', '-39.96', '-90.85', '0.02', '-0.04', '0', '1', '1'),
(6, '6', 'PIN1', '6', '70', '137.51', '-151.02', '-44.66', '-122.17', '0.02', '-0.04', '0', '1', '1'),
(7, '7', 'PIN1', '6', '70', '109.18', '-386.38', '-44.47', '0.48', '0.02', '-0.04', '0', '1', '1'),
(8, '8', 'PIN1', '6', '70', '331.69', '-388.86', '-44.89', '0.43', '0.02', '-0.03', '0', '1', '1'),
(9, '9', 'PIN1', '6', '70', '518.67', '-392.29', '-45.14', '0.43', '0.02', '-0.03', '0', '1', '1'),
(10, '10', 'PIN1', '6', '70', '739.89', '-394.85', '-44.92', '0.43', '0.02', '-0.03', '0', '1', '1'),
(11, '11', 'PIN1', '6', '70', '926.69', '-398.49', '-43.12', '0.43', '0.02', '-0.03', '0', '1', '1'),
(12, '12', 'PIN1', '6', '70', '1148.11', '-399.8', '-42.29', '45.23', '0.02', '-0.05', '0', '1', '1'),
(13, '101', 'epn', '2', 'SI_Apilado', '71.81', '-268.15', '-69.75', '-90.31', '0.06', '-0.03', '79', '0.05', '1'),
(14, '101', 'epn', '2', 'SI_Apilado', '1215.81', '-282.72', '-66.58', '90.24', '0.06', '-0.03', '79', '0.05', '1'),
(15, '15', 'PATTERN', '10', '0', '1517.662', '653.8802', '208.8228', '-221.3396', '198.6896', '-213.4412', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000752_cope`
--

CREATE TABLE IF NOT EXISTS `6000752_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000752_cope`
--

INSERT INTO `6000752_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '354.32', '149.98', '-45.13', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '354.32', '175.75', '-45.13', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '98', '119.75', '342.86', '-47.36', '-0.01', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '98', '295.52', '339.73', '-45.9', '20.58', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '98', '471.92', '336.1', '-46.76', '20.58', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '98', '647.29', '330.04', '-50.66', '26.53', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '98', '822.86', '327.33', '-49.38', '24.91', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '98', '999.48', '323.9', '-48.9', '24.91', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '98', '1175.6', '320.51', '-48.19', '24.91', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '98', '1349.33', '311.81', '-47.47', '-84.18', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '98', '158.12', '104.34', '-51.29', '-7.14', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '98', '333.96', '99.52', '-50.72', '-22.42', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '98', '509.95', '96.13', '-122.74', '-16.88', '0', '-0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '98', '685.96', '91.04', '-50.06', '-16.88', '0', '-0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '98', '862.01', '86.52', '-50.58', '-16.88', '0', '-0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '98', '1038.47', '83.35', '-50.86', '-16.88', '0', '-0.01', '0', '1', '1'),
(17, '17', 'PIN1', '6', '98', '1214.69', '80.52', '-51', '-19.52', '0', '-0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '98', '1387.39', '78.92', '-47.57', '116.7', '0', '0', '0', '1', '1'),
(19, '19', 'epa_stl', '2', '0', '597.58', '211.8', '-64.48', '-0.07', '0.01', '-0.01', '190', '0.3', '1'),
(20, '20', 'epa_stl', '2', '0', '1208.55', '199.79', '-64.01', '-0.07', '0.01', '-0.01', '190', '0.3', '1'),
(21, '21', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '98', '598.12', '207.95', '-213.95', '4.18', '0.05', '-0.03', '175', '1', '1'),
(22, '22', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '98', '1207.15', '200.57', '-215.45', '4.19', '0.06', '-0.05', '175', '1', '1'),
(23, '23', 'LOC06', '1', '0', '602.59', '207.05', '-106.19', '-0.89', '-0.01', '0', '0', '1', '1'),
(24, '24', 'LOC06', '1', '0', '1210.47', '194.17', '-105.9', '-0.89', '-0.01', '0', '0', '1', '1'),
(25, '25', 'LID03', '8', '0', '602.59', '207.05', '-360.28', '7.57', '0.32', '-0.27', '0', '1', '1'),
(26, '26', 'LID03', '8', '0', '1210.47', '194.17', '-361.13', '7.57', '0.32', '-0.27', '0', '1', '1'),
(27, '27', 'PATTERN', '10', '0', '1648.1844', '254.984', '375.8392', '-186.6128', '563.956', '-375.8392', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000752_drag`
--

CREATE TABLE IF NOT EXISTS `6000752_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000752_drag`
--

INSERT INTO `6000752_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'epn', '2', 'SI_Apilado', '66.31', '-224.3', '-71.57', '-90.17', '0.03', '-0.02', '79', '0.05', '1'),
(2, '101', 'epn', '2', 'SI_Apilado', '1428.53', '-251.68', '-68.1', '90.16', '0.03', '-0.02', '79', '0.05', '1'),
(3, '3', 'PATTERN', '10', '0', '1681.878', '608.1088', '205.94', '-187.7552', '229.0024', '-210.4144', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000758bw_cope`
--

CREATE TABLE IF NOT EXISTS `6000758bw_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000758bw_cope`
--

INSERT INTO `6000758bw_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '238.34', '-134.72', '8.89', '-0.03', '0', '-0.01', '0', '1', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '752.88', '-243.23', '-18.07', '-1.11', '0.15', '-0.11', '230', '0.1', '1'),
(3, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '756.47', '-247.59', '-146.63', '26.67', '0.32', '-0.27', '205', '1', '1'),
(4, '4', 'PATTERN', '10', '0', '756.4676', '247.5924', '146.6344', '756.4676', '-247.5924', '-146.6344', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000758pattej_cope`
--

CREATE TABLE IF NOT EXISTS `6000758pattej_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000758pattej_cope`
--

INSERT INTO `6000758pattej_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN', '6', '0', '239.18', '-133.85', '18.61', '0.03', '0', '-0.01', '0', '1', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '759.22', '206.82', '-16.76', '-179.95', '0.17', '-0.13', '230', '0.1', '1'),
(3, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '758.1', '208.47', '-143.49', '0', '-0.05', '0.2', '205', '1', '1'),
(4, '4', 'PATTERN', '10', '0', '758.1024', '208.4736', '143.4872', '758.1024', '208.4736', '-143.4872', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000758patt_cope`
--

CREATE TABLE IF NOT EXISTS `6000758patt_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000758patt_cope`
--

INSERT INTO `6000758patt_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '240.66', '332.34', '11.39', '-0.01', '0', '-0.01', '0', '1', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '752.5', '-241.63', '-18.89', '-1.21', '0.12', '-0.09', '230', '0.3', '1'),
(3, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '751.5', '-250.66', '-143.72', '19.98', '0.24', '-0.19', '205', '1', '1'),
(4, '4', 'PATTERN', '10', '0', '751.504', '250.6612', '143.7232', '751.504', '-250.6612', '-143.7232', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000758test_cope`
--

CREATE TABLE IF NOT EXISTS `6000758test_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000758test_cope`
--

INSERT INTO `6000758test_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '236.94', '325.45', '10.26', '0.01', '-0.02', '0.01', '0', '1', '1'),
(2, '2', 'PIN1', '6', '70', '501.49', '325.66', '-1.06', '0.01', '-0.02', '0.01', '0', '1', '1'),
(3, '3', 'PIN1', '6', '70', '611.28', '326.41', '-4.73', '0.01', '-0.02', '0.01', '0', '1', '1'),
(4, '4', 'PIN1', '6', '70', '875.01', '327.57', '-4.02', '0.01', '-0.02', '0.01', '0', '1', '1'),
(5, '5', 'PIN1', '6', '70', '986.14', '327.99', '-4.55', '0.01', '-0.02', '0.01', '0', '1', '1'),
(6, '101', 'EHF', '2', 'NO_Apilado', '755.54', '-242.79', '-20.19', '0.47', '0.07', '0.04', '230', '0.1', '1'),
(7, '101', 'EHF', '2', 'NO_Apilado', '758.94', '205.11', '-22.63', '179.13', '-0.06', '-0.03', '230', '0.1', '1'),
(8, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '755.04', '-242.81', '-149.1', '0.25', '0.25', '0.01', '205', '1', '1'),
(9, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '758.35', '205.65', '-138.18', '0.25', '0.25', '0.01', '205', '1', '1'),
(10, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '755.73', '-243.45', '-357.47', '11.39', '0.18', '0.03', '205', '1', '1'),
(11, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '758.27', '204.53', '-350.3', '11.39', '0.18', '0.03', '205', '1', '1'),
(12, '12', 'PATTERN', '10', '0', '758.2748', '204.5292', '350.3012', '758.2748', '204.5292', '-350.3012', '0', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000758_cope`
--

INSERT INTO `6000758_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '239.28', '327.61', '12.32', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '70', '265.17', '98.51', '11.25', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '70', '241.95', '-139.94', '9.63', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '70', '268.66', '-369.34', '7.45', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '70', '532.21', '-368.37', '11.15', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '70', '642.97', '-368.61', '11.34', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '70', '507.35', '-139.54', '12.16', '0', '0', '0.01', '0', '1', '1'),
(8, '8', 'PIN1', '6', '70', '617.72', '-139.33', '12.55', '0', '0', '0.01', '0', '1', '1'),
(9, '9', 'PIN1', '6', '70', '529.75', '99.43', '12.81', '0', '0', '0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '70', '640.02', '99.55', '14.31', '0', '0', '0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '70', '503.45', '328.12', '15.6', '0', '0', '0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '70', '614', '328.57', '17.75', '0', '0', '0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '70', '879.02', '329.83', '18.06', '0', '0', '0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '70', '989.02', '330.01', '15.13', '0', '0', '0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '70', '904.21', '99.57', '14.3', '-14.84', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '70', '1015.24', '100.88', '13.39', '0', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '70', '881.49', '-136.98', '13.89', '0', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '70', '992.43', '-137.57', '12.12', '0', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '70', '905.64', '-365.41', '11.72', '115.65', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '70', '1018.12', '-366.67', '10.65', '0', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '70', '1280.58', '-364.69', '8.82', '117.41', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '70', '1255.15', '-135.7', '9.61', '117.41', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '70', '1278.42', '102.83', '10.89', '117.41', '0', '0', '0', '1', '1'),
(24, '24', 'PIN1', '6', '70', '1254.27', '330.87', '12.94', '0', '0', '0', '0', '1', '1'),
(25, '101', 'EHF', '2', 'NO_Apilado', '758.56', '-242.9', '-28.72', '0', '0', '0', '230', '0.3', '1'),
(26, '101', 'EHF', '2', 'NO_Apilado', '759.51', '206.12', '-16.86', '180', '0', '0', '230', '0.3', '1'),
(27, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '759.24', '-241.52', '-149.03', '0', '0', '0', '205', '1', '1'),
(28, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '758.15', '208.92', '-144.87', '0', '0', '0', '205', '1', '1'),
(29, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '759.95', '-241.22', '-353.56', '0', '0', '0', '205', '1', '1'),
(30, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '758.54', '208.18', '-348.79', '0', '0', '0', '205', '1', '1'),
(31, '31', 'PATTERN', '10', '0', '1789.9136', '558.6', '460.188', '-49.1943999999999', '532.0412', '-450.9652', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000759_cope`
--

CREATE TABLE IF NOT EXISTS `6000759_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000759_cope`
--

INSERT INTO `6000759_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1173.91', '172.11', '-3.66', '0', '0.01', '0.02', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1148.35', '172.11', '-4.01', '0', '0.01', '0.02', '0', '1', '1'),
(3, '3', 'PIN1', '6', '79', '74.87', '379.83', '-3.13', '-0.05', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '79', '291.88', '374.1', '-2.75', '-0.05', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '79', '416.51', '370.49', '-1.53', '-0.05', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '79', '642.94', '365.9', '2.36', '-0.05', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '79', '696.78', '363.99', '1.46', '-0.05', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '79', '924.49', '357.46', '0.24', '-0.05', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '79', '980.36', '356.55', '-2.07', '-0.05', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '79', '1196.23', '349.05', '-1.61', '-110.51', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '79', '127.7', '135.3', '-4.78', '0.07', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '79', '345.14', '128.89', '-3.37', '0.07', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '79', '400.13', '128.99', '-12.13', '-5.69', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '79', '627.26', '121.93', '-1.4', '-0.01', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '79', '681.61', '120.79', '-0.52', '-0.01', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '79', '908.45', '113.18', '-0.95', '-0.01', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '79', '1031.77', '110.88', '-1.46', '-0.01', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '79', '1249.19', '103.32', '-3.71', '-126.38', '0', '-0.01', '0', '1', '1'),
(19, '19', 'eiw', '2', '0', '325.31', '254.37', '-19.17', '-90.09', '0.03', '-0.02', '70', '0.3', '1'),
(20, '20', 'eiw', '2', '0', '1000.85', '234.46', '-19.56', '-90.97', '0.03', '-0.02', '70', '0.3', '1'),
(21, '21', 'epf', '2', '0', '662.54', '243.16', '-31.46', '0.03', '0.1', '-0.07', '189', '0.3', '1'),
(22, '22', 'kmx_21_rnd_9x4-5x10 sleeve', '3', '0', '660.88', '242.62', '-161.96', '15.21', '0.18', '-0.14', '228', '1', '1'),
(23, '23', 'LOC06', '1', '0', '665.42', '240.78', '-71.13', '-0.01', '0', '0.01', '0', '1', '1'),
(24, '24', 'kmx_2000_tube_9x6 sleeve', '3', '0', '662.25', '245.4', '-362.2', '17.73', '0.26', '-0.16', '225', '1', '1'),
(25, '25', 'SPRUE', '4', '0', '685.42', '-52.79', '-417.01', '-0.31', '0', '0', '124', '1', '1'),
(26, '26', 'LID01', '8', '0', '661.91', '248.69', '-443.93', '11.94', '0.32', '-0.27', '0', '1', '1'),
(27, '27', 'PATTERN', '10', '0', '1513.0996', '271.31', '447.7588', '-205.3204', '624.808', '-445.5048', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000764_cope`
--

CREATE TABLE IF NOT EXISTS `6000764_cope` (
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
-- Volcado de datos para la tabla `6000764_cope`
--

INSERT INTO `6000764_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '768.76', '389.85', '-44.99', '4.1', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '794.83', '389.81', '-52.55', '4.1', '0', '0', '0', '1', '1'),
(3, '3', 'egs_stl', '2', '0', '950.06', '319.52', '-72.31', '179.18', '0.23', '-0.18', '245', '0.3', '1'),
(4, '4', 'egs_stl', '2', '0', '450.72', '319.39', '-74.1', '179.19', '0.22', '-0.17', '245', '0.3', '1'),
(5, '5', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '445.53', '352.18', '-200.92', '2.27', '0.28', '-0.23', '202', '1', '1'),
(6, '6', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '945.82', '352.23', '-200.98', '2.28', '0.28', '-0.23', '202', '1', '1'),
(7, '7', 'LOC08', '1', '0', '949', '353.35', '-99.5', '-1.31', '0', '0', '0', '1', '1'),
(8, '8', 'LOC08', '1', '0', '449.52', '354.07', '-102.69', '-1.31', '0', '0', '0', '1', '1'),
(9, '9', 'kmx_21_tube_8x6 sleeve', '3', '0', '949.41', '353.57', '-399.74', '24.41', '0.32', '-0.27', '202', '1', '1'),
(10, '10', 'kmx_21_tube_8x6 sleeve', '3', '0', '449.41', '354.09', '-401.97', '24.42', '0.31', '-0.27', '202', '1', '1'),
(11, '11', 'SPRUE', '4', '0', '706.4', '-4.35', '-474.4', '-1.21', '-0.01', '0', '124', '1', '1'),
(12, '12', 'LID04', '8', '0', '449.6', '354.78', '-476.34', '-0.54', '-0.47', '0.74', '0', '1', '1'),
(13, '13', 'LID04', '8', '0', '949.32', '343.27', '-475.42', '-0.54', '-0.47', '0.74', '0', '1', '1'),
(14, '14', 'PATTERN', '10', '0', '1669.726', '210.1472', '494.9604', '-271.596', '667.434', '-500.1284', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000764_drag`
--

CREATE TABLE IF NOT EXISTS `6000764_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000764_drag`
--

INSERT INTO `6000764_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '373.47', '-175.86', '-40.5', '133.27', '0', '-0.01', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '275.17', '-172.51', '-38.4', '133.27', '0', '-0.01', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '-4.36', '-164.15', '-39.93', '45.81', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '652.4', '-182.24', '-38.08', '45.06', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '750.17', '-185.81', '-37.94', '61.67', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '1030.19', '-193.75', '-30.78', '-0.14', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '1128.75', '-196.92', '-34.33', '-0.14', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '1406.14', '-206.45', '-28.07', '142.05', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '-32.81', '-448.65', '-38.67', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '246.58', '-455.68', '-37.43', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '344.99', '-459.17', '-38.7', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '623.37', '-467.32', '-39.28', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '721.59', '-469.96', '-37.02', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '1000.86', '-478.87', '-35.42', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '1098.89', '-481.59', '-35.34', '-0.11', '-0.01', '-0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '1376.55', '-488.98', '-29.74', '62.35', '-0.01', '-0.01', '0', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '1641.4672', '722.539', '197.1216', '-272.0004', '189.9464', '-203.7784', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000771_cope`
--

CREATE TABLE IF NOT EXISTS `6000771_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000771_cope`
--

INSERT INTO `6000771_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '1398.7', '-157.64', '-9.84', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMDEC', '5', '0', '1398.7', '-183.22', '-10.02', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '50', '199.98', '-290.21', '-12.79', '-0.24', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '50', '424.77', '-292.46', '-10.31', '-0.24', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '50', '630.81', '-293.21', '-9.52', '-0.24', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '50', '855.69', '-295.55', '-8.3', '-0.24', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '50', '1060.47', '-297.27', '-9.36', '-6.55', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '50', '1286.69', '-300.23', '-9.98', '-120.49', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '50', '268.96', '-36.19', '-11.6', '0', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '50', '493.29', '-38.92', '-9.28', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '50', '698.55', '-40.91', '-8.47', '5.89', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '50', '922.86', '-43.83', '-9.44', '5.89', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '50', '1129.61', '-45.43', '-8.38', '23.34', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '50', '1355.04', '-48.58', '-10.41', '162.73', '0', '0', '0', '1', '1'),
(15, '101', 'epa_stl', '2', 'SI_Apilado', '1064.95', '-170.08', '-29.77', '-5.76', '0', '0', '190', '0.3', '1'),
(16, '101', 'epa_stl', '2', 'SI_Apilado', '487.06', '-167.65', '-30.42', '-6.75', '0', '0', '190', '0.3', '1'),
(17, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '484.98', '-169.14', '-156.53', '0', '0', '0', '202', '1', '1'),
(18, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '1062.67', '-170.99', '-156.52', '0', '0', '0', '202', '1', '1'),
(19, '19', 'LOC08', '1', '0', '1068.19', '-172.66', '-66.61', '0', '0', '0', '0', '1', '1'),
(20, '20', 'LOC08', '1', '0', '489.48', '-171.09', '-66.9', '0', '0', '0', '0', '1', '1'),
(21, '21', 'LID05', '8', '0', '484.98', '-169.14', '-289.28', '0', '0', '0', '0', '1', '1'),
(22, '22', 'LID05', '8', '0', '1062.67', '-170.99', '-288.49', '0', '0', '0', '0', '1', '1'),
(23, '23', 'PATTERN', '10', '0', '69.5772000000002', '205.8832', '348.0532', '1625.0156', '-652.53', '-345.7932', '0', '1', '1');

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
-- Estructura de tabla para la tabla `6000795_cope`
--

CREATE TABLE IF NOT EXISTS `6000795_cope` (
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
-- Volcado de datos para la tabla `6000795_cope`
--

INSERT INTO `6000795_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '212.761108', '177.533568', '-59.58', '-89.95', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '186.180338', '177.311188', '-54.63', '-89.95', '0', '0', '0', '1', '1'),
(3, '101', 'egs_stl', '2', 'SI_Apilado', '422.692048', '244.310608', '-70.45', '-0.05', '0.13', '-0.09', '245', '0.3', '1'),
(4, '101', 'egs_stl', '2', 'SI_Apilado', '1087.995598', '238.577368', '-68.13', '-0.05', '0.13', '-0.09', '245', '0.3', '1'),
(5, '102', 'kmx_21_rnd_9x6-3x10 sleeve', '3', 'NO_Apilado', '1087.762028', '203.440548', '-195', '20.29', '0.25', '-0.19', '225', '1', '1'),
(6, '102', 'kmx_21_rnd_9x6-3x10 sleeve', '3', 'NO_Apilado', '421.562568', '206.973668', '-195', '20.3', '0.25', '-0.21', '225', '1', '1'),
(7, '7', 'LOC09', '1', '0', '424.412738', '211.535568', '-101.9', '-0.26', '0', '0', '0', '1', '1'),
(8, '8', 'LOC09', '1', '0', '1090.085758', '204.036178', '-102.79', '-0.26', '0', '0', '0', '1', '1'),
(9, '103', 'kmx_2000_tube_9x4 sleeve', '3', 'NO_Apilado', '1084.887568', '209.269638', '-383', '16.43', '0.27', '-0.21', '230', '1', '1'),
(10, '103', 'kmx_2000_tube_9x4 sleeve', '3', 'NO_Apilado', '422.084108', '216.840598', '-383', '16.43', '0.26', '-0.21', '230', '1', '1'),
(11, '11', 'SPRUE', '4', '0', '730.186918', '-25.510002', '-406', '-0.45', '0', '0', '124', '1', '1'),
(12, '12', 'LID01', '8', '0', '424.412738', '211.535568', '-438.96', '2.31', '0.32', '-0.27', '0', '1', '1'),
(13, '13', 'LID01', '8', '0', '1090.085758', '204.036178', '-438.03', '2.29', '0.33', '-0.3', '0', '1', '1'),
(14, '14', 'PATTERN', '10', '0', '1700.317448', '233.7615108', '442.104', '-170.0352', '627.868', '-442.7928', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000795_drag`
--

CREATE TABLE IF NOT EXISTS `6000795_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000795_drag`
--

INSERT INTO `6000795_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '45', '113.114858', '-124.848992', '-84.17', '-98.35', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '45', '286.227048', '-122.234672', '-36.52', '-0.04', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '45', '1205.505478', '-119.253472', '-35.58', '163.66', '0.01', '0.02', '0', '1', '1'),
(4, '4', 'PIN1', '6', '45', '1382.656258', '-118.284932', '-63.94', '-43.19', '0.01', '0.02', '0', '1', '1'),
(5, '5', 'PIN1', '6', '45', '1513.944638', '-119.421072', '-35.31', '-89.3', '0.01', '0.02', '0', '1', '1'),
(6, '6', 'PIN1', '6', '45', '1118.989218', '-120.545192', '-36.62', '-89.3', '0', '0.02', '0', '1', '1'),
(7, '7', 'PIN1', '6', '45', '1018.885038', '-121.266292', '-36.78', '-98.02', '0', '0.02', '0', '1', '1'),
(8, '8', 'PIN1', '6', '45', '855.863368', '-121.089292', '-39.17', '-98.01', '0', '0.02', '0', '1', '1'),
(9, '9', 'PIN1', '6', '45', '763.625458', '-122.293932', '-37.95', '-98.01', '0', '0.02', '0', '1', '1'),
(10, '10', 'PIN1', '6', '45', '663.789848', '-122.882062', '-35.75', '-98.01', '0', '0.02', '0', '1', '1'),
(11, '11', 'PIN1', '6', '45', '418.939498', '-123.725192', '-37.72', '-98.01', '0', '0.02', '0', '1', '1'),
(12, '12', 'PIN1', '6', '45', '499.748748', '-124.586502', '-36.88', '-98.01', '0', '0.02', '0', '1', '1'),
(13, '13', 'PIN1', '6', '45', '80.329928', '-407.613672', '-35.96', '0.17', '0.01', '0.02', '0', '1', '1'),
(14, '14', 'PIN1', '6', '45', '211.125098', '-406.644982', '-37.02', '0.17', '0.01', '0.02', '0', '1', '1'),
(15, '15', 'PIN1', '6', '45', '387.689618', '-406.022932', '-36.74', '0.05', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '45', '478.024678', '-405.489302', '-36.38', '0.05', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '45', '577.884358', '-405.270952', '-37.56', '0.05', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '45', '742.605028', '-404.429142', '-36.42', '0.05', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '45', '832.476578', '-404.490682', '-37.49', '0.05', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '45', '931.388558', '-403.582672', '-37.22', '0.05', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '45', '1095.843508', '-402.223722', '-35.53', '0.05', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '45', '1484.943868', '-400.703952', '-35.51', '156.83', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '45', '1179.875038', '-400.529282', '-35.75', '32.88', '0', '0', '0', '1', '1'),
(24, '24', 'PIN1', '6', '45', '1310.374178', '-400.834002', '-38.06', '37.19', '0', '0', '0', '1', '1'),
(25, '25', 'PATTERN', '10', '0', '1713.4089476', '643.8915196', '208.3484', '-142.9076', '181.808', '-208.9636', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000808amedias`
--

CREATE TABLE IF NOT EXISTS `6000808amedias` (
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
-- Volcado de datos para la tabla `6000808amedias`
--

INSERT INTO `6000808amedias` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'boa_stl', '2', '0', '1729.75', '290.56', '-65.72', '0.3', '0.13', '-0.11', '40', '0.2', '1'),
(2, '2', 'boa_stl', '2', '0', '-161.6', '317.53', '-67.68', '0.3', '0.13', '-0.11', '40', '0.2', '1'),
(3, '3', 'eic_stl', '2', '0', '1384.98', '261.3', '-83.89', '-1.27', '0.13', '-0.11', '290', '0.3', '1'),
(4, '4', 'eic_stl', '2', '0', '783.39', '270.19', '-80.03', '-1.27', '0.13', '-0.11', '290', '0.3', '1'),
(5, '5', 'eic_stl', '2', '0', '178.02', '279.79', '-80.9', '-1.27', '0.13', '-0.11', '290', '0.3', '1'),
(6, '6', 'kmx_21_rnd_10x7x12 sleeve', '3', '0', '1382.69', '236.2', '-238.46', '0.16', '0.32', '-0.27', '255', '1', '1'),
(7, '7', 'kmx_21_rnd_10x7x12 sleeve', '3', '0', '781.16', '241.96', '-235.32', '0.16', '0.32', '-0.27', '255', '1', '1'),
(8, '8', 'kmx_21_rnd_10x7x12 sleeve', '3', '0', '179.15', '253.27', '-238.82', '0.16', '0.32', '-0.27', '255', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000808_cope`
--

CREATE TABLE IF NOT EXISTS `6000808_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000808_cope`
--

INSERT INTO `6000808_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '1728.67', '154.42', '-35.51', '-1.51', '0', '0', '0', '1', '1'),
(2, '2', 'NUMDEC', '5', '0', '1755.51', '154.39', '-42.17', '-1.5', '0', '0', '0', '1', '1'),
(3, '3', 'boa_stl', '2', '0', '1729.75', '289.56', '-65.72', '0.3', '0.13', '-0.11', '40', '0.2', '1'),
(4, '4', 'boa_stl', '2', '0', '-161.6', '317.53', '-67.68', '0.3', '0.13', '-0.11', '40', '0.2', '1'),
(5, '5', 'eic_stl', '2', '0', '1384.98', '261.3', '-83.89', '-1.27', '0.13', '-0.11', '290', '0.3', '1'),
(6, '6', 'eic_stl', '2', '0', '783.39', '270.19', '-80.03', '-1.27', '0.13', '-0.11', '290', '0.3', '1'),
(7, '7', 'eic_stl', '2', '0', '178.02', '279.79', '-80.9', '-1.27', '0.13', '-0.11', '290', '0.3', '1'),
(8, '8', 'kmx_21_rnd_10x7x12 sleeve', '3', '0', '1382.69', '236.2', '-238.46', '0.16', '0.32', '-0.27', '255', '1', '1'),
(9, '9', 'kmx_21_rnd_10x7x12 sleeve', '3', '0', '781.16', '241.96', '-235.32', '0.16', '0.32', '-0.27', '255', '1', '1'),
(10, '10', 'kmx_21_rnd_10x7x12 sleeve', '3', '0', '179.15', '253.27', '-238.82', '0.16', '0.32', '-0.27', '255', '1', '1'),
(11, '11', 'LOC10', '1', '0', '180.03', '256.22', '-117.17', '-1.72', '0', '0', '0', '1', '1'),
(12, '12', 'LOC10', '1', '0', '782.53', '246.27', '-113.43', '-1.72', '0', '0', '0', '1', '1'),
(13, '13', 'LOC10', '1', '0', '1381.83', '239.42', '-116.75', '-1.72', '0', '0', '0', '1', '1'),
(14, '14', 'kmx_21_tube_10x2 sleeve', '3', '0', '1381.77', '239.41', '-415.51', '-1.14', '0.31', '-0.27', '250', '1', '1'),
(15, '15', 'kmx_21_tube_10x2 sleeve', '3', '0', '782.6', '246.25', '-411.73', '-1.14', '0.31', '-0.27', '250', '1', '1'),
(16, '16', 'kmx_21_tube_10x2 sleeve', '3', '0', '180.08', '256.21', '-414.03', '-1.14', '0.31', '-0.27', '250', '1', '1'),
(17, '17', 'SPRUE', '4', '0', '878.71', '-48.58', '-427.5', '3.51', '-0.01', '0', '124', '1', '1'),
(18, '18', 'LID08', '8', '0', '1381.82', '239.42', '-434.71', '0', '0', '0', '0', '1', '1'),
(19, '19', 'LID08', '8', '0', '782.52', '246.27', '-431.72', '0', '0', '0', '0', '1', '1'),
(20, '20', 'LID08', '8', '0', '180.02', '256.23', '-434.64', '0', '0', '0', '0', '1', '1'),
(21, '21', 'PATTERN', '10', '0', '2008.7012', '298.2308', '456.1312', '-428.5604', '760.5944', '-460.2776', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000808_drag`
--

CREATE TABLE IF NOT EXISTS `6000808_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000808_drag`
--

INSERT INTO `6000808_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'boa_stl', '2', '0', '-156.66', '-263.94', '-64.97', '-0.01', '0.28', '-0.24', '40', '0.2', '1'),
(2, '2', 'boa_stl', '2', '0', '1738.52', '-291', '-62.86', '-0.01', '0.28', '-0.24', '40', '0.2', '1'),
(3, '3', 'PIN1', '6', '77', '-164.24', '-132.71', '-49.48', '90', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '77', '55', '-136.27', '-48.38', '122.76', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '77', '241.71', '-139.25', '-47.51', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '77', '505.77', '-141.73', '-48.37', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '77', '665.89', '-145.1', '-46.47', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '77', '886.2', '-147.43', '-45.89', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '77', '1067.23', '-148.6', '-45.78', '42.43', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '77', '1327.71', '-155.6', '-44.76', '155.1', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '77', '1492.51', '-156.2', '-37.2', '0.62', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '77', '1709.24', '-157.6', '-41.88', '86.88', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '77', '-124.62', '-444.75', '-46.8', '0.18', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '77', '95.35', '-447.92', '-42.3', '0.18', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '77', '254.2', '-450.28', '-46.16', '0.18', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '77', '517.8', '-453.11', '-47.15', '0.18', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '77', '701.61', '-455.28', '-49.98', '0.18', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '77', '921.32', '-459.59', '-48.55', '0.18', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '77', '1080.34', '-459.2', '-44.96', '0.18', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '77', '1345.39', '-463.5', '-42.09', '0.18', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '77', '1526.79', '-466.5', '-35.78', '0.18', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '77', '1744.12', '-470.18', '-43.37', '135', '0', '0', '0', '1', '1'),
(23, '23', 'PATTERN', '10', '0', '1912.952', '757.5434', '182.3756', '-406.9708', '257.6332', '-186.4392', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000811_cope`
--

CREATE TABLE IF NOT EXISTS `6000811_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000811_cope`
--

INSERT INTO `6000811_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '628.16', '419.61', '-44.45', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '653.79', '419.57', '-47.68', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '98', '-33.6', '490.31', '-44.51', '-0.09', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '98', '141.18', '486.66', '-36.35', '-0.09', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '98', '343.3', '483.36', '-36.5', '-0.09', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '98', '518.76', '482.42', '-34.55', '-0.09', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '98', '722.38', '478.39', '-38.69', '-0.09', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '98', '896.72', '475.21', '-34.33', '-0.09', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '98', '1099.09', '472.23', '-35.44', '-0.09', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '98', '1274.57', '467.01', '-42.46', '-91.62', '0', '0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '98', '25.39', '175.91', '-43.89', '-0.1', '0', '0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '98', '200.25', '172.91', '-44.9', '-0.11', '0', '0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '98', '403.13', '170.16', '-40.26', '-0.11', '0', '0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '98', '578.16', '168.61', '-42.55', '-0.11', '0', '0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '98', '780.6', '163.44', '-41.54', '-0.11', '0', '0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '98', '956.21', '159.38', '-41.65', '3.48', '0', '0.01', '0', '1', '1'),
(17, '17', 'PIN1', '6', '98', '1158.99', '157.46', '-37.26', '3.48', '0', '0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '98', '1334.17', '153.22', '-40.51', '-111.82', '0', '0.01', '0', '1', '1'),
(19, '19', 'eic_stl', '2', '0', '1058.2', '312.21', '-78.66', '-0.05', '0.21', '-0.17', '290', '0.3', '1'),
(20, '20', 'eic_stl', '2', '0', '299.85', '324.36', '-81.54', '-0.05', '0.03', '0.01', '290', '0.3', '1'),
(21, '21', 'boa_stl', '2', '0', '-37.67', '359.75', '-63.92', '-0.01', '0', '0', '40', '0.3', '1'),
(22, '22', 'boa_stl', '2', '0', '1336.11', '335.2', '-61.07', '-0.01', '0', '0', '40', '0.3', '1'),
(23, '23', 'kmx_21_rnd_9x6-3x10 sleeve', '3', '0', '300.8', '298.53', '-215.29', '-0.11', '0.08', '-0.06', '230', '1', '1'),
(24, '24', 'kmx_21_rnd_9x6-3x10 sleeve', '3', '0', '1059.81', '281.99', '-216.55', '-0.11', '0.08', '-0.06', '230', '1', '1'),
(25, '25', 'LOC09', '1', '0', '298.59', '301.6', '-113.51', '-0.44', '0', '0', '0', '1', '1'),
(26, '26', 'LOC09', '1', '0', '1058.27', '290.84', '-115.84', '-0.44', '0', '0', '0', '1', '1'),
(27, '27', 'kmx_2000_tube_9x4 sleeve', '3', '0', '1058.31', '290.4', '-393.46', '5.42', '0.09', '-0.06', '230', '1', '1'),
(28, '28', 'kmx_2000_tube_9x4 sleeve', '3', '0', '298.82', '301.61', '-395.78', '5.41', '0.09', '-0.06', '230', '1', '1'),
(29, '29', 'SPRUE', '4', '0', '791.4', '6.87', '-402.55', '0.01', '-0.01', '0', '124', '1', '1'),
(30, '30', 'LID05', '8', '0', '298.49', '301.4', '-445.02', '0', '0.01', '-0.01', '0', '1', '1'),
(31, '31', 'LID05', '8', '0', '1058.38', '290.23', '-443.42', '0', '0.01', '-0.01', '0', '1', '1'),
(32, '32', 'PATTERN', '10', '0', '1561.4848', '201.7684', '438.2528', '-277.7628', '706.88', '-442.5096', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000811_drag`
--

CREATE TABLE IF NOT EXISTS `6000811_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000811_drag`
--

INSERT INTO `6000811_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'boa_stl', '2', '0', '-52.79', '-310.02', '-70.17', '-0.09', '0.08', '-0.05', '40', '0.3', '1'),
(2, '2', 'boa_stl', '2', '0', '1322.38', '-334.28', '-67.86', '-0.09', '0.08', '-0.05', '40', '0.3', '1'),
(3, '3', 'PATTERN', '10', '0', '1556.0148', '735.0788', '207.2052', '-283.4772', '188.2184', '-207.4436', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000815_cope`
--

CREATE TABLE IF NOT EXISTS `6000815_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000815_cope`
--

INSERT INTO `6000815_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '592.33', '-256.66', '-13.95', '-90.05', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '591.73', '-282.38', '-24.62', '-90.05', '0', '0', '0', '1', '1'),
(3, '3', 'NUMDEC', '5', '0', '597.18', '209.12', '-20.72', '90.21', '0', '0', '0', '1', '1'),
(4, '4', 'NUMUNID', '5', '0', '597.18', '183.13', '-22.39', '90.21', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '75', '54.21', '342.81', '-25.77', '20.55', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '75', '274.27', '340.53', '-22.88', '20.55', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '75', '362.28', '339.05', '-20.87', '20.55', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '75', '582', '335.61', '-23.97', '20.55', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '75', '668.66', '334.47', '-23.38', '20.55', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '75', '889.39', '331.8', '-32.18', '20.55', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '75', '977.09', '330.65', '-34.44', '20.55', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '75', '1196.65', '326.91', '-38.6', '6.2', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '75', '94.32', '108.97', '-38.87', '0.44', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '75', '315.08', '106.3', '-37.77', '0.44', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '75', '402.55', '105.4', '-39.09', '0.44', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '75', '621.25', '101.47', '-36.89', '0.44', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '75', '710.74', '100.55', '-38.19', '0.44', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '75', '930', '97.33', '-39.35', '0.44', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '75', '1017.89', '96.92', '-39.95', '0.44', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '75', '1237.87', '94.98', '-41.83', '0.44', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '75', '48.01', '-117.77', '-42.32', '12.82', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '75', '269.32', '-120.43', '-41.89', '12.82', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '75', '356.65', '-121.18', '-43.43', '12.82', '0', '0', '0', '1', '1'),
(24, '24', 'PIN1', '6', '75', '576.39', '-123.6', '-42.45', '12.82', '0', '0', '0', '1', '1'),
(25, '25', 'PIN1', '6', '75', '666.16', '-124.35', '-42.97', '12.82', '0', '0', '0', '1', '1'),
(26, '26', 'PIN1', '6', '75', '884.87', '-127.96', '-43.68', '12.82', '0', '0', '0', '1', '1'),
(27, '27', 'PIN1', '6', '75', '972.77', '-128.3', '-41.62', '12.82', '0', '0', '0', '1', '1'),
(28, '28', 'PIN1', '6', '75', '1195.22', '-133.13', '-25.12', '17.18', '0', '0', '0', '1', '1'),
(29, '29', 'PIN1', '6', '75', '92.57', '-348.09', '-28.54', '0.09', '0', '0', '0', '1', '1'),
(30, '30', 'PIN1', '6', '75', '311.9', '-351.25', '-27.9', '0.09', '0', '0', '0', '1', '1'),
(31, '31', 'PIN1', '6', '75', '400.24', '-352.95', '-24.21', '0.09', '0', '0', '0', '1', '1'),
(32, '32', 'PIN1', '6', '75', '619.58', '-355.76', '-25.91', '0.09', '0', '0', '0', '1', '1'),
(33, '33', 'PIN1', '6', '75', '707.57', '-357.34', '-23.99', '0.09', '0', '0', '0', '1', '1'),
(34, '34', 'PIN1', '6', '75', '927.07', '-360.68', '-27.49', '0.09', '0', '0', '0', '1', '1'),
(35, '35', 'PIN1', '6', '75', '1014.51', '-360.63', '-25.84', '0.09', '0', '0', '0', '1', '1'),
(36, '36', 'PIN1', '6', '75', '1234.51', '-364.47', '-28.52', '31.89', '0', '0', '0', '1', '1'),
(37, '37', 'epa_stl', '2', '0', '309.73', '-237.65', '-54.95', '-0.02', '0.03', '-0.02', '190', '0.3', '1'),
(38, '38', 'epa_stl', '2', '0', '971.37', '-246.77', '-51.83', '-0.02', '0.03', '-0.02', '190', '0.3', '1'),
(39, '39', 'epa_stl', '2', '0', '976.43', '212.8', '-49.94', '-0.02', '0.03', '-0.02', '190', '0.3', '1'),
(40, '40', 'epa_stl', '2', '0', '315.38', '221.03', '-52.3', '-0.02', '0.03', '-0.02', '190', '0.3', '1'),
(41, '41', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '314.12', '224.87', '-200', '-1.92', '0.14', '-0.1', '175', '1', '1'),
(42, '42', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '306.93', '-240.64', '-202.95', '-1.92', '0.14', '-0.1', '175', '1', '1'),
(43, '43', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '968.23', '-248.06', '-200.14', '-1.92', '0.14', '-0.1', '175', '1', '1'),
(44, '44', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '973.77', '211.23', '-198.23', '-1.92', '0.14', '-0.1', '175', '1', '1'),
(45, '45', 'LOC06', '1', '0', '311.34', '-240.02', '-88.79', '0.42', '0', '0', '0', '1', '1'),
(46, '46', 'LOC06', '1', '0', '313.12', '222.29', '-87.44', '0.42', '0', '0', '0', '1', '1'),
(47, '47', 'LOC06', '1', '0', '976.2', '211.98', '-87.93', '0.42', '0', '0', '0', '1', '1'),
(48, '48', 'LOC06', '1', '0', '972.26', '-249.34', '-83.38', '0.42', '0', '0', '0', '1', '1'),
(49, '49', 'LID03', '8', '0', '972.26', '-249.34', '-344.69', '21.49', '0.32', '-0.27', '0', '1', '1'),
(50, '50', 'LID03', '8', '0', '976.2', '211.98', '-344.52', '21.49', '0.32', '-0.27', '0', '1', '1'),
(51, '51', 'LID03', '8', '0', '313.12', '222.29', '-344.81', '21.5', '0.32', '-0.27', '0', '1', '1'),
(52, '52', 'LID03', '8', '0', '311.34', '-240.02', '-343.83', '21.5', '0.32', '-0.27', '0', '1', '1'),
(53, '53', 'PATTERN', '10', '0', '1531.5268', '491.214', '348.3896', '-134.556', '467.8168', '-348.3896', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000815_drag`
--

CREATE TABLE IF NOT EXISTS `6000815_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000815_drag`
--

INSERT INTO `6000815_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1628.936', '639.9544', '224.2724', '-253.8252', '437.3076', '-224.8756', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000817_cope`
--

CREATE TABLE IF NOT EXISTS `6000817_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000817_cope`
--

INSERT INTO `6000817_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '250.28', '280.31', '-41.35', '90.5', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '250.28', '307.67', '-41.35', '90.5', '0', '0', '0', '1', '1'),
(3, '101', 'epu_stl', '2', 'SI_Apilado', '918.38', '289.91', '-81.25', '90.29', '0', '0', '255', '0.3', '1'),
(4, '4', 'PIN1', '6', '99', '59.16', '461.3', '-64.48', '-0.09', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '99', '374.06', '455.05', '-62.25', '-0.09', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '99', '488.05', '451.07', '-60.41', '-0.09', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '99', '802.97', '448.02', '-60.11', '-0.09', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '99', '917.08', '447.68', '-61.54', '-0.09', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '99', '1232.81', '437.93', '-60.71', '-96.9', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '99', '1249.18', '135.86', '-59.74', '-117.8', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '99', '77.54', '158.91', '-61.75', '0.62', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '99', '392.09', '152.66', '-62.07', '0.62', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '99', '505.08', '150.19', '-60.22', '0.62', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '99', '821.15', '143.57', '-60.58', '0.62', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '99', '934.35', '142.23', '-59.41', '-26.81', '0', '0', '0', '1', '1'),
(16, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '914.69', '290.03', '-231.39', '-0.12', '0.04', '-0.03', '250', '1', '1'),
(17, '17', 'LOC07', '1', '0', '920.07', '290.63', '-110.94', '-1.8', '0', '0', '0', '1', '1'),
(18, '18', 'LID06', '8', '0', '1024.57', '339.22', '-378.02', '21.98', '0.32', '-0.27', '0', '1', '1'),
(19, '19', 'PATTERN', '10', '0', '1480.998', '232.51', '399.9928', '-188.558', '655.8', '-399.9196', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000817_drag`
--

CREATE TABLE IF NOT EXISTS `6000817_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000817_drag`
--

INSERT INTO `6000817_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1485.754', '239.3944', '222.9908', '-221.722', '710.7792', '-223.0064', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000822_cope`
--

CREATE TABLE IF NOT EXISTS `6000822_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000822_cope`
--

INSERT INTO `6000822_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '-201.32', '268.97', '-64.67', '88.22', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '-226.87', '269.71', '-63.4', '88.22', '0', '0', '0', '1', '1'),
(3, '101', 'eim_stl', '2', 'SI_Apilado', '103.29', '289.53', '-74.49', '86.28', '0.01', '-0.01', '220', '0.3', '1'),
(4, '101', 'eim_stl', '2', 'SI_Apilado', '777.08', '283.28', '-72.01', '86.28', '0.01', '-0.01', '220', '0.3', '1'),
(5, '102', 'kmx_21_rnd_9x4-5x12 sleeve', '3', 'NO_Apilado', '777.46', '280.12', '-220.78', '2.14', '0.02', '-0.02', '230', '1', '1'),
(6, '102', 'kmx_21_rnd_9x4-5x12 sleeve', '3', 'NO_Apilado', '104.15', '286.78', '-221.9', '2.14', '0.02', '-0.02', '230', '1', '1'),
(7, '7', 'LOC06', '1', '0', '772.56', '286.81', '-99.16', '0.09', '0', '0', '0', '1', '1'),
(8, '8', 'LOC06', '1', '0', '104.65', '294.39', '-99.36', '0.09', '0', '0', '0', '1', '1'),
(9, '103', 'kmx_2000_tube_9x4 sleeve', '3', 'NO_Apilado', '104.65', '294.39', '-422.73', '1.06', '0.02', '-0.01', '230', '1', '1'),
(10, '103', 'kmx_2000_tube_9x4 sleeve', '3', 'NO_Apilado', '772.57', '286.81', '-419.53', '1.06', '0.02', '-0.01', '230', '1', '1'),
(11, '11', 'LID05', '8', '0', '772.56', '286.81', '-475.65', '0', '0', '0', '0', '1', '1'),
(12, '12', 'LID05', '8', '0', '104.65', '294.39', '-477.57', '0', '0', '0', '0', '1', '1'),
(13, '13', 'PATTERN', '10', '0', '1371.2724', '168.5372', '493.9432', '-507.1364', '650.4184', '-500.1328', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000822_drag`
--

CREATE TABLE IF NOT EXISTS `6000822_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000822_drag`
--

INSERT INTO `6000822_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'dbq_stl', '2', '0', '165.93', '-250.16', '-55.55', '90.3', '0.17', '0.04', '80', '0.3', '1'),
(2, '2', 'dbq_stl', '2', '0', '403.49', '-250.16', '-57.71', '-89.4', '0.17', '0.04', '80', '0.3', '1'),
(3, '3', 'dbq_stl', '2', '0', '1258.61', '-258.08', '-58.47', '-90.53', '0.17', '0.04', '80', '0.3', '1'),
(4, '4', 'dbq_stl', '2', '0', '1021.17', '-258.38', '-56.99', '90.68', '0.15', '0.04', '80', '0.3', '1'),
(5, '5', 'PIN1', '6', '64', '-76.77', '-115.75', '-29.14', '0.01', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '64', '217.68', '-119.72', '-32.4', '0.01', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '64', '367.69', '-119.87', '-32', '0.01', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '64', '617.89', '-122.34', '-34.55', '0.01', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '64', '788.44', '-123.84', '-33.71', '0.01', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '64', '1037.94', '-126.56', '-32.38', '0.01', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '64', '1232.62', '-128', '-30.58', '0.01', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '64', '1505.5', '-133.93', '-25.76', '-76.24', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '64', '-81', '-376.75', '-30.06', '0.36', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '64', '192.54', '-378.38', '-32.07', '0.36', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '64', '386.11', '-379.23', '-31', '0.36', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '64', '637.18', '-383.19', '-33.57', '0.36', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '64', '808.08', '-383.53', '-33.21', '0.36', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '64', '1058.74', '-386.51', '-32.35', '0.01', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '64', '1207.76', '-387.32', '-31.52', '0.01', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '64', '1497.79', '-391.58', '-58.32', '124.29', '0', '0', '0', '1', '1'),
(21, '21', 'PATTERN', '10', '0', '1651.0324', '596.436', '204.0428', '-216.2872', '156.9316', '-209.132', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000969d2_cope`
--

CREATE TABLE IF NOT EXISTS `6000969d2_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000969d2_cope`
--

INSERT INTO `6000969d2_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '171.12', '164.39', '9.55', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '388.84', '162.31', '12.16', '0.14', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '451.84', '162.31', '13.47', '0.14', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '555.21', '161.19', '16.29', '0.14', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '736.85', '159.16', '18.48', '0.14', '0', '0.01', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '840.38', '159.16', '16.57', '0.14', '0', '0.01', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '903.13', '158.38', '15.81', '0.14', '0', '0.01', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '1119.97', '155.85', '10.9', '0.14', '0', '0.01', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '227.86', '-62.03', '28.52', '-3.55', '0', '0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '398.22', '-64.69', '27.68', '-3.55', '0', '0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '566.21', '-67.03', '26.73', '-3.55', '0', '0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '736.72', '-67.03', '27.83', '-3.55', '0', '0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '903.97', '-67.78', '21.8', '-3.55', '0', '0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '1073.37', '-69.16', '25.32', '-26.44', '0', '0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '168.2', '-221.6', '9.39', '-1.1', '0', '0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '385.13', '-223.52', '13.66', '-1.1', '0', '0.01', '0', '1', '1'),
(17, '17', 'PIN1', '6', '69', '449.89', '-223.52', '20.26', '-1.1', '0', '0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '69', '553.44', '-224.13', '22.89', '-1.1', '0', '0.01', '0', '1', '1'),
(19, '19', 'PIN1', '6', '69', '734.97', '-224.96', '14.55', '9.72', '0', '0.01', '0', '1', '1'),
(20, '20', 'PIN1', '6', '69', '837.8', '-224.96', '10.13', '9.72', '0', '0.01', '0', '1', '1'),
(21, '21', 'PIN1', '6', '69', '900.6', '-225.87', '20.52', '9.72', '0', '0.01', '0', '1', '1'),
(22, '22', 'PIN1', '6', '69', '1117.71', '-227.73', '15.7', '9.72', '0', '0.01', '0', '1', '1'),
(23, '23', 'PIN1', '6', '69', '225.09', '-449.73', '20.46', '-4.33', '0', '0.01', '0', '1', '1'),
(24, '24', 'PIN1', '6', '69', '395.9', '-450.52', '27.79', '-4.33', '0', '0.01', '0', '1', '1'),
(25, '25', 'PIN1', '6', '69', '563.68', '-450.98', '29.25', '-4.33', '0', '0.01', '0', '1', '1'),
(26, '26', 'PIN1', '6', '69', '734.93', '-452.16', '31.58', '-4.33', '0', '0.01', '0', '1', '1'),
(27, '27', 'PIN1', '6', '69', '901.75', '-452.88', '28.77', '-4.33', '0', '0.01', '0', '1', '1'),
(28, '28', 'PIN1', '6', '69', '1073.28', '-454.62', '24.94', '113.15', '0', '0', '0', '1', '1'),
(29, '101', 'epk', '2', 'SI_Apilado', '646.69', '83.49', '-17.39', '90.04', '0.2', '-0.13', '180', '0.3', '1'),
(30, '101', 'epk', '2', 'SI_Apilado', '646.69', '-296.79', '-18.07', '90.04', '0.2', '-0.13', '180', '0.3', '1'),
(31, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '644.55', '-284.46', '-152.2', '1.94', '0.27', '-0.2', '177', '1', '1'),
(32, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '645.17', '96.36', '-150.81', '1.94', '0.26', '-0.2', '177', '1', '1'),
(33, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '643.06', '-275.4', '-364.66', '19.41', '0.3', '-0.24', '177', '1', '1'),
(34, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '645.48', '100.71', '-361.37', '19.41', '0.3', '-0.24', '177', '1', '1'),
(35, '35', 'PATTERN', '10', '0', '645.4844', '100.708', '361.3704', '645.4844', '100.708', '-361.3704', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000969d_cope`
--

CREATE TABLE IF NOT EXISTS `6000969d_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000969d_cope`
--

INSERT INTO `6000969d_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '171.12', '164.39', '9.55', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '388.84', '162.31', '12.16', '0.14', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '451.84', '162.31', '13.47', '0.14', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '555.21', '161.19', '16.29', '0.14', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '736.85', '159.16', '18.48', '0.14', '0', '0.01', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '840.38', '159.16', '16.57', '0.14', '0', '0.01', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '903.13', '158.38', '15.81', '0.14', '0', '0.01', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '1119.97', '155.85', '10.9', '0.14', '0', '0.01', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '227.86', '-62.03', '28.52', '-3.55', '0', '0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '398.22', '-64.69', '27.68', '-3.55', '0', '0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '566.21', '-67.03', '26.73', '-3.55', '0', '0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '736.72', '-67.03', '27.83', '-3.55', '0', '0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '903.97', '-67.78', '21.8', '-3.55', '0', '0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '1073.37', '-69.16', '25.32', '-26.44', '0', '0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '168.2', '-221.6', '9.39', '-1.1', '0', '0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '385.13', '-223.52', '13.66', '-1.1', '0', '0.01', '0', '1', '1'),
(17, '17', 'PIN1', '6', '69', '449.89', '-223.52', '20.26', '-1.1', '0', '0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '69', '553.44', '-224.13', '22.89', '-1.1', '0', '0.01', '0', '1', '1'),
(19, '19', 'PIN1', '6', '69', '734.97', '-224.96', '14.55', '9.72', '0', '0.01', '0', '1', '1'),
(20, '20', 'PIN1', '6', '69', '837.8', '-224.96', '10.13', '9.72', '0', '0.01', '0', '1', '1'),
(21, '21', 'PIN1', '6', '69', '900.6', '-225.87', '20.52', '9.72', '0', '0.01', '0', '1', '1'),
(22, '22', 'PIN1', '6', '69', '1117.71', '-227.73', '15.7', '9.72', '0', '0.01', '0', '1', '1'),
(23, '23', 'PIN1', '6', '69', '225.09', '-449.73', '20.46', '-4.33', '0', '0.01', '0', '1', '1'),
(24, '24', 'PIN1', '6', '69', '395.9', '-450.52', '27.79', '-4.33', '0', '0.01', '0', '1', '1'),
(25, '25', 'PIN1', '6', '69', '563.68', '-450.98', '29.25', '-4.33', '0', '0.01', '0', '1', '1'),
(26, '26', 'PIN1', '6', '69', '734.93', '-452.16', '31.58', '-4.33', '0', '0.01', '0', '1', '1'),
(27, '27', 'PIN1', '6', '69', '901.75', '-452.88', '28.77', '-4.33', '0', '0.01', '0', '1', '1'),
(28, '28', 'PIN1', '6', '69', '1071.16', '-446.04', '21.06', '113.15', '0', '0', '0', '1', '1'),
(29, '101', 'epk', '2', 'SI_Apilado', '646.69', '83.49', '-17.39', '90.04', '0.2', '-0.13', '180', '0.3', '1'),
(30, '101', 'epk', '2', 'SI_Apilado', '646.69', '-296.79', '-18.07', '90.04', '0.2', '-0.13', '180', '0.3', '1'),
(31, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '644.55', '-284.46', '-152.2', '1.94', '0.27', '-0.2', '177', '1', '1'),
(32, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '645.17', '96.36', '-150.81', '1.94', '0.26', '-0.2', '177', '1', '1'),
(33, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '643.06', '-275.4', '-364.66', '19.41', '0.3', '-0.24', '178', '1', '1'),
(34, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '645.48', '100.71', '-361.37', '19.41', '0.3', '-0.24', '178', '1', '1'),
(35, '35', 'PATTERN', '10', '0', '645.4844', '100.708', '361.3704', '645.4844', '100.708', '-361.3704', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000969e_cope`
--

CREATE TABLE IF NOT EXISTS `6000969e_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000969e_cope`
--

INSERT INTO `6000969e_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '170.92', '164.79', '16.84', '0.03', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '389.42', '163.15', '2.93', '0.03', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '451.69', '162.57', '30.42', '0.03', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '557.08', '161.84', '27.64', '0.03', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '737.8', '160.2', '29.41', '0.03', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '841.36', '159.27', '27.22', '0.03', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '905.15', '158.92', '41.21', '0.03', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '1121.4', '156.22', '48.14', '0.03', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '228.24', '-62.17', '36.31', '-5.96', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '397.99', '-64.05', '43.8', '-5.96', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '567.48', '-65.24', '52.02', '-5.96', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '737.01', '-66', '37.62', '-5.96', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '906.37', '-66.75', '49.02', '-5.96', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '1073.24', '-68.7', '45.65', '-34.86', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '169.03', '-221.57', '24.32', '7.72', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '386.07', '-223.26', '20.81', '7.72', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '69', '449.9', '-223.26', '29.02', '7.72', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '69', '555.91', '-223.26', '45.65', '7.72', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '69', '737.09', '-225.83', '36.68', '7.72', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '69', '838.83', '-225.83', '40.35', '7.72', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '69', '902', '-226.5', '39.52', '7.72', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '69', '1117.66', '-228.38', '34.11', '7.72', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '69', '225.5', '-449.02', '46.55', '-1.92', '0', '0', '0', '1', '1'),
(24, '24', 'PIN1', '6', '69', '396.09', '-449.8', '39.84', '-1.92', '0', '0', '0', '1', '1'),
(25, '25', 'PIN1', '6', '69', '563.69', '-450.65', '39.94', '-4.97', '0', '0', '0', '1', '1'),
(26, '26', 'PIN1', '6', '69', '735.34', '-451.71', '53.9', '-4.97', '0', '0', '0', '1', '1'),
(27, '27', 'PIN1', '6', '69', '902.89', '-452.43', '42.86', '15.62', '0', '0', '0', '1', '1'),
(28, '28', 'PIN1', '6', '69', '1071.72', '-453.45', '45.16', '30.16', '0', '0', '0', '1', '1'),
(29, '101', 'epk', '2', 'SI_Apilado', '647.81', '-297.53', '-13.01', '89.26', '0.14', '-0.08', '180', '0.1', '1'),
(30, '101', 'epk', '2', 'SI_Apilado', '649.46', '83.36', '-9.16', '89.26', '0.14', '-0.08', '180', '0.1', '1'),
(31, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '646.6', '-292.28', '-154.51', '22.97', '0.27', '-0.21', '177', '1', '1'),
(32, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '649.35', '90.69', '-154.93', '22.97', '0.27', '-0.21', '177', '1', '1'),
(33, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '648.59', '-280.25', '-376.74', '17.18', '-0.1', '-0.16', '177', '1', '1'),
(34, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '648.59', '91.91', '-376.22', '17.18', '-0.1', '-0.16', '177', '1', '1'),
(35, '35', 'PATTERN', '10', '0', '648.5916', '91.9088000000002', '376.2232', '648.5916', '91.9088000000002', '-376.2232', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000969_cope`
--

CREATE TABLE IF NOT EXISTS `6000969_cope` (
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
-- Volcado de datos para la tabla `6000969_cope`
--

INSERT INTO `6000969_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1041.09', '-405.9', '6.17', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1013.76', '-405.9', '12.39', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '172.94', '163.03', '5.59', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '390.77', '163.03', '11.38', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '453.74', '161.71', '13.77', '5.13', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '557.26', '160.81', '12.74', '5.13', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '739.9', '159.89', '16.66', '5.13', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '842.44', '159.01', '11.2', '5.13', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '905.57', '159.01', '13.73', '5.13', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '1123.31', '155.77', '15.13', '5.13', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '69', '229.95', '-62.58', '18.59', '-3.24', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '69', '400.9', '-65.46', '28.15', '-10.06', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '69', '567.9', '-66.29', '27.8', '-10.06', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '69', '740.23', '-66.29', '27.99', '-10.06', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '69', '905.54', '-68.97', '27.42', '-10.07', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '69', '1074.09', '-69.56', '23.21', '-26.89', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '69', '171.49', '-223.1', '7.41', '11.93', '0', '-0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '69', '388.51', '-223.81', '20.03', '11.93', '0', '-0.01', '0', '1', '1'),
(19, '19', 'PIN1', '6', '69', '452.14', '-224.15', '12.85', '11.93', '0', '-0.01', '0', '1', '1'),
(20, '20', 'PIN1', '6', '69', '554.11', '-224.9', '12.38', '9.6', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '69', '736.77', '-226.4', '11.03', '9.6', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '69', '840.79', '-226.4', '13.59', '9.6', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '69', '904.74', '-226.13', '11.07', '18.17', '0', '-0.01', '0', '1', '1'),
(24, '24', 'PIN1', '6', '69', '1119.11', '-227.73', '7.66', '18.17', '0', '-0.01', '0', '1', '1'),
(25, '25', 'PIN1', '6', '69', '227.37', '-449.91', '19.02', '-2.9', '0', '0', '0', '1', '1'),
(26, '26', 'PIN1', '6', '69', '399.08', '-451.13', '20.67', '-8.57', '0', '-0.01', '0', '1', '1'),
(27, '27', 'PIN1', '6', '69', '567.76', '-451.59', '24.71', '-8.57', '0', '-0.01', '0', '1', '1'),
(28, '28', 'PIN1', '6', '69', '738.59', '-453.1', '24.59', '-8.57', '0', '-0.01', '0', '1', '1'),
(29, '29', 'PIN1', '6', '69', '906.41', '-453.1', '28.08', '18.7', '0', '-0.01', '0', '1', '1'),
(30, '30', 'PIN1', '6', '69', '1076.97', '-453.36', '22.96', '26.13', '0', '-0.01', '0', '1', '1'),
(31, '101', 'epk', '2', 'SI_Apilado', '645.74', '-297.82', '-16.73', '90.97', '-0.04', '0.03', '180', '0.3', '1'),
(32, '101', 'epk', '2', 'SI_Apilado', '646.68', '83.31', '-16.24', '90.97', '-0.04', '0.03', '180', '0.3', '1'),
(33, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '648.26', '88.63', '-154.29', '-3.72', '0.2', '-0.13', '178', '1', '1'),
(34, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '648.29', '-289.52', '-154.5', '-3.77', '0.2', '-0.14', '178', '1', '1'),
(35, '35', 'LOC07', '1', '0', '647.3', '-287.15', '-53.43', '-1.53', '0', '0', '0', '1', '1'),
(36, '36', 'LOC07', '1', '0', '649.26', '95.43', '-52.23', '-1.53', '0', '0', '0', '1', '1'),
(37, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '647.45', '-281.44', '-358.83', '9.65', '0.17', '-0.13', '178', '1', '1'),
(38, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '651.32', '95.53', '-358.51', '9.65', '0.17', '-0.13', '178', '1', '1'),
(39, '39', 'SPRUE', '4', '0', '1346.69', '-512.23', '-385.23', '2.34', '0', '0', '124', '1', '1'),
(40, '40', 'LID07', '8', '0', '660.09', '91.79', '-446.44', '0', '0', '0', '0', '1', '1'),
(41, '41', 'LID07', '8', '0', '646', '-289.29', '-447.94', '0', '0', '0', '0', '1', '1'),
(42, '42', 'PATTERN', '10', '0', '1650.8324', '698.4914', '432.5532', '-64.2084', '409.7868', '-428.8', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000974_cope`
--

CREATE TABLE IF NOT EXISTS `6000974_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000974_cope`
--

INSERT INTO `6000974_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '312.56', '157.83', '-49.67', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '285.9', '158.11', '-46.87', '0', '0', '-0.01', '0', '1', '1'),
(3, '3', 'eop_a_stl', '2', '0', '499.19', '219.65', '-82.87', '-0.68', '0.11', '-0.08', '214', '0.3', '1'),
(4, '4', 'eop_a_stl', '2', '0', '986.9', '212.63', '-77.27', '-0.68', '0.11', '-0.08', '214', '0.3', '1'),
(5, '5', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '987.37', '183.55', '-242.82', '-0.57', '0.27', '-0.21', '250', '1', '1'),
(6, '6', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '497.85', '190.84', '-239.15', '-0.57', '0.27', '-0.21', '250', '1', '1'),
(7, '7', 'LOC07', '1', '0', '500.67', '190.98', '-125.47', '-1.31', '0', '0', '0', '1', '1'),
(8, '8', 'LOC07', '1', '0', '989.19', '184.18', '-120.6', '-1.31', '0', '0', '0', '1', '1'),
(9, '9', 'SPRUE', '4', '0', '743.87', '-64.08', '-386.56', '-0.9', '-0.01', '-0.12', '124', '1', '1'),
(10, '10', 'LID07', '8', '0', '500.67', '190.98', '-393.68', '7.2', '0.32', '-0.27', '0', '1', '1'),
(11, '11', 'LID07', '8', '0', '989.19', '184.18', '-393.68', '7.2', '0.32', '-0.27', '0', '1', '1'),
(12, '12', 'PATTERN', '10', '0', '1659.078', '283.4144', '416.4232', '534.174', '175.0596', '-420.9472', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000974_drag`
--

CREATE TABLE IF NOT EXISTS `6000974_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000974_drag`
--

INSERT INTO `6000974_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '78', '417.75', '-142.25', '-54.52', '-148', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '78', '695.01', '-143.86', '-48.95', '-89.96', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '78', '761.54', '-144.39', '-48.89', '-89.96', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '78', '1035.71', '-144.01', '-47.31', '0.83', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '78', '1102.21', '-144.65', '-45.52', '0.83', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '78', '1374.14', '-147.68', '-43.16', '65.5', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '78', '352.89', '-140.63', '-47.17', '-117.44', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '78', '78.68', '-136.53', '-48.51', '-87.99', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '78', '78.68', '-441.88', '-48.06', '0.66', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '78', '354.3', '-446.61', '-47.66', '0.66', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '78', '420.31', '-446.32', '-48.11', '0.66', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '78', '695.41', '-450.81', '-48.22', '0.66', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '78', '762.17', '-451.01', '-48.82', '0.66', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '78', '1036.75', '-455.01', '-49.07', '0.66', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '78', '1102.94', '-455.51', '-48.52', '0.66', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '78', '1373.71', '-458.99', '-47.98', '119.74', '0', '0', '0', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '1617.39', '652.8784', '207.0256', '-177.2736', '220.9364', '-204.2316', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000978_cope`
--

CREATE TABLE IF NOT EXISTS `6000978_cope` (
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
-- Volcado de datos para la tabla `6000978_cope`
--

INSERT INTO `6000978_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '250.12', '255.61', '-46.76', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '251.88', '281.5', '-45.11', '0', '0', '0', '0', '1', '1'),
(3, '3', 'CLR', '2', '0', '381.02', '258.07', '-76.84', '28.22', '0.02', '-0.01', '190', '0.3', '1'),
(4, '4', 'CLR', '2', '0', '899.52', '247.08', '-74.36', '29.04', '0.02', '-0.01', '190', '0.3', '1'),
(5, '5', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '382.06', '265.15', '-202.27', '2.46', '0.03', '-0.01', '202', '1', '1'),
(6, '6', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '896.16', '256.76', '-200.75', '2.46', '0.03', '-0.01', '202', '1', '1'),
(7, '7', 'LOC08', '1', '0', '896.11', '256.53', '-106.57', '-2.25', '0', '0', '0', '1', '1'),
(8, '8', 'LOC08', '1', '0', '382.06', '265.43', '-105.15', '-2.25', '0', '0', '0', '1', '1'),
(9, '9', 'kmx_21_tube_8x4 sleeve', '3', '0', '896.62', '256.11', '-383.61', '1.36', '0.03', '-0.02', '202', '1', '1'),
(10, '10', 'kmx_21_tube_8x4 sleeve', '3', '0', '382.43', '265.38', '-382.36', '1.36', '0.03', '-0.03', '202', '1', '1'),
(11, '11', 'SPRUE', '4', '0', '803.29', '-0.2', '-421.08', '-2.3', '-0.01', '0', '124', '1', '1'),
(12, '12', 'LID05', '8', '0', '382.91', '265.79', '-426.77', '0', '0', '0', '0', '1', '1'),
(13, '13', 'LID05', '8', '0', '896.07', '256.26', '-427.2', '0', '0', '0', '0', '1', '1'),
(14, '14', 'PATTERN', '10', '0', '1450.4544', '224.07', '446.3468', '-174.0124', '606.0024', '-452.4804', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6000978_drag`
--

CREATE TABLE IF NOT EXISTS `6000978_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000978_drag`
--

INSERT INTO `6000978_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '57', '1197.26', '-194.94', '-22.55', '-57.03', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '57', '717.71', '-184.58', '-26.59', '-57.03', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '57', '252.67', '-173.33', '-28.22', '-57.03', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '57', '92.87', '-383.43', '-27.76', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '57', '258.21', '-387', '-27.48', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '57', '407.87', '-391.3', '-25.31', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '57', '573.16', '-394.83', '-25.34', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '57', '723.2', '-397.66', '-24.66', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '57', '888.11', '-401.15', '-26.52', '0', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '57', '1038.33', '-405.7', '-25.69', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '57', '1200.88', '-408.5', '-25.17', '68.73', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '57', '1028.77', '-190.21', '-23.35', '147.03', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '57', '878.9', '-187.59', '-25.77', '147.03', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '57', '563.61', '-179.06', '-25.04', '133.07', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '57', '398.66', '-176.14', '-25.71', '133.07', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '57', '86.53', '-172.15', '-60.8', '-110.12', '-0.01', '0', '0', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '1116.2812', '606.0712', '169.6856', '-496.044', '187.1372', '-174.2128', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001040test_drag`
--

CREATE TABLE IF NOT EXISTS `6001040test_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001040test_drag`
--

INSERT INTO `6001040test_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'hvc (1)', '2', '0', '162.44', '-182.12', '-30.88', '-1.16', '0.02', '-0.01', '123', '0.3', '1'),
(2, '2', 'hvc (1)', '2', '0', '703.4', '-187.15', '-34.15', '-1.16', '0.02', '-0.01', '123', '0.3', '1'),
(3, '3', 'hvc (1)', '2', '0', '709.3', '173.17', '-28.67', '-1.16', '0.02', '-0.01', '123', '0.3', '1'),
(4, '4', 'hvc (1)', '2', '0', '168.23', '181.27', '-24.48', '-1.16', '0.02', '-0.01', '123', '0.3', '1'),
(5, '5', 'PATTERN', '10', '0', '191.1012', '412.734', '239.6428', '981.2372', '-463.6732', '-259.1864', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001057_cope`
--

CREATE TABLE IF NOT EXISTS `6001057_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001057_cope`
--

INSERT INTO `6001057_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'epa_stl', '2', '0', '435.63', '-77.38', '-44.26', '88.64', '0.02', '-0.01', '190', '0.3', '1'),
(2, '2', 'epa_stl', '2', '0', '435.44', '-505.31', '-45.56', '88.64', '0.02', '-0.01', '190', '0.3', '1'),
(3, '3', 'epa_stl', '2', '0', '1085.53', '-507.12', '-38.77', '88.64', '0.02', '-0.01', '190', '0.3', '1'),
(4, '4', 'epa_stl', '2', '0', '1088.11', '-80.44', '-38.54', '88.64', '0.02', '-0.01', '190', '0.3', '1'),
(5, '5', 'NUMUNID', '5', '0', '818.45', '-558.68', '-13.82', '0.11', '0', '0', '0', '1', '1'),
(6, '6', 'NUMDEC', '5', '0', '819.8', '-584.73', '-14.23', '0.11', '0', '0', '0', '1', '1'),
(7, '7', 'NUMUNID', '5', '0', '705.05', '-2.02', '-10.99', '0', '0', '0', '0', '1', '1'),
(8, '8', 'NUMDEC', '5', '0', '704.5', '-27.99', '-13.08', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '65', '212.33', '44.99', '-13.86', '0', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '65', '441.12', '42.36', '-50.23', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '65', '617.17', '40.86', '-9.48', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '65', '845.13', '38.67', '-9.92', '0', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '65', '975.91', '37.62', '-35.09', '0', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '65', '1079.33', '37.12', '-50.02', '0', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '65', '1202.27', '35.78', '-8.94', '0', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '65', '1306.23', '34.87', '-9.36', '17.39', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '65', '220.88', '-189.11', '-38.98', '0.07', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '65', '325.52', '-190.9', '-50.75', '0.07', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '65', '447.48', '-190.76', '-50.03', '0.07', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '65', '551.01', '-192.59', '-9.24', '0.07', '0', '0', '0', '1', '1'),
(21, '21', 'PIN1', '6', '65', '682.29', '-193.16', '-9.83', '0.07', '0', '0', '0', '1', '1'),
(22, '22', 'PIN1', '6', '65', '909.7', '-195.53', '-40.76', '0.07', '0', '0', '0', '1', '1'),
(23, '23', 'PIN1', '6', '65', '1086.02', '-196.9', '-48.35', '-4.51', '0', '0', '0', '1', '1'),
(24, '24', 'PIN1', '6', '65', '1314.85', '-199.46', '-11.41', '-40.73', '0', '0', '0', '1', '1'),
(25, '25', 'PIN1', '6', '65', '210.05', '-382.15', '-14.77', '-0.07', '0', '0', '0', '1', '1'),
(26, '26', 'PIN1', '6', '65', '439.58', '-384.06', '-50.32', '-0.07', '0', '0', '0', '1', '1'),
(27, '27', 'PIN1', '6', '65', '616.4', '-386.51', '-10.51', '-0.07', '0', '0', '0', '1', '1'),
(28, '28', 'PIN1', '6', '65', '843.7', '-387.67', '-10.83', '-0.07', '0', '0', '0', '1', '1'),
(29, '29', 'PIN1', '6', '65', '974.44', '-389.57', '-46.29', '-0.07', '0', '0', '0', '1', '1'),
(30, '30', 'PIN1', '6', '65', '1076.87', '-389.66', '-48.81', '-0.07', '0', '0', '0', '1', '1'),
(31, '31', 'PIN1', '6', '65', '1200.03', '-390.91', '-11.19', '3.91', '0', '0', '0', '1', '1'),
(32, '32', 'PIN1', '6', '65', '1304.33', '-389.61', '-12.86', '20.54', '0', '0', '0', '1', '1'),
(33, '33', 'PIN1', '6', '65', '219.63', '-616.96', '-42.36', '-0.15', '0', '0', '0', '1', '1'),
(34, '34', 'PIN1', '6', '65', '323.8', '-617.23', '-53.35', '-0.15', '0', '0', '0', '1', '1'),
(35, '35', 'PIN1', '6', '65', '446.13', '-619.25', '-52.89', '-0.15', '0', '0', '0', '1', '1'),
(36, '36', 'PIN1', '6', '65', '549.23', '-620.27', '-13.96', '-0.15', '0', '0', '0', '1', '1'),
(37, '37', 'PIN1', '6', '65', '679.96', '-620.35', '-12.79', '-0.15', '0', '0', '0', '1', '1'),
(38, '38', 'PIN1', '6', '65', '907.72', '-621.33', '-47.02', '-0.15', '0', '0', '0', '1', '1'),
(39, '39', 'PIN1', '6', '65', '1088.45', '-623.87', '-48.87', '-4.26', '0', '0', '0', '1', '1'),
(40, '40', 'PIN1', '6', '65', '1312.76', '-624.95', '-13.4', '36.05', '0', '0', '0', '1', '1'),
(41, '41', 'kmx_2000_rnd_8x4x12 sleeve', '3', '0', '431.24', '-76.11', '-198.41', '1.36', '0.07', '-0.03', '203', '1', '1'),
(42, '42', 'kmx_2000_rnd_8x4x12 sleeve', '3', '0', '431.58', '-502.64', '-200.27', '1.36', '0.07', '-0.03', '203', '1', '1'),
(43, '43', 'kmx_2000_rnd_8x4x12 sleeve', '3', '0', '1081.67', '-504.44', '-198.89', '1.36', '0.07', '-0.03', '203', '1', '1'),
(44, '44', 'kmx_2000_rnd_8x4x12 sleeve', '3', '0', '1084.86', '-80.09', '-197.4', '1.36', '0.07', '-0.03', '203', '1', '1'),
(45, '45', 'LOC05', '1', '0', '435.64', '-76.3', '-70.35', '0.2', '0', '0', '0', '1', '1'),
(46, '46', 'LOC05', '1', '0', '435.28', '-502.48', '-72.34', '0.2', '0', '0', '0', '1', '1'),
(47, '47', 'LOC05', '1', '0', '1084.77', '-506.24', '-69.51', '0.2', '0', '0', '0', '1', '1'),
(48, '48', 'LOC05', '1', '0', '1087.72', '-80.42', '-68.79', '0.2', '0', '0', '0', '1', '1'),
(49, '49', 'LID05', '8', '0', '435.64', '-76.3', '-358.32', '0', '0', '0', '0', '1', '1'),
(50, '50', 'LID05', '8', '0', '435.28', '-502.48', '-359.79', '0', '0', '0', '0', '1', '1'),
(51, '51', 'LID05', '8', '0', '1084.77', '-506.24', '-357.35', '0', '0', '0', '0', '1', '1'),
(52, '52', 'LID05', '8', '0', '1087.72', '-80.42', '-355.9', '0', '0', '0', '0', '1', '1'),
(53, '53', 'PATTERN', '10', '0', '1749.462', '825.418', '362.0616', '-129.0268', '230.9364', '-366.4076', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001057_drag`
--

CREATE TABLE IF NOT EXISTS `6001057_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001057_drag`
--

INSERT INTO `6001057_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1737.0556', '200.2128', '223.3268', '-85.5311999999999', '857.0148', '-224.5832', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001080_cope`
--

CREATE TABLE IF NOT EXISTS `6001080_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001080_cope`
--

INSERT INTO `6001080_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '409.08', '65.87', '-39.5', '-3.17', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '435.05', '65.87', '-40.37', '-3.17', '0', '0', '0', '1', '1'),
(3, '101', 'CLR', '2', 'SI_Apilado', '595.66', '147.08', '-64.9', '-3.49', '0.04', '-0.02', '190', '0.3', '1'),
(4, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '597.52', '148.78', '-192.13', '0.13', '0.05', '-0.03', '202', '1', '1'),
(5, '5', 'LOC08', '1', '0', '597.53', '147.13', '-93.76', '0', '0', '0', '0', '1', '1'),
(6, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '597.56', '147.77', '-395.32', '3.42', '0.07', '-0.04', '202', '1', '1'),
(7, '7', 'SPRUE', '4', '0', '582.98', '-115.82', '-464.92', '-3.23', '-0.01', '0', '124', '1', '1'),
(8, '8', 'LID05', '8', '0', '597.53', '147.13', '-468.12', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PATTERN', '10', '0', '1378.2772', '341.7372', '494.5644', '-56.8316', '500.672', '-492.0556', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001080_drag`
--

CREATE TABLE IF NOT EXISTS `6001080_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001080_drag`
--

INSERT INTO `6001080_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '72', '818.69', '-112.28', '-40.59', '-42.71', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '72', '91.15', '-348.42', '-41.13', '0.24', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '72', '267.69', '-349.08', '-42.09', '0.24', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '72', '440.55', '-349.97', '-41.12', '0.24', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '72', '616.62', '-351.09', '-41.18', '0.24', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '72', '790.08', '-352.71', '-40.15', '0.24', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '72', '294.5', '-106.4', '-40.64', '0.37', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '72', '988.07', '-113.14', '-38.15', '134.74', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '72', '638.94', '-110.98', '-41.47', '135.13', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '72', '462.63', '-110.11', '-41.19', '135.13', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '72', '114.66', '-106.04', '-40.93', '126.64', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '72', '964.03', '-354.33', '-83.44', '59.79', '0', '0', '0', '1', '1'),
(13, '13', 'PATTERN', '10', '0', '1233.5936', '560.4012', '180.7516', '-163.9504', '240.784', '-180.7516', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001096_cope`
--

CREATE TABLE IF NOT EXISTS `6001096_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001096_cope`
--

INSERT INTO `6001096_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '77', '-39.87', '373.21', '-6.08', '14.78', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '77', '176.95', '371.17', '-0.37', '14.78', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '77', '300.06', '369.4', '0.21', '24.17', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '77', '527.94', '368.43', '2.32', '24.17', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '77', '573.68', '367.05', '3.59', '24.17', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '77', '800.39', '365.99', '1.67', '24.18', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '77', '863.11', '365.19', '1.72', '24.18', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '77', '1086.56', '363.14', '-4', '-112.64', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '77', '20.21', '130.47', '-5.86', '-27.36', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '77', '237.21', '129.06', '-0.6', '-27.36', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '77', '300.65', '130.58', '0', '-27.36', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '77', '527.96', '125.58', '0.99', '-27.36', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '77', '571.8', '127.02', '0.21', '-27.36', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '77', '801.09', '125.87', '0.52', '-27.36', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '77', '923.15', '123.41', '-1.11', '-3.97', '-0.05', '-0.06', '0', '1', '1'),
(16, '16', 'PIN1', '6', '77', '1145.41', '120.04', '-1.04', '-121.83', '-0.05', '-0.06', '0', '1', '1'),
(17, '17', 'NUMDEC', '5', '0', '1065.67', '189.6', '-5.38', '-1.61', '0', '0.01', '0', '1', '1'),
(18, '18', 'NUMUNID', '5', '0', '1039.41', '188.82', '-6.1', '-1.61', '0', '0.01', '0', '1', '1'),
(19, '101', 'epf', '2', 'SI_Apilado', '550.87', '243.8', '-22.4', '0.93', '0.08', '-0.03', '189', '0.03', '1'),
(20, '102', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '552.38', '238.2', '-158.05', '6.15', '0.08', '-0.06', '228', '1', '1'),
(21, '21', 'LOC06', '1', '0', '550.42', '243.04', '-61.71', '0', '0', '0', '0', '1', '1'),
(22, '103', 'kmx_2000_tube_9x6 sleeve', '3', 'NO_Apilado', '549.69', '237.96', '-356.64', '8.87', '0.15', '-0.12', '225', '0.3', '1'),
(23, '23', 'LID01', '8', '0', '550.42', '243.04', '-407.5', '13.99', '0.32', '-0.27', '0', '1', '1'),
(24, '24', 'PATTERN', '10', '0', '1095.1796', '335.5744', '419.6172', '-631.0744', '522.536', '-421.5956', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001096_drag`
--

CREATE TABLE IF NOT EXISTS `6001096_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001096_drag`
--

INSERT INTO `6001096_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1367.966', '637.8744', '233.0756', '-349.5252', '201.4644', '-234.2504', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001099_cope`
--

CREATE TABLE IF NOT EXISTS `6001099_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001099_cope`
--

INSERT INTO `6001099_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '821.75', '-333.65', '-45', '-90.08', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '822.57', '-307.87', '-45', '-90.08', '0', '0', '0', '1', '1'),
(3, '3', 'NUMDEC', '5', '0', '826.66', '170.4', '-45', '-90.08', '0', '0', '0', '1', '1'),
(4, '4', 'NUMUNID', '5', '0', '826.57', '196.05', '-45', '-90.08', '0', '0', '0', '1', '1'),
(5, '5', 'epa_stl', '2', '0', '435.75', '-254.89', '-77.78', '-90.65', '0.08', '-0.05', '190', '0.3', '1'),
(6, '6', 'epa_stl', '2', '0', '437.04', '250.89', '-75.56', '-90.65', '0.08', '-0.05', '190', '0.3', '1'),
(7, '7', 'epa_stl', '2', '0', '1096.5', '243.49', '-73.26', '-90.7', '0.02', '-0.03', '190', '0.3', '1'),
(8, '8', 'epa_stl', '2', '0', '1092.92', '-260.78', '-76.07', '-90.7', '0.02', '-0.03', '190', '0.3', '1'),
(9, '9', 'PIN1', '6', '29', '215.86', '367.32', '-50.98', '25.67', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '29', '443.55', '365.41', '-49.81', '25.67', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '29', '621.27', '363.45', '-47.99', '25.67', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '29', '848.76', '361.28', '-47.72', '25.67', '0', '-0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '29', '979.72', '359.78', '-48.38', '32.74', '0', '-0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '29', '1083.32', '359.4', '-47.87', '32.74', '0', '-0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '29', '1207.1', '357.58', '-47.97', '32.74', '0', '-0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '29', '1310.62', '357.01', '-48.97', '32.74', '0', '-0.01', '0', '1', '1'),
(17, '17', 'PIN1', '6', '29', '1318.66', '122.42', '-49.96', '-108.68', '0.01', '-0.01', '0', '1', '1'),
(18, '18', 'PIN1', '6', '29', '1090.99', '123.81', '-50.07', '-119.65', '0.01', '-0.01', '0', '1', '1'),
(19, '19', 'PIN1', '6', '29', '912.98', '125.8', '-48.6', '-119.65', '0.01', '-0.01', '0', '1', '1'),
(20, '20', 'PIN1', '6', '29', '685.55', '127.88', '-49.12', '-119.65', '0.01', '-0.01', '0', '1', '1'),
(21, '21', 'PIN1', '6', '29', '554.51', '129.08', '-49.02', '-125.98', '0.01', '-0.01', '0', '1', '1'),
(22, '22', 'PIN1', '6', '29', '451.17', '130.49', '-50.76', '-125.98', '0.01', '-0.01', '0', '1', '1'),
(23, '23', 'PIN1', '6', '29', '327.25', '131.65', '-51.56', '-125.98', '0.01', '-0.01', '0', '1', '1'),
(24, '24', 'PIN1', '6', '29', '223.86', '132.87', '-53.15', '-125.95', '0', '-0.01', '0', '1', '1'),
(25, '25', 'PIN1', '6', '29', '211.43', '-136.25', '-53.42', '26.36', '0', '-0.01', '0', '1', '1'),
(26, '26', 'PIN1', '6', '29', '438.81', '-137.69', '-51.23', '26.36', '-0.01', '0', '0', '1', '1'),
(27, '27', 'PIN1', '6', '29', '616.87', '-139.74', '-48.49', '26.36', '-0.01', '0', '0', '1', '1'),
(28, '28', 'PIN1', '6', '29', '844.56', '-142.48', '-46.24', '26.36', '-0.01', '0', '0', '1', '1'),
(29, '29', 'PIN1', '6', '29', '975.38', '-143.25', '-47.65', '26.36', '-0.01', '0', '0', '1', '1'),
(30, '30', 'PIN1', '6', '29', '1078.65', '-144.05', '-49.66', '39.15', '-0.01', '0', '0', '1', '1'),
(31, '31', 'PIN1', '6', '29', '1202.76', '-147.92', '-50.45', '30.44', '0', '0', '0', '1', '1'),
(32, '32', 'PIN1', '6', '29', '1305.7', '-149.47', '-52.37', '30.44', '0', '0', '0', '1', '1'),
(33, '33', 'PIN1', '6', '29', '218.24', '-369.15', '-55.48', '-17.19', '0', '0', '0', '1', '1'),
(34, '34', 'PIN1', '6', '29', '321.66', '-369.92', '-60.56', '-17.19', '0', '0', '0', '1', '1'),
(35, '35', 'PIN1', '6', '29', '446.23', '-371.49', '-95.18', '-7.02', '0', '0', '0', '1', '1'),
(36, '36', 'PIN1', '6', '29', '549.88', '-372.13', '-52.12', '-7.02', '0', '0', '0', '1', '1'),
(37, '37', 'PIN1', '6', '29', '680.68', '-373.95', '-52.36', '-7.02', '0', '0', '0', '1', '1'),
(38, '38', 'PIN1', '6', '29', '908.6', '-375.96', '-55.46', '1.04', '0', '0', '0', '1', '1'),
(39, '39', 'PIN1', '6', '29', '1085.82', '-377.99', '-95.23', '1.04', '0', '0', '0', '1', '1'),
(40, '40', 'PIN1', '6', '49', '1312.93', '-382.21', '-50', '43.72', '0', '0', '0', '1', '1'),
(41, '41', 'kmx_2000_rnd_8x4x12 sleeve', '3', '69', '431.71', '-254.31', '-232.48', '14.14', '0.17', '-0.11', '204', '1', '1'),
(42, '42', 'kmx_2000_rnd_8x4x12 sleeve', '3', '69', '1088.93', '-260.85', '-231.13', '14.14', '0.17', '-0.11', '204', '1', '1'),
(43, '43', 'kmx_2000_rnd_8x4x12 sleeve', '3', '69', '432.55', '252.53', '-228.98', '14.15', '0.17', '-0.12', '204', '1', '1'),
(44, '44', 'kmx_2000_rnd_8x4x12 sleeve', '3', '69', '1092.48', '245.9', '-229.42', '14.15', '0.17', '-0.12', '204', '1', '1'),
(45, '45', 'LOC05', '1', '0', '437.79', '248.96', '-118.44', '0.01', '0', '0', '0', '1', '1'),
(46, '46', 'LOC05', '1', '0', '437.14', '-257.21', '-117.11', '0.01', '0', '0.01', '0', '1', '1'),
(47, '47', 'LOC05', '1', '0', '1092.91', '-263.75', '-115.97', '0.01', '0', '0', '0', '1', '1'),
(48, '48', 'LOC05', '1', '0', '1097.66', '242.16', '-115.5', '0.01', '0', '0', '0', '1', '1'),
(49, '49', 'SPRUE', '4', '0', '1492.09', '-386.34', '-368.03', '0.52', '0', '0', '124', '1', '1'),
(50, '50', 'LID01', '8', '0', '425.38', '-248.54', '-390.63', '-7.27', '0.32', '-0.27', '0', '1', '1'),
(51, '51', 'LID01', '8', '0', '439.25', '242.91', '-388.91', '-7.26', '0.32', '-0.27', '0', '1', '1'),
(52, '52', 'LID01', '8', '0', '1098.51', '242.94', '-388.09', '-7.26', '0.32', '-0.27', '0', '1', '1'),
(53, '53', 'LID01', '8', '0', '1092.61', '-246.27', '-388.79', '-7.25', '0.32', '-0.26', '0', '1', '1'),
(54, '54', 'PATTERN', '10', '0', '1806.1408', '637.4968', '405.2696', '-189.6732', '724.8556', '-406.0048', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001099_drag`
--

CREATE TABLE IF NOT EXISTS `6001099_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001099_drag`
--

INSERT INTO `6001099_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1510.3168', '672.7924', '905.8332', '-1510.3168', '672.7924', '905.8332', '0', '1', '1');

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
-- Estructura de tabla para la tabla `6001160_cope`
--

CREATE TABLE IF NOT EXISTS `6001160_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001160_cope`
--

INSERT INTO `6001160_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '376', '186', '-68', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '351', '187', '-68', '0', '0', '-0.01', '0', '1', '1'),
(3, '3', 'PIN1', '6', '27', '42', '134.92', '-59.14', '-41.09', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '27', '260.32', '134.38', '-57.48', '-38.75', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '27', '345.07', '134.04', '-58.31', '-39.68', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '27', '562.88', '132.07', '-56.89', '-125', '-0.01', '-0.02', '0', '1', '1'),
(7, '7', 'PIN1', '6', '27', '645.85', '131.32', '-56.57', '-32', '-0.01', '-0.02', '0', '1', '1'),
(8, '8', 'PIN1', '6', '27', '863.8', '129.1', '-56.37', '-5.21', '-0.01', '-0.02', '0', '1', '1'),
(9, '9', 'PIN1', '6', '27', '949.27', '130.13', '-55.66', '-18.44', '-0.01', '-0.02', '0', '1', '1'),
(10, '10', 'PIN1', '6', '27', '1167.47', '128.22', '-56.43', '134', '-0.01', '-0.02', '0', '1', '1'),
(11, '11', 'PIN1', '6', '27', '78.72', '390.24', '-57.07', '17.13', '-0.01', '-0.02', '0', '1', '1'),
(12, '12', 'PIN1', '6', '27', '296.47', '389.34', '-55.84', '21.79', '-0.01', '-0.02', '0', '1', '1'),
(13, '13', 'PIN1', '6', '27', '380.61', '389.58', '-57.01', '27.1', '-0.01', '-0.02', '0', '1', '1'),
(14, '14', 'PIN1', '6', '27', '598.58', '387.43', '-56.06', '27.7', '-0.01', '-0.02', '0', '1', '1'),
(15, '15', 'PIN1', '6', '27', '683.14', '387.09', '-56.24', '27.7', '-0.01', '-0.02', '0', '1', '1'),
(16, '16', 'PIN1', '6', '27', '900.25', '386.21', '-55.81', '24.55', '-0.01', '-0.02', '0', '1', '1'),
(17, '17', 'PIN1', '6', '27', '985.47', '384.53', '-55.54', '24.55', '-0.01', '-0.02', '0', '1', '1'),
(18, '18', 'PIN1', '6', '27', '1202.76', '382.88', '-55.5', '-50.32', '-0.01', '-0.02', '0', '1', '1'),
(19, '19', 'CLR', '2', '0', '620', '258', '-89.09', '0.01', '0.1', '-0.07', '192', '0.3', '1'),
(20, '20', 'dyv_stl', '2', '0', '931', '253.41', '-80.85', '90.07', '0.15', '-0.1', '93', '0.3', '1'),
(21, '21', 'dyv_stl', '2', '0', '309', '260.72', '-82.2', '90.07', '0.15', '-0.1', '93', '0.3', '1'),
(22, '22', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', '0', '620', '258', '-232.77', '11.11', '0.14', '-0.09', '175', '1', '1'),
(23, '23', 'LOC06', '1', '0', '621.15', '261.33', '-121.78', '0.1', '0', '0.06', '0', '1', '1'),
(24, '24', 'kmx_2000_tube_7x6 sleeve', '3', '0', '620', '260.72', '-449.17', '28.61', '0.32', '-0.27', '175', '1', '1'),
(25, '25', 'SPRUE', '4', '0', '627.63', '0.45', '-491.39', '-2.64', '-0.01', '0.01', '124', '1', '1'),
(26, '26', 'LID03', '8', '0', '621.24', '261.33', '-501.09', '5.14', '0.32', '-0.27', '0', '1', '1'),
(27, '27', 'PATTERN', '10', '0', '1505.4032', '276.6164', '523.9616', '-164.4824', '617.4492', '-525.5596', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001160_drag`
--

CREATE TABLE IF NOT EXISTS `6001160_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001160_drag`
--

INSERT INTO `6001160_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'dyv_stl', '2', 'SI_Apilado', '310.73', '-310.63', '-48.29', '90.17', '0.13', '-0.08', '93', '0.3', '1'),
(2, '101', 'dyv_stl', '2', 'SI_Apilado', '935.86', '-321.95', '-47.15', '90.17', '0.13', '-0.08', '93', '0.3', '1'),
(3, '3', 'PATTERN', '10', '0', '1482.3576', '612.1136', '213.704', '-134.3872', '256.4048', '-217.8952', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001162_cope`
--

CREATE TABLE IF NOT EXISTS `6001162_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001162_cope`
--

INSERT INTO `6001162_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '708.437108', '246.993748', '6.93', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '684.192078', '244.456778', '7.33', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '27', '56.049828', '142.285688', '5', '-7.65', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '27', '273.468098', '142.106978', '5', '-7.65', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '27', '655.472768', '141.338428', '5', '-17.5', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '27', '872.895108', '140.789718', '5', '-20.96', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '27', '955.026878', '140.623038', '5', '-5.71', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '27', '1172.237238', '140.252018', '5', '-5.71', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '27', '1255.287238', '141.165568', '5', '-5.71', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '27', '1472.657618', '138.976088', '5', '-83.55', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '27', '91.573878', '484.167768', '5', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '27', '308.909848', '483.288068', '5', '12.63', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '27', '391.408868', '483.375458', '5', '14.64', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '27', '608.658348', '483.084878', '5', '12.63', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '27', '691.041548', '482.790948', '5', '12.63', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '27', '907.737068', '482.854318', '5', '16.16', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '27', '1290.182188', '481.140498', '5', '17.3', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '27', '1506.534068', '482.440238', '5', '-73.1', '0', '0', '0', '1', '1'),
(19, '19', 'cww', '2', '0', '1409.458168', '308.251458', '-16.44', '89.73', '0', '0', '80', '0.3', '1'),
(20, '20', 'cww', '2', '0', '1176.081838', '311.715048', '-16.45', '-89.73', '0', '0', '80', '0.3', '1'),
(21, '21', 'cww', '2', '0', '898.506218', '310.081888', '-16.71', '89.73', '0', '0', '80', '0.3', '1'),
(22, '22', 'cww', '2', '0', '665.223518', '313.216468', '-16.71', '-89.73', '0', '0', '80', '0.3', '1'),
(23, '23', 'cww', '2', '0', '388.716798', '311.695078', '-16.88', '89.73', '0', '0', '80', '0.3', '1'),
(24, '24', 'cww', '2', '0', '154.421578', '314.138438', '-16.54', '-89.73', '0', '0', '80', '0.3', '1'),
(25, '25', 'dwt_core', '2', '0', '1096.07', '412.92', '-18', '118.98', '0', '0', '190', '0.3', '1'),
(26, '26', 'dwt_core', '2', '0', '466.52', '210.99', '-18', '-0.66', '0', '0', '190', '0.3', '1'),
(27, '27', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '1094.429028', '416.539658', '-169.22', '0', '0', '0', '250', '1', '1'),
(28, '28', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '466.532168', '213.869108', '-169.56', '0', '0', '0', '250', '1', '1'),
(29, '29', 'LOC07', '1', '0', '1094.429028', '416.539658', '-51.35', '0', '0', '0', '0', '1', '1'),
(30, '30', 'LOC07', '1', '0', '466.532168', '213.869108', '-52.16', '0', '0', '0', '0', '1', '1'),
(31, '31', 'kmx_21_tube_10x4 sleeve', '3', '0', '1094.429028', '416.539658', '-376.94', '0', '0', '0', '250', '1', '1'),
(32, '32', 'kmx_21_tube_10x4 sleeve', '3', '0', '466.532168', '213.869108', '-376.94', '0', '0', '0', '250', '1', '1'),
(33, '33', 'SPRUE', '4', '0', '771.675058', '-45.796142', '-463.78', '0', '0', '0', '124', '1', '1'),
(34, '34', 'LID03', '8', '0', '1094.429028', '416.539658', '-424.68', '0', '0', '0', '0', '1', '1'),
(35, '35', 'LID03', '8', '0', '466.532168', '213.869108', '-424.68', '0', '0', '0', '0', '1', '1'),
(36, '36', 'PATTERN', '10', '0', '1743.157738', '-289.020552', '-491.88', '-179.38', '732.71', '-491.94', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001162_drag`
--

CREATE TABLE IF NOT EXISTS `6001162_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001162_drag`
--

INSERT INTO `6001162_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'cww', '2', 'SI_Apilado', '1413.265158', '-257.865162', '-143.3', '90.98', '-0.1', '0.28', '80', '0.3', '1'),
(2, '101', 'cww', '2', 'SI_Apilado', '1179.886788', '-258.762122', '-135.33', '-89.06', '-0.1', '0.28', '80', '0.3', '1'),
(3, '101', 'cww', '2', 'SI_Apilado', '901.345368', '-262.606172', '-137.99', '90.98', '-0.1', '0.28', '80', '0.3', '1'),
(4, '101', 'cww', '2', 'SI_Apilado', '668.075348', '-263.351922', '-139.81', '-89.06', '-0.1', '0.28', '80', '0.3', '1'),
(5, '101', 'cww', '2', 'SI_Apilado', '389.702058', '-267.024102', '-138.9', '90.64', '-0.1', '0.28', '80', '0.3', '1'),
(6, '101', 'cww', '2', 'SI_Apilado', '155.230168', '-267.613052', '-133.98', '-89.06', '-0.1', '0.28', '80', '0.3', '1'),
(7, '101', 'cww', '2', 'SI_Apilado', '1414.400998', '-349.303732', '-143.46', '90.64', '-0.1', '0.28', '80', '0.3', '1'),
(8, '101', 'cww', '2', 'SI_Apilado', '1181.169358', '-352.640372', '-143.61', '-89.84', '-0.1', '0.28', '80', '0.3', '1'),
(9, '101', 'cww', '2', 'SI_Apilado', '902.820998', '-354.931112', '-144.51', '90.64', '-0.1', '0.28', '80', '0.3', '1'),
(10, '101', 'cww', '2', 'SI_Apilado', '669.219358', '-358.260822', '-143.82', '-89.83', '-0.1', '0.28', '80', '0.3', '1'),
(11, '101', 'cww', '2', 'SI_Apilado', '390.090798', '-362.371362', '-143.14', '90.64', '-0.1', '0.28', '80', '0.3', '1'),
(12, '101', 'cww', '2', 'SI_Apilado', '155.782308', '-362.358442', '-144.86', '-89.01', '-0.1', '0.28', '80', '0.3', '1'),
(13, '13', 'PATTERN', '10', '0', '1743.353654', '-705.0247276', '-263.3744', '172.3692', '276.9808', '266.7676', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001226_cope`
--

CREATE TABLE IF NOT EXISTS `6001226_cope` (
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
-- Volcado de datos para la tabla `6001226_cope`
--

INSERT INTO `6001226_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'eol', '2', '0', '761.781338', '22.623318', '-216.7', '89.8', '0', '0', '255', '0.3', '1'),
(2, '2', 'eol', '2', '0', '361.826718', '18.643868', '-214.19', '-89.98', '0', '0', '255', '0.3', '1'),
(3, '3', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '365.407228', '22.273688', '-366', '0', '0', '0', '255', '1', '1'),
(4, '4', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '767.282848', '25.274148', '-364', '0', '0', '0', '255', '1', '1'),
(5, '5', 'LOC07', '1', '0', '365.7', '21.19', '-248.19', '1.05', '0', '0', '0', '1', '1'),
(6, '6', 'LOC07', '1', '0', '764.49', '22.77', '-248.22', '1.05', '0', '0', '0', '1', '1'),
(7, '7', 'SPRUE', '4', '0', '562.13', '-351.67', '-501', '6.11', '0', '0', '124', '1', '1'),
(8, '8', 'LID03', '8', '0', '365.407228', '22.273688', '-524.08', '0', '0', '0', '0', '1', '1'),
(9, '9', 'LID03', '8', '0', '767.282848', '25.274148', '-523', '0', '0', '0', '0', '1', '1'),
(10, '10', 'PATTERN', '10', '0', '1231.195428', '-554.473572', '-525', '-93.92', '572.46', '-525', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6001226_drag`
--

CREATE TABLE IF NOT EXISTS `6001226_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001226_drag`
--

INSERT INTO `6001226_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1185.45', '565.33', '-221', '-80', '440', '-221.34', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6003691_cope`
--

CREATE TABLE IF NOT EXISTS `6003691_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6003691_cope`
--

INSERT INTO `6003691_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1044.32', '-99.49', '-5.21', '90', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1042.09', '-125.22', '-4.41', '90', '0', '0', '0', '1', '1'),
(3, '3', 'jkba (1)', '2', '0', '541.62', '129.44', '-32.62', '0', '0', '0', '129', '0.3', '1'),
(4, '4', 'jkba (1)', '2', '0', '975.23', '108.8', '-29.76', '-84.6', '0', '0', '129', '0.3', '1'),
(5, '5', 'jkba (1)', '2', '0', '722.9', '-178.39', '-32.74', '0', '0', '0', '129', '0.3', '1'),
(6, '6', 'JKB', '2', '0', '195.4', '11.86', '-30.47', '0', '0', '0', '90', '0.3', '1'),
(7, '7', '6x2.9x8 ND sleeve', '3', '0', '194.74', '7.87', '-117.81', '0', '0', '0', '154', '1', '1'),
(8, '8', '6x2.9x8 ND sleeve', '3', '0', '542.25', '126.32', '-117.76', '0', '0', '0', '154', '1', '1'),
(9, '9', '6x2.9x8 ND sleeve', '3', '0', '723.41', '-180.7', '-118.41', '0', '0', '0', '154', '1', '1'),
(10, '10', '6x2.9x8 ND sleeve', '3', '0', '972.03', '104.82', '-115.88', '0', '0', '0', '154', '1', '1'),
(11, '11', 'LOC03', '1', '0', '195.76', '11.55', '-44.5', '-0.63', '0', '0', '0', '1', '1'),
(12, '12', 'LOC03', '1', '0', '544.48', '128.96', '-44.15', '-0.63', '0', '0', '0', '1', '1'),
(13, '13', 'LOC03', '1', '0', '723.33', '-178.7', '-45', '-0.63', '0', '0', '0', '1', '1'),
(14, '14', 'LOC03', '1', '0', '973.68', '106.82', '-44.13', '-0.63', '0', '0', '0', '1', '1'),
(15, '15', 'SPRUE', '4', '0', '1212.86', '-278.04', '-207.32', '-0.15', '0', '0', '124', '1', '1'),
(16, '16', 'LID03', '8', '0', '194.74', '7.87', '-223.66', '0', '0', '0', '0', '1', '1'),
(17, '17', 'LID03', '8', '0', '542.25', '126.32', '-223.58', '0', '0', '0', '0', '1', '1'),
(18, '18', 'LID03', '8', '0', '972.03', '104.82', '-221.9', '0', '0', '0', '0', '1', '1'),
(19, '19', 'LID03', '8', '0', '723.41', '-180.7', '-224', '0', '0', '0', '0', '1', '1'),
(20, '20', 'PATTERN', '10', '0', '82.0203999999999', '493.2836', '234.4508', '1409.4736', '-472.628', '-232.4824', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6004943_cope`
--

CREATE TABLE IF NOT EXISTS `6004943_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6004943_cope`
--

INSERT INTO `6004943_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'elv', '2', '0', '506.04', '286.46', '-68.24', '89.86', '0', '0', '205', '0.3', '1'),
(2, '2', 'NUMDEC', '5', '0', '913.64', '320', '-47.54', '0', '0', '0', '0', '1', '1'),
(3, '3', 'NUMUNID', '5', '0', '888.27', '320', '-44.4', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '40', '95.11', '118.4', '-60.33', '14.77', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '40', '358.87', '119.04', '-57.27', '14.77', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '40', '516.9', '119.38', '-56.97', '14.77', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '40', '781.38', '120.12', '-58.87', '5.97', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '40', '939.94', '120.67', '-59.1', '4.2', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '40', '1203.94', '120.57', '-60.7', '116.44', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '40', '93.52', '430.49', '-25.02', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '40', '401.56', '431.42', '-25.01', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '40', '515.81', '430.94', '-25.01', '16.24', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '40', '824.12', '432.1', '-25', '16.24', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '40', '938.02', '432.1', '-25', '16.24', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '40', '1247.14', '432.18', '-25.32', '-117.55', '0', '0', '0', '1', '1'),
(16, '16', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '505.33', '282.98', '-198.16', '0', '0', '0', '250', '1', '1'),
(17, '17', 'LOC07', '1', '0', '506.7', '283', '-77.43', '1.57', '0', '0', '0', '1', '1'),
(18, '18', 'kmx_21_tube_10x4 sleeve', '3', '0', '505.33', '282.98', '-399.93', '0', '0', '0', '250', '1', '1'),
(19, '19', 'SPRUE', '4', '0', '696.26', '-8.63', '-444.18', '0', '0', '0', '124', '1', '1'),
(20, '20', 'LID05', '8', '0', '505.33', '282.98', '-449.55', '0', '0', '0', '0', '1', '1'),
(21, '21', 'PATTERN', '10', '0', '210.762', '662.5392', '468.8516', '1589.4676', '-227.6624', '-468.852', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6004943_drag`
--

CREATE TABLE IF NOT EXISTS `6004943_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6004943_drag`
--

INSERT INTO `6004943_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'elw_core', '2', '0', '453.34', '-86.6', '-103', '0.22', '0.02', '-0.05', '92', '0.1', '1'),
(2, '2', 'elw_core', '2', '0', '928.48', '-86.6', '-102.31', '0.22', '0.02', '-0.05', '92', '0.1', '1'),
(3, '3', 'PATTERN', '10', '0', '199.214', '239.766', '199.0352', '1582.624', '-654.4372', '-198.3072', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6005959_cope`
--

CREATE TABLE IF NOT EXISTS `6005959_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6005959_cope`
--

INSERT INTO `6005959_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '348.382258', '334.394198', '-4.5', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '373.907318', '334.214918', '-4.09', '0', '0', '0', '0', '1', '1'),
(3, '102', 'epf', '2', 'SI_Apilado', '638.605168', '262.767598', '-38.84', '0', '0', '0', '190', '0.3', '1'),
(4, '101', 'eqd', '2', 'SI_Apilado', '978.937608', '264.471008', '-31.75', '90.59', '0', '0', '84', '0.3', '1'),
(5, '101', 'eqd', '2', 'SI_Apilado', '301.488068', '265.160048', '-31.95', '90.59', '0', '0', '84', '0.3', '1'),
(6, '103', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '636.808558', '264.258018', '-157.46', '0.01', '-0.1', '0.36', '228', '1', '1'),
(7, '7', 'LOC06', '1', '0', '636.076898', '265.310098', '-62.9', '-0.95', '0', '0', '0', '1', '1'),
(8, '104', 'kmx_2000_tube_9x6 sleeve', '3', 'NO_Apilado', '636.808558', '264.258018', '-363.56', '0.01', '-0.1', '0.36', '225', '1', '1'),
(9, '9', 'SPRUE', '4', '0', '903.707558', '-41.843482', '-422.33', '-0.62', '-0.01', '0', '124', '1', '1'),
(10, '10', 'LID05', '8', '0', '636.698558', '264.256808', '-445.07', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PATTERN', '10', '0', '220.6357844', '676.9281984', '446.6432', '1508.9028', '-310.75', '-446.036', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6005959_drag`
--

CREATE TABLE IF NOT EXISTS `6005959_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6005959_drag`
--

INSERT INTO `6005959_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '38', '244.34', '-390.58', '-123.81', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '38', '375.39', '-388.85', '-123.69', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '38', '555.37', '-385.79', '-123.35', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '38', '685.92', '-384.17', '-122.69', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '38', '865.86', '-381.19', '-123.01', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '38', '996.1', '-380.03', '-122.9', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '38', '1175.54', '-377.33', '-122.94', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '38', '1306.12', '-375.5', '-123.19', '87.97', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '38', '873.53', '-124.34', '-123.28', '0', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '38', '1003.6', '-122.46', '-123.61', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '38', '1183.36', '-120.06', '-123.33', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '38', '1312.71', '-117.57', '-123.25', '70.55', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '38', '694.44', '-126.2', '-140.04', '129.21', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '38', '563.73', '-128.64', '-123.27', '129.21', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '38', '383.84', '-132.12', '-123.18', '129.21', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '38', '253.55', '-133.85', '-123.22', '129.21', '0', '0', '0', '1', '1'),
(17, '101', 'eqd', '2', 'SI_Apilado', '1115.37', '-211.57', '-156.9', '90.78', '0', '0', '84', '0.3', '1'),
(18, '101', 'eqd', '2', 'SI_Apilado', '440.3', '-221.16', '-156.25', '90.78', '0', '0', '84', '0.3', '1'),
(19, '101', 'eqd', '2', 'SI_Apilado', '1117.47', '-291', '-166.81', '-89.56', '0', '0', '84', '0.3', '1'),
(20, '101', 'eqd', '2', 'SI_Apilado', '442.26', '-300.62', '-166.86', '-89.56', '0', '0', '84', '0.3', '1'),
(21, '21', 'PATTERN', '10', '0', '1634.02', '-611.9', '-262.22', '-78.99', '284.47', '-262.09', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6005970_cope`
--

CREATE TABLE IF NOT EXISTS `6005970_cope` (
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
-- Volcado de datos para la tabla `6005970_cope`
--

INSERT INTO `6005970_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1051.27', '-151.14', '41.03', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1024.49', '-150.57', '42', '0', '0', '0', '0', '1', '1'),
(3, '102', 'epf', '2', 'SI_Apilado', '763.01', '-78.8', '3.74', '-0.91', '0.01', '-0.01', '190', '0.3', '1'),
(4, '101', 'eqd', '2', 'SI_Apilado', '424.68', '-70.35', '5.86', '90.12', '0.01', '-0.03', '84', '0.3', '1'),
(5, '101', 'eqd', '2', 'SI_Apilado', '1100.74', '-83.62', '7.75', '89.89', '0.01', '-0.03', '84', '0.3', '1'),
(6, '103', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '761.43', '-80.9', '-120.28', '0.3', '0', '0', '228', '1', '1'),
(7, '7', 'LOC06', '1', '0', '763.26', '-78.46', '-24.93', '0.02', '0', '0', '0', '1', '1'),
(8, '104', 'kmx_2000_tube_9x6 sleeve', '3', 'NO_Apilado', '761.43', '-80.9', '-322.1', '0.3', '0', '0', '225', '1', '1'),
(9, '9', 'LID05', '8', '0', '761.43', '-80.9', '-410.78', '0.3', '0', '0', '0', '1', '1'),
(10, '10', 'PATTERN', '10', '0', '1615.27', '-452.94', '-418', '-87.75', '290.98', '-418', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6005970_drag`
--

CREATE TABLE IF NOT EXISTS `6005970_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6005970_drag`
--

INSERT INTO `6005970_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '25', '227.79', '-3.11', '-123.7', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '25', '358.57', '-4', '-123.25', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '25', '538.78', '-5.55', '-122.75', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '25', '669.31', '-6.73', '-122.21', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '25', '849.03', '-8.26', '-121.35', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '25', '979.69', '-9.2', '-120.09', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '25', '1159.31', '-10.98', '-120.62', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '25', '1288.64', '-12.26', '-119.74', '75.43', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '25', '242.44', '256.24', '-123.84', '1.41', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '25', '372.72', '255.26', '-123.01', '1.41', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '25', '552.78', '253.84', '-122.36', '1.41', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '25', '683.18', '252.24', '-122.5', '1.41', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '25', '863.28', '250.39', '-121.04', '1.41', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '25', '993.97', '249.86', '-120.87', '1.41', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '25', '1173.69', '248.19', '-120.36', '1.41', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '25', '1304.84', '245.96', '-122.31', '-50.81', '0', '0', '0', '1', '1'),
(17, '101', 'eqd', '2', 'SI_Apilado', '1103.52', '156.62', '-152.84', '90.46', '0.06', '-0.16', '84', '0.3', '1'),
(18, '101', 'eqd', '2', 'SI_Apilado', '427.31', '162.73', '-156.9', '90.53', '0.06', '-0.16', '84', '0.3', '1'),
(19, '101', 'eqd', '2', 'SI_Apilado', '1103.62', '76.99', '-167.83', '-89.56', '0.06', '-0.16', '84', '0.3', '1'),
(20, '101', 'eqd', '2', 'SI_Apilado', '427.34', '81.63', '-167.52', '-90.16', '0.06', '-0.16', '84', '0.3', '1'),
(21, '21', 'PATTERN', '10', '0', '1607.07', '-226.89', '-295.4', '-74.75', '481.96', '-298.83', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006572_cope`
--

CREATE TABLE IF NOT EXISTS `6006572_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006572_cope`
--

INSERT INTO `6006572_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '120.19', '214.43', '-35.9', '-91.69', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '120.19', '240.31', '-34.16', '-91.69', '0', '0', '0', '1', '1'),
(3, '101', 'xta_stl', '2', 'SI_Apilado', '453.48', '295.27', '-65.42', '-90.38', '0.06', '-0.04', '225', '0.3', '1'),
(4, '101', 'xta_stl', '2', 'SI_Apilado', '1055.31', '286.27', '-56.78', '-90.38', '0.06', '-0.04', '225', '0.3', '1'),
(5, '101', 'xta_stl', '2', 'SI_Apilado', '1655.55', '278.1', '-61.57', '-90.38', '0.06', '-0.04', '225', '0.3', '1'),
(6, '102', 'kmx_21_rnd_12x6x12 sleeve', '3', 'NO_Apilado', '1651.88', '273.22', '-212.41', '-0.49', '0.21', '-0.15', '300', '1', '1'),
(7, '102', 'kmx_21_rnd_12x6x12 sleeve', '3', 'NO_Apilado', '1051.47', '280.09', '-211.15', '-0.49', '0.21', '-0.15', '300', '1', '1'),
(8, '102', 'kmx_21_rnd_12x6x12 sleeve', '3', 'NO_Apilado', '451.7', '292.96', '-211.5', '-0.48', '0.21', '-0.15', '300', '1', '1'),
(9, '9', 'LOC08', '1', '0', '456.88', '294.37', '-98.79', '-0.01', '0', '0', '0', '1', '1'),
(10, '10', 'LOC08', '1', '0', '1054.33', '287.13', '-93.03', '-0.01', '0', '0', '0', '1', '1'),
(11, '11', 'LOC08', '1', '0', '1657.39', '278.22', '-96.21', '-0.01', '0', '0', '0', '1', '1'),
(12, '103', 'kmx_21_tube_12x4 sleeve', '3', 'NO_Apilado', '456.18', '294.48', '-422.41', '18.48', '0.28', '-0.23', '300', '1', '1'),
(13, '103', 'kmx_21_tube_12x4 sleeve', '3', 'NO_Apilado', '1054.43', '287.14', '-419.59', '18.48', '0.28', '-0.23', '300', '1', '1'),
(14, '103', 'kmx_21_tube_12x4 sleeve', '3', 'NO_Apilado', '1657.07', '278.54', '-419.19', '18.44', '0.28', '-0.22', '300', '1', '1'),
(15, '15', 'SPRUE', '4', '0', '1020.43', '-17.99', '-458.38', '-0.01', '-0.01', '0', '124', '1', '1'),
(16, '16', 'LID08', '8', '0', '1657.51', '278.09', '-473.42', '-0.46', '-0.51', '0.83', '0', '1', '1'),
(17, '17', 'LID08', '8', '0', '1054.01', '287.68', '-473.88', '-0.46', '-0.51', '0.83', '0', '1', '1'),
(18, '18', 'LID08', '8', '0', '456.84', '294.05', '-477.03', '-0.46', '-0.51', '0.83', '0', '1', '1'),
(19, '19', 'PATTERN', '10', '0', '2220.8428', '271.7216', '492.528', '-211.374', '707.3248', '-492.528', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006572_drag`
--

CREATE TABLE IF NOT EXISTS `6006572_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006572_drag`
--

INSERT INTO `6006572_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '70', '500.16', '-153.55', '-69.85', '128.45', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '70', '1315.84', '-157.98', '-69.72', '128.45', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '70', '1944.77', '-159.02', '-66.63', '70.79', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '70', '1724.3', '-157.82', '-67.05', '70.79', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '70', '1535.59', '-156.62', '-118.3', '70.79', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '70', '1127.92', '-154.84', '-68.27', '70.79', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '70', '909.71', '-155.16', '-69.83', '70.79', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '70', '723.07', '-151.8', '-70.84', '52.4', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '70', '316.02', '-149.66', '-71.03', '52.4', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '70', '96.17', '-148.5', '-69.69', '52.4', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '70', '157.09', '-447.64', '-71.52', '-0.09', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '70', '377.26', '-448.68', '-70.34', '-0.09', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '70', '564.38', '-449.68', '-69.99', '-0.09', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '70', '784.22', '-451.1', '-70.7', '-0.09', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '70', '971.79', '-451.62', '-70.4', '-0.09', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '70', '1192.09', '-452.76', '-70.7', '-0.09', '0', '0', '0', '1', '1'),
(17, '17', 'PIN1', '6', '70', '1379.51', '-454.18', '-68.34', '-0.09', '0', '0', '0', '1', '1'),
(18, '18', 'PIN1', '6', '70', '1599.49', '-455.26', '-68.03', '-0.09', '0', '0', '0', '1', '1'),
(19, '19', 'PIN1', '6', '70', '1786.49', '-456.93', '-65.81', '-0.09', '0', '0', '0', '1', '1'),
(20, '20', 'PIN1', '6', '70', '2003.33', '-456.46', '-65.7', '59.82', '0', '0', '0', '1', '1'),
(21, '21', 'PATTERN', '10', '0', '2221.8016', '699.9312', '239.8156', '-206.8216', '238.8936', '-235.7152', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006668_cope`
--

CREATE TABLE IF NOT EXISTS `6006668_cope` (
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
-- Volcado de datos para la tabla `6006668_cope`
--

INSERT INTO `6006668_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1015.83', '365.06', '-18.55', '90', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '990.68', '365.3', '-19.67', '90', '0', '0', '0', '1', '1'),
(3, '3', 'NUMDEC', '5', '0', '227.46', '364.39', '-19.81', '90', '0', '0', '0', '1', '1'),
(4, '4', 'NUMUNID', '5', '0', '201.6', '365.46', '-20.75', '90', '0', '0', '0', '1', '1'),
(5, '5', 'dml_core', '2', '0', '1152.75', '258.05', '-51', '-34.23', '0', '0', '225', '0.3', '1'),
(6, '6', 'dml_core', '2', '0', '351.08', '263.81', '-51', '-31.03', '0', '0', '225', '0.3', '1'),
(7, '7', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '346.36', '260.18', '-198', '0', '0', '0', '250', '1', '1'),
(8, '8', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '1148.85', '254.77', '-198', '0', '0', '0', '250', '1', '1'),
(9, '9', 'LOC07', '1', '0', '1152.25', '255.09', '-82.27', '-0.33', '0', '0', '0', '1', '1'),
(10, '10', 'LOC07', '1', '0', '350.54', '262.12', '-84.03', '-0.33', '0', '0', '0', '1', '1'),
(11, '11', 'SPRUE', '4', '0', '542.55', '-23.52', '-345.13', '0', '0', '0', '124', '1', '1'),
(12, '12', 'SPRUE', '4', '0', '1347.16', '-23.8', '-345.72', '0', '0', '0', '124', '1', '1'),
(13, '13', 'LID05', '8', '0', '1148.85', '254.77', '-351.98', '0', '0', '0', '0', '1', '1'),
(14, '14', 'LID05', '8', '0', '346.36', '260.18', '-354.65', '0', '0', '0', '0', '1', '1'),
(15, '15', 'PATTERN', '10', '0', '177.0044', '635.796', '375.9748', '1676.1972', '-210.4352', '-373.0768', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006668_drag`
--

CREATE TABLE IF NOT EXISTS `6006668_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006668_drag`
--

INSERT INTO `6006668_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '28', '113.37', '-402.54', '-74.21', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '28', '265.75', '-405.78', '-74', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '28', '434.65', '-408.83', '-74.01', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '28', '599.41', '-412.53', '-74.05', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '28', '914.44', '-418.87', '-73.31', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '28', '1066.93', '-422.27', '-71.88', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '28', '1236.59', '-424.85', '-71.48', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '28', '1399.75', '-429.78', '-71.37', '66.66', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '28', '86.12', '-119.5', '-73.95', '-5.82', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '28', '251.19', '-124.68', '-72.99', '-5.82', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '28', '420.61', '-127.85', '-73.06', '25.87', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '28', '573.13', '-130.01', '-72.05', '25.87', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '28', '887.9', '-137.64', '-71.51', '-11.7', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '28', '1053.86', '-140.42', '-71.9', '-11.7', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '28', '1222.83', '-145.06', '-71.18', '27.04', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '28', '1375.46', '-146.62', '-71.38', '-44.86', '0', '0', '0', '1', '1'),
(17, '101', 'emt_core-2', '2', 'NO_Apilado', '335.01', '-70.54', '-137.53', '-1.41', '0', '0', '160', '0.1', '1'),
(18, '101', 'emt_core-2', '2', 'NO_Apilado', '1137.52', '-87.25', '-134.28', '-1.2', '0', '0', '160', '0.1', '1'),
(19, '19', 'PATTERN', '10', '0', '177.372', '204.212', '246.9456', '1666.8764', '-666.0178', '-244.8888', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006783_cope`
--

CREATE TABLE IF NOT EXISTS `6006783_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006783_cope`
--

INSERT INTO `6006783_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'epu_stl', '2', 'SI_Apilado', '835.94', '313.53', '-75.45', '90', '0', '0', '255', '0.3', '1'),
(2, '2', 'NUMDEC', '5', '0', '250.41', '340.2', '-37.98', '-2.84', '0', '0', '0', '1', '1'),
(3, '3', 'NUMUNID', '5', '0', '248.88', '313.82', '-39.09', '-2.84', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '83', '-0.87', '477.08', '-58.21', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '83', '278.64', '473.44', '-55.17', '0', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '83', '421.4', '471.61', '-53.66', '0', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '83', '701.76', '467.17', '-76.39', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '83', '845.07', '463.92', '-76.24', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '83', '1125', '457.52', '-56.78', '-81.28', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '83', '22.5', '182.52', '-57.86', '0', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '83', '301.67', '177.04', '-56.29', '0', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '83', '444.45', '174.87', '-54.92', '0', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '83', '724.32', '170.42', '-83.33', '0', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '83', '866.61', '168.19', '-85.27', '0', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '83', '1144', '164.04', '-56.3', '130.83', '-0.01', '0', '0', '1', '1'),
(16, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '832.43', '313.42', '-219.93', '1.33', '0.02', '-0.01', '255', '1', '1'),
(17, '17', 'LOC07', '1', '0', '832.45', '313.44', '-97.42', '-0.71', '0', '0', '0', '1', '1'),
(18, '103', 'kmx_21_tube_10x4 sleeve', '3', 'NO_Apilado', '832.43', '313.42', '-424.66', '17.65', '0.32', '-0.27', '255', '1', '1'),
(19, '19', 'SPRUE', '4', '0', '1015.26', '-11.43', '-465.99', '-0.32', '-0.01', '0', '124', '1', '1'),
(20, '20', 'LID05', '8', '0', '832.46', '313.4', '-475.68', '92.65', '0', '0', '0', '1', '1'),
(21, '21', 'PATTERN', '10', '0', '1472.8144', '230.6636', '495.8976', '-331.45', '720.0048', '-498.064', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006783_drag`
--

CREATE TABLE IF NOT EXISTS `6006783_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006783_drag`
--

INSERT INTO `6006783_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1427.42', '736.472', '212.1216', '-327.2336', '189.3116', '-212.1216', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006784_cope`
--

CREATE TABLE IF NOT EXISTS `6006784_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006784_cope`
--

INSERT INTO `6006784_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '202.88', '244.75', '-28.51', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMDEC', '5', '0', '203.15', '245.09', '-28.86', '0', '0', '0', '0', '1', '1'),
(3, '3', 'epu_stl', '2', '0', '723.71', '277.23', '-73.77', '-92.15', '0.05', '-0.03', '255', '0.3', '1'),
(4, '4', 'PIN1', '6', '0', '1004.8', '123.45', '-46.38', '-134.1', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '0', '780.92', '127.93', '-47.62', '-134.1', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '0', '650.04', '130.79', '-45.39', '-134.1', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '0', '426.04', '134.97', '-46', '-134.1', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '0', '294.81', '137.94', '-47.25', '-134.1', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '0', '70.46', '143.01', '-47.71', '-117.51', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '0', '22.96', '436.32', '-48.32', '13.32', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '0', '247.18', '431.52', '-44.6', '13.32', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '0', '377.64', '429.58', '-45.8', '13.32', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '0', '599.84', '423.98', '-44.59', '13.32', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '0', '730.44', '421.11', '-45.05', '13.32', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '0', '954.79', '416.1', '-45.41', '-27.22', '0', '0', '0', '1', '1'),
(16, '16', 'kmx_21_rnd_9x4-5x12 sleeve', '3', '5', '723.94', '276.6', '-215.38', '1.52', '0.16', '-0.11', '226', '1', '1'),
(17, '17', 'LOC06', '1', '0', '723.33', '276.1', '-87.7', '0', '0', '0', '0', '1', '1'),
(18, '18', 'kmx_21_tube_10x4 sleeve', '3', '0', '723.34', '276.05', '-366.03', '-2.16', '0.16', '-0.11', '226', '1', '1'),
(19, '19', 'SPRUE', '4', '0', '981', '-55.84', '-465.74', '-2.34', '-0.01', '0', '124', '1', '1'),
(20, '20', 'LID04', '8', '0', '723.34', '276.11', '-466.03', '0', '0', '0', '0', '1', '1'),
(21, '21', 'PATTERN', '10', '0', '1294.7616', '259.4832', '488.7968', '-261.1884', '676.5788', '-488.6368', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6006784_drag`
--

CREATE TABLE IF NOT EXISTS `6006784_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6006784_drag`
--

INSERT INTO `6006784_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '1427.3908', '97.1188000000002', '219.2696', '-46.2664', '808.2084', '-222.7052', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6008760_cope`
--

CREATE TABLE IF NOT EXISTS `6008760_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6008760_cope`
--

INSERT INTO `6008760_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '77.23', '-273.76', '-17.61', '-2.84', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '102.47', '-275.1', '-18.58', '-2.84', '0', '0', '0', '1', '1'),
(3, '101', 'epl_stl', '2', 'SI_Apilado', '221.84', '-514.48', '-43.97', '93.17', '0', '0.02', '225', '0.3', '1'),
(4, '101', 'epl_stl', '2', 'SI_Apilado', '542.53', '-300.48', '-43.25', '92.01', '0', '0.02', '225', '0.3', '1'),
(5, '101', 'epl_stl', '2', 'SI_Apilado', '849.56', '-528.53', '-41.47', '90.17', '0', '0.02', '225', '0.3', '1'),
(6, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '219.36', '-513.37', '-197.54', '0', '0', '0', '255', '1', '1'),
(7, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '536.24', '-294.69', '-196.21', '0', '0', '0', '255', '1', '1'),
(8, '102', 'kmx_21_rnd_10x5x12 sleeve', '3', 'NO_Apilado', '844.44', '-529.37', '-193.57', '0', '0', '0', '255', '1', '1'),
(9, '9', 'LOC07', '1', '0', '219.17', '-513.37', '-77.12', '-2.06', '0', '0', '0', '1', '1'),
(10, '10', 'LOC07', '1', '0', '536.29', '-294.63', '-77.22', '-2.06', '0', '0', '0', '1', '1'),
(11, '11', 'LOC07', '1', '0', '844.45', '-529.39', '-75.06', '-2.06', '0', '0', '0', '1', '1'),
(12, '12', 'SPRUE', '4', '0', '531.37', '-733.07', '-350.9', '0.35', '-0.01', '0', '124', '1', '1'),
(13, '13', 'LID05', '8', '0', '844.45', '-529.39', '-357.73', '0', '0', '0', '0', '1', '1'),
(14, '14', 'LID05', '8', '0', '536.29', '-294.63', '-355.93', '0', '0', '0', '0', '1', '1'),
(15, '15', 'LID05', '8', '0', '219.17', '-513.37', '-356.06', '0', '0', '0', '0', '1', '1'),
(16, '16', 'PATTERN', '10', '0', '1364.078', '1002.8152', '376.9012', '-283.8448', '94.9083999999998', '-376.9132', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6008761_cope`
--

CREATE TABLE IF NOT EXISTS `6008761_cope` (
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
-- Volcado de datos para la tabla `6008761_cope`
--

INSERT INTO `6008761_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '340.42', '-10.56', '42.25', '6.68', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '315.73', '-14.05', '42.22', '6.67', '0', '0', '0', '1', '1'),
(3, '101', 'hwe_stl', '2', 'SI_Apilado', '473.74', '85.55', '23.1', '2.23', '0.11', '-0.07', '153', '0.3', '1'),
(4, '102', 'kmx_21_rnd_9x4-5x10 sleeve', '3', 'NO_Apilado', '476.46', '85.24', '-103.34', '1.15', '0.02', '-0.01', '228', '1', '1'),
(5, '5', 'LOC06', '1', '0', '476.07', '85.3', '-0.18', '-1.97', '0', '0', '0', '1', '1'),
(6, '6', 'SPRUE', '4', '0', '807.77', '-111.65', '-212.87', '-0.28', '0', '-0.02', '124', '1', '1'),
(7, '7', 'LID05', '8', '0', '476.07', '85.3', '-227.89', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PATTERN', '10', '0', '1226.3208', '348.3496', '240.5584', '-63.3532', '498.2452', '-244.3012', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6008761_drag`
--

CREATE TABLE IF NOT EXISTS `6008761_drag` (
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
-- Volcado de datos para la tabla `6008761_drag`
--

INSERT INTO `6008761_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'mc-q664-b-1_stl', '2', 'SI_Apilado', '441.64', '-175.85', '-200.98', '1.4', '0.01', '-0.01', '90', '0.05', '1'),
(2, '2', 'PATTERN', '10', '0', '1248.4824', '626.1424', '300.1176', '-89.7840000000001', '274.9312', '-300.1288', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6009046_cope`
--

CREATE TABLE IF NOT EXISTS `6009046_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6009046_cope`
--

INSERT INTO `6009046_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1827.42', '214.92', '-0.57', '-6.11', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1800.51', '216.89', '-7.54', '-6.11', '0', '0', '0', '1', '1'),
(3, '3', 'eim_stl', '2', '0', '306.23', '246.61', '-30.56', '90.46', '0.16', '-0.1', '218', '0.3', '1'),
(4, '4', 'eim_stl', '2', '0', '878.05', '239.29', '-26.3', '90.46', '0.16', '-0.1', '218', '0.3', '1'),
(5, '5', 'eim_stl', '2', '0', '1642.99', '229.01', '-26.59', '90.46', '0.16', '-0.1', '218', '0.3', '1'),
(6, '6', 'eim_stl', '2', '0', '2219.93', '222.58', '-25.59', '90.46', '0.16', '-0.1', '218', '0.3', '1'),
(7, '7', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '2220.05', '229.22', '-179.25', '-1.14', '0.2', '-0.13', '250', '1', '1'),
(8, '8', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '1642.18', '233.5', '-180.17', '-1.14', '0.2', '-0.13', '250', '1', '1'),
(9, '9', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '876.81', '244.96', '-178.5', '-1.14', '0.2', '-0.13', '250', '1', '1'),
(10, '10', 'kmx_21_rnd_10x5x12 sleeve', '3', '0', '304.45', '251.28', '-180.91', '-1.14', '0.2', '-0.13', '250', '1', '1'),
(11, '11', 'LOC06', '1', '0', '303.81', '248.63', '-59.33', '-0.1', '-0.02', '-0.02', '0', '1', '1'),
(12, '12', 'LOC06', '1', '0', '877.41', '239.32', '-54.3', '-0.1', '-0.02', '-0.02', '0', '1', '1'),
(13, '13', 'LOC06', '1', '0', '1643.35', '230.99', '-53.27', '-0.1', '-0.02', '-0.02', '0', '1', '1'),
(14, '14', 'LOC06', '1', '0', '2219.63', '223.63', '-52.03', '-0.1', '-0.02', '-0.02', '0', '1', '1'),
(15, '15', 'SPRUE', '4', '0', '2018.99', '-10.35', '-318.14', '-0.14', '-0.01', '0', '124', '1', '1'),
(16, '16', 'LID01', '8', '0', '303.81', '248.63', '-337.03', '10.04', '0.31', '-0.28', '0', '1', '1'),
(17, '17', 'LID01', '8', '0', '877.41', '239.32', '-334.97', '10.05', '0.31', '-0.28', '0', '1', '1'),
(18, '18', 'LID01', '8', '0', '1643.35', '230.99', '-333.41', '10.06', '0.31', '-0.28', '0', '1', '1'),
(19, '19', 'LID01', '8', '0', '2219.63', '223.63', '-331.47', '10.07', '0.31', '-0.28', '0', '1', '1'),
(20, '20', 'PATTERN', '10', '0', '2591.7184', '244.1384', '344.8612', '-69.3072000000002', '730.8832', '-356.7204', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6009046_drag`
--

CREATE TABLE IF NOT EXISTS `6009046_drag` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6009046_drag`
--

INSERT INTO `6009046_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PATTERN', '10', '0', '2531.0756', '267.8284', '282.7972', '-73.8447999999999', '696.028', '-293.5764', '0', '1', '1');

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
-- Estructura de tabla para la tabla `blankrecipe`
--

CREATE TABLE IF NOT EXISTS `blankrecipe` (
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
-- Volcado de datos para la tabla `blankrecipe`
--

INSERT INTO `blankrecipe` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(2, '102', 'jkba (1)', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '129', '0.3', '1'),
(3, '101', 'JKB', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '90', '0.3', '1'),
(4, '103', '6x2.9x8 ND sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '154', '1', '1'),
(5, '5', 'SPRUE', '4', '0', '0', '0', '-1000', '0', '0', '0', '124', '1', '1'),
(6, '6', 'LOC03', '1', '0', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(7, '7', 'LID03', '8', '0', '0', '0', '-1000', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PATTERN', '10', '0', '1510.3168', '672.7924', '905.8332', '-1510.3168', '672.7924', '905.8332', '0', '1', '1');

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
(1, 'JKB', '1', '1', '1', '101', '0'),
(2, ' ', ' ', ' ', ' ', ' ', ''),
(3, ' ', ' ', ' ', ' ', ' ', ''),
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
-- Estructura de tabla para la tabla `hoja1`
--

CREATE TABLE IF NOT EXISTS `hoja1` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hoja1`
--

INSERT INTO `hoja1` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', '1', 'PIN', '6', '0', '239.18', '-133.85', '18.61', '0.03', '0', '-0.01', '0', '1'),
(2, '2', '101', 'EHF', '2', 'SI_Apilado', '759.22', '206.82', '-16.76', '-179.95', '0.17', '-0.13', '230', '0.1'),
(3, '3', '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '758.1', '208.47', '-143.49', '0', '-0.05', '0.2', '205', '1'),
(4, '4', '4', 'PATTERN', '10', '0', '758.1024', '208.4736', '143.4872', '758.1024', '208.4736', '-143.4872', '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imanes_cope`
--

CREATE TABLE IF NOT EXISTS `imanes_cope` (
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
-- Volcado de datos para la tabla `imanes_cope`
--

INSERT INTO `imanes_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'LOC03', '1', '0', '195.76', '11.55', '-42.5', '-0.63', '0', '0', '0', '1', '1'),
(2, '2', 'LOC03', '1', '0', '544.48', '128.96', '-42.15', '-0.63', '0', '0', '0', '1', '1'),
(3, '3', 'LOC03', '1', '0', '723.33', '-178.7', '-43', '-0.63', '0', '0', '0', '1', '1'),
(4, '4', 'LOC03', '1', '0', '973.68', '106.82', '-42.13', '-0.63', '0', '0', '0', '1', '1'),
(5, '5', 'JKB', '2', '0', '-1510.32', '672.79', '905.83', '-0.02', '0', '-180', '90', '0.3', '1'),
(6, '6', 'PATTERN', '10', '0', '82.0203999999999', '493.2836', '234.4508', '1409.4736', '-472.628', '-232.4824', '0', '1', '1');

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
(1, 'JKB;', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
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
(1, 'imanes_cope', '1', '1', '1'),
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
-- Estructura de tabla para la tabla `pinprueba_cope`
--

CREATE TABLE IF NOT EXISTS `pinprueba_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pinprueba_cope`
--

INSERT INTO `pinprueba_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '40', '135.48', '350.12', '1.37', '16.74', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '40', '362.83', '349.67', '4.84', '16.74', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '40', '546.71', '348.21', '4.8', '16.74', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '40', '774.02', '346.78', '4.64', '16.74', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '40', '958.96', '345.15', '4.44', '16.74', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '40', '1185.48', '342.98', '5.98', '16.74', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '40', '1370.09', '341.88', '7.81', '16.74', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '40', '1596.31', '337.91', '7.09', '-112.44', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '40', '159.04', '107.75', '3.47', '0.01', '-0.01', '-0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '40', '386.45', '106.87', '2.6', '0.01', '-0.01', '-0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '40', '571.8', '106.01', '3.71', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '40', '798.86', '102.05', '-34.39', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '40', '983.92', '102.16', '3.57', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '40', '1211.85', '99.87', '4.88', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '40', '1395.7', '97.63', '6.87', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '40', '1620.4', '92.56', '5.66', '156.25', '-0.01', '-0.02', '0', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '1899.3752', '272.3284', '456.8608', '-124.304', '582.8688', '-454.6136', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebapines1_cope`
--

CREATE TABLE IF NOT EXISTS `pruebapines1_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pruebapines1_cope`
--

INSERT INTO `pruebapines1_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '40', '135.48', '350.12', '1.37', '16.74', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '40', '362.83', '349.67', '4.84', '16.74', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '40', '546.71', '348.21', '4.8', '16.74', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '40', '774.02', '346.78', '4.64', '16.74', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '40', '958.96', '345.15', '4.44', '16.74', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '40', '1185.48', '342.98', '5.98', '16.74', '0', '0', '0', '1', '1'),
(7, '7', 'PIN1', '6', '40', '1370.09', '341.88', '7.81', '16.74', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '40', '1596.31', '337.91', '7.09', '-112.44', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '40', '159.04', '107.75', '3.47', '0.01', '-0.01', '-0.01', '0', '1', '1'),
(10, '10', 'PIN1', '6', '40', '386.45', '106.87', '2.6', '0.01', '-0.01', '-0.01', '0', '1', '1'),
(11, '11', 'PIN1', '6', '40', '571.8', '106.01', '3.71', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(12, '12', 'PIN1', '6', '40', '798.86', '102.05', '-34.39', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(13, '13', 'PIN1', '6', '40', '983.92', '102.16', '3.57', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(14, '14', 'PIN1', '6', '40', '1211.85', '99.87', '4.88', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(15, '15', 'PIN1', '6', '40', '1395.7', '97.63', '6.87', '-1.78', '-0.01', '-0.01', '0', '1', '1'),
(16, '16', 'PIN1', '6', '40', '1617.4', '92.56', '5.66', '156.25', '-0.01', '-0.02', '0', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '1899.3752', '272.3284', '456.8608', '-124.304', '582.8688', '-454.6136', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebaservo_cope`
--

CREATE TABLE IF NOT EXISTS `pruebaservo_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pruebaservo_cope`
--

INSERT INTO `pruebaservo_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'EHF', '2', '0', '-205.28', '-1652.48', '1541.5', '-179.06', '0.09', '-179.81', '230', '0.1', '1'),
(2, '2', 'EHF', '2', '0', '-205.28', '-1652.48', '1541.5', '-179.06', '0.09', '-179.81', '230', '0.1', '1'),
(3, '3', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '-205.28', '-1652.48', '1541.5', '-179.06', '0.09', '-179.81', '200', '1', '1'),
(4, '4', 'kmx_21_rnd_8x5-7x10 sleeve', '3', '0', '-205.28', '-1652.48', '1541.5', '-179.06', '0.09', '-179.81', '200', '1', '1'),
(5, '5', 'kmx_21_tube_8x6 sleeve', '3', '0', '-205.28', '-1652.48', '1541.5', '-179.06', '0.09', '-179.81', '200', '1', '1'),
(6, '6', 'kmx_21_tube_8x6 sleeve', '3', '0', '-205.28', '-1652.48', '1541.5', '-179.06', '0.09', '-179.81', '200', '1', '1'),
(7, '7', 'PATTERN', '10', '0', '205.2764', '1652.4794', '1541.5028', '-205.2764', '-1652.4794', '1541.5028', '0', '1', '1');

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
(1, 'imanes_cope', '4', 'LOC03', '1', '0', '973.68', '106.82', '-42.13', '-0.63', '0', '0', '0', '', '0', '0', '3', '0', ' ', '0', '', '');

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
(1, '104', '0', ' ', ' ', ' ', '', '', '', '', ''),
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
(1, ''),
(2, 'imanes_cope'),
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
-- Estructura de tabla para la tabla `test032pattern_cope`
--

CREATE TABLE IF NOT EXISTS `test032pattern_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `test032pattern_cope`
--

INSERT INTO `test032pattern_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'epl_stl', '2', '0', '877.68', '220.1', '-28.49', '4.31', '0.03', '-0.02', '225', '0.3', '1'),
(2, '2', 'kmx_21_rnd_9x6-3x10 sleeve', '3', '0', '875.55', '221.86', '-163.19', '0', '-0.03', '0.06', '225', '1', '1'),
(3, '3', 'LOC09', '1', '0', '878.1', '221.48', '-65.03', '0.34', '0', '0', '0', '1', '1'),
(4, '4', 'kmx_2000_tube_9x6 sleeve', '3', '0', '877.86', '225.47', '-368.63', '13.41', '0.21', '-0.15', '225', '1', '1'),
(5, '5', 'PATTERN', '10', '0', '1890.959', '869.8856', '1058.9972', '-1890.959', '869.8856', '1058.9972', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testcamara_cope`
--

CREATE TABLE IF NOT EXISTS `testcamara_cope` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `testcamara_cope`
--

INSERT INTO `testcamara_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '40', '156.35', '108.35', '1.35', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '40', '981.28', '112.94', '2.75', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '40', '1364.94', '356.58', '4.52', '16.74', '0', '0', '0', '1', '1'),
(4, '4', 'epl_stl', '2', '0', '877.68', '220.1', '-28.49', '4.31', '0.03', '-0.02', '225', '0.3', '1'),
(5, '5', 'PATTERN', '10', '0', '1899.3752', '272.3284', '456.8608', '-124.304', '582.8688', '-454.6136', '0', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `whiterecipe`
--

INSERT INTO `whiterecipe` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '230', '0.3', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '230', '0.3', '1'),
(3, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(4, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(5, '102', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(6, '102', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(7, '7', 'PATTERN', '10', '0', '2430.986', '631.5236', '1133.2348', '2430.986', '631.5236', '1133.2348', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `yyyyyyy_cope`
--

CREATE TABLE IF NOT EXISTS `yyyyyyy_cope` (
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
-- Volcado de datos para la tabla `yyyyyyy_cope`
--

INSERT INTO `yyyyyyy_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'epl_stl', '2', 'SI_Apilado', '877.68', '220.1', '-28.49', '4.31', '0.03', '-0.02', '225', '0.3', '1'),
(2, '102', 'kmx_21_rnd_9x6-3x10 sleeve', '3', 'NO_Apilado', '875.55', '221.86', '-163.19', '0', '-0.03', '0.06', '225', '1', '1'),
(3, '3', 'LOC09', '1', '0', '878.1', '221.48', '-65.03', '0.34', '0', '0', '0', '1', '1'),
(4, '103', 'kmx_2000_tube_9x6 sleeve', '3', 'NO_Apilado', '877.86', '225.47', '-368.63', '13.41', '0.21', '-0.15', '225', '1', '1'),
(5, '5', 'SPRUE', '4', '0', '877.4', '-69.26', '-426.09', '0.11', '-0.01', '0', '124', '1', '1'),
(6, '6', 'PATTERN', '10', '0', '1890.959', '869.8856', '1058.9972', '-1890.959', '869.8856', '1058.9972', '0', '1', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
