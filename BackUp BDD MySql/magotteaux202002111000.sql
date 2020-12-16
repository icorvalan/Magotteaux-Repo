-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2020 a las 14:00:07
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6000969_cope`
--

INSERT INTO `6000969_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '69', '169.97', '162.79', '1.36', '0.45', '0', '-0.02', '0', '1', '1'),
(2, '2', 'PIN1', '6', '69', '387.77', '162.14', '5.2', '0.45', '0', '-0.02', '0', '1', '1'),
(3, '3', 'PIN1', '6', '69', '451.3', '161.7', '8.13', '0.45', '0', '-0.02', '0', '1', '1'),
(4, '4', 'PIN1', '6', '69', '554.82', '161.33', '7.83', '0.45', '0', '-0.02', '0', '1', '1'),
(5, '5', 'PIN1', '6', '69', '735.94', '159.13', '6.79', '0.19', '0', '-0.02', '0', '1', '1'),
(6, '6', 'PIN1', '6', '69', '838.66', '158.23', '8.31', '0.08', '0', '-0.01', '0', '1', '1'),
(7, '7', 'PIN1', '6', '69', '901.76', '158.49', '8.94', '0.08', '0', '-0.01', '0', '1', '1'),
(8, '8', 'PIN1', '6', '69', '1116.26', '155.56', '2.73', '0.29', '0', '-0.02', '0', '1', '1'),
(9, '9', 'PIN1', '6', '69', '224.7', '-62.99', '16.88', '-4.52', '0', '-0.02', '0', '1', '1'),
(10, '10', 'PIN1', '6', '69', '395.18', '-65.3', '17.04', '-4.52', '0', '-0.02', '0', '1', '1'),
(11, '101', 'epk', '2', 'SI_Apilado', '647.48', '-296.37', '-15.26', '91.69', '0.13', '-0.08', '180', '0.1', '1'),
(12, '101', 'epk', '2', 'SI_Apilado', '647.48', '84.41', '-15.72', '91.69', '0.13', '-0.08', '180', '0.1', '1'),
(13, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '644.31', '96.68', '-160.16', '17.65', '0.22', '-0.14', '178', '1', '1'),
(14, '102', 'kmx_2000_rnd_7x4-9x11 sleeve', '3', 'NO_Apilado', '644.31', '-289.86', '-161.08', '17.65', '0.22', '-0.14', '178', '1', '1'),
(15, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '644.21', '-285.98', '-359.46', '18.98', '0.28', '-0.22', '178', '1', '1'),
(16, '103', 'kmx_2000_tube_7x4 sleeve', '3', 'NO_Apilado', '644.09', '103.44', '-358.44', '18.98', '0.27', '-0.21', '178', '1', '1'),
(17, '17', 'PATTERN', '10', '0', '644.0884', '103.4416', '358.4396', '644.0884', '103.4416', '-358.4396', '0', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `blankrecipe`
--

INSERT INTO `blankrecipe` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '220', '0.3', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '220', '0.3', '1'),
(3, '102', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '200', '1', '1'),
(4, '102', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '200', '1', '1'),
(5, '5', 'PATTERN', '10', '0', '945.6156', '1652.5808', '1543.3348', '945.6156', '-1652.5808', '1543.3348', '0', '1', '1');

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
(1, 'EHF', '1', '5', '4', '101', '1'),
(2, 'kmx_21_tube_8x6 sleeve', '4', '1', '2', '102', '0'),
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
(1, 'kmx_21_tube_8x6 sleeve;', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ''),
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
(1, 'blankrecipe', '2', '1', '1'),
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
(1, 'blankrecipe', '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '220', '', 'EHF', '1', '5', '4', ' ', '1', '0.3', '');

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
(1, '101', '0', 'Abrir', ' ', ' ', '', '', '', '', ''),
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
(1, 'blankrecipe'),
(2, 'blankrecipe'),
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `whiterecipe`
--

INSERT INTO `whiterecipe` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '230', '0.3', '1'),
(2, '101', 'EHF', '2', 'SI_Apilado', '0', '0', '-1000', '0', '0', '0', '230', '0.3', '1'),
(3, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(4, '102', 'kmx_21_rnd_8x5-7x10 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(5, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(6, '103', 'kmx_21_tube_8x6 sleeve', '3', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '205', '0.1', '1'),
(7, '7', 'PATTERN', '10', '0', '2430.986', '631.5236', '1133.2348', '2430.986', '631.5236', '1133.2348', '0', '1', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
