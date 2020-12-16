-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2020 a las 12:50:50
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `magotteaux`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `564_cope`
--

CREATE TABLE `564_cope` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `564_cope`
--

INSERT INTO `564_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '-3999.9744', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `15987`
--

CREATE TABLE `15987` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `24500_cope` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `61782` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `696969` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6000210` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6000365` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6000535` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6000733` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6000758_cope` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6000782` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `6001131` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `6001152`
--

CREATE TABLE `6001152` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6001152`
--

INSERT INTO `6001152` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '20', '118.73', '-571.55', '-24.03', '-34.65', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '20', '189.75', '-406.89', '-23.47', '39', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '20', '198.17', '-331.14', '-24.07', '39', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '20', '136.98', '-180.83', '-25.33', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '20', '526.74', '-183.34', '-29.21', '0', '0', '0', '0', '1', '-500'),
(6, '6', 'PIN1', '6', '20', '580.91', '-409.76', '-23.49', '0', '0', '0', '0', '1', '-500'),
(7, '7', 'PIN1', '6', '20', '588.76', '-333.71', '-24.14', '0', '0', '0', '0', '1', '1'),
(8, '8', 'PIN1', '6', '20', '508.89', '-573.02', '-22.31', '0', '0', '0', '0', '1', '1'),
(9, '9', 'PIN1', '6', '20', '784.8', '-574.69', '-25.78', '-33.66', '0', '0', '0', '1', '1'),
(10, '10', 'PIN1', '6', '20', '856.26', '-409.97', '-25.82', '32.21', '0', '0', '0', '1', '1'),
(11, '11', 'PIN1', '6', '20', '864.46', '-334.09', '-26.5', '32.21', '0', '0', '0', '1', '1'),
(12, '12', 'PIN1', '6', '20', '803.06', '-184.6', '-31.87', '0', '0', '0', '0', '1', '1'),
(13, '13', 'PIN1', '6', '20', '1191.77', '-188.77', '-35.9', '-65', '0', '0', '0', '1', '1'),
(14, '14', 'PIN1', '6', '20', '1254.13', '-339.45', '-30.01', '-65', '0', '0', '0', '1', '1'),
(15, '15', 'PIN1', '6', '20', '1246.48', '-415.16', '-29.29', '-65', '0', '0', '0', '1', '1'),
(16, '16', 'PIN1', '6', '20', '1172.92', '-579.46', '-30.43', '-133.33', '0', '0', '0', '1', '1'),
(17, '101', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '353.58', '-503.85', '-142.29', '0', '0', '0', '150', '1', '1'),
(18, '101', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '1020.48', '-507.83', '-148.38', '0', '0', '0', '150', '1', '1'),
(19, '19', 'SPRUE', '4', 'SPRUE', '689.81', '-764.63', '-189.03', '0', '0', '0', '124', '1', '1'),
(20, '20', 'LID08', '8', 'Tapa 1', '351.24', '-504.95', '-226.34', '0', '0', '0', '0', '1', '1'),
(21, '21', 'LID08', '8', 'Tapa 1', '1016.38', '-506.81', '-235.35', '0', '0', '0', '0', '1', '1'),
(22, '22', 'PATTERN', '10', 'DimencionesPattern', '1452.43', '931.49', '282.5', '-89.85', '92.95', '-283.15', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6004799`
--

CREATE TABLE `6004799` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6004799`
--

INSERT INTO `6004799` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', 'NUMERODEC', '665.815', '-432.076', '-105.024', '0', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', 'NUMEROUNID', '641.8', '-429.25', '-87.71', '0', '0', '0', '0', '1', '1'),
(3, '3', 'NUMDEC', '5', 'NUMERODEC', '1529.44', '-421.847', '-118.006', '0', '0', '0', '0', '1', '1'),
(4, '4', 'NUMUNID', '5', 'SI_Apilado', '1530.4', '-417.86', '-97.36', '0', '0', '0', '0', '1', '1'),
(5, '101', 'EJY', '2', 'SI_Apilado', '1366.71', '-347.49', '-114.54', '-0.98', '0', '0', '280', '0.3', '-500'),
(6, '101', 'EJY', '2', 'SI_Apilado', '473.67', '-356.31', '-106.07', '0', '0', '0', '280', '0.3', '-500'),
(7, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '1367.64', '-345.95', '-230.46', '0', '0', '0', '225', '1', '1'),
(8, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '474.66', '-354.02', '-218.71', '0', '0', '0', '225', '1', '1'),
(9, '9', 'LOC06', '1', 'LOC01', '1367.64', '-343', '-129.66', '0', '0', '0', '0', '1', '1'),
(10, '10', 'LOC06', '1', 'LOC02', '474.66', '-354.02', '-138.28', '0', '0', '0', '0', '1', '1'),
(11, '11', 'SPRUE', '4', 'SPRUE', '925.54', '-553.04', '-368.57', '0', '0', '0', '124', '1', '1'),
(12, '12', 'LID03', '8', 'Tapa 2', '1364.64', '-342.95', '-374.92', '0', '0', '0', '193', '1', '1'),
(13, '13', 'LID03', '8', 'Tapa 3', '471.66', '-351.02', '-363.35', '0', '0', '0', '193', '1', '1'),
(14, '14', 'PATTERN', '10', 'DimencionesPattern', '1918.31', '763.74', '457.59', '-81.52', '69.94', '-445.65', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6004895`
--

CREATE TABLE `6004895` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6004895`
--

INSERT INTO `6004895` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'VSAA', '2', 'Core1', '0', '0', '-300', '0', '0', '0', '152', '0.3', '1'),
(2, '2', 'VSAA', '2', 'Core2', '0', '0', '-300', '0', '0', '0', '152', '0.3', '1'),
(3, '3', '7x3.5x8 ND sleeve', '3', 'Sleeve1', '0', '0', '-300', '0', '0', '0', '177.8', '1', '1'),
(4, '4', '7x3.5x8 ND sleeve', '3', 'Sleeve2', '0', '0', '-300', '0', '0', '0', '177.8', '1', '1'),
(5, '5', 'LOC06', '1', 'LOC1', '0', '0', '-300', '0', '0', '0', '0', '1', '-500'),
(6, '6', 'LOC06', '1', 'LOC2', '0', '0', '-300', '0', '0', '0', '0', '1', '-500'),
(7, '7', 'SPRUE', '4', 'Sprue', '0', '0', '-300', '0', '0', '0', '125', '1', '1'),
(8, '0', 'PATTERN', '10', 'DimencionesPattern', '10', '20', '30', '-1', '-2', '-3', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6005088`
--

CREATE TABLE `6005088` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6005088`
--

INSERT INTO `6005088` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '140.3', '-307.25', '-80', '-49.988', '0', '0', '0', '1', '1'),
(2, '2', 'NUMUNID', '5', '0', '1426.65', '-317.11', '-80.74', '-50.56', '0', '0', '0', '1', '1'),
(3, '101', 'EHS', '2', 'SI_Apilado', '1416.71', '-500.41', '-57.59', '-176.58', '0', '0', '200', '0.1', '1'),
(4, '101', 'EHS', '2', 'SI_Apilado', '865.25', '-497.41', '-50.42', '-179.76', '0', '0', '200', '0.1', '1'),
(5, '101', 'EHS', '2', 'SI_Apilado', '389.58', '-499.67', '-44.24', '-175.16', '0', '0', '200', '0.1', '-500'),
(6, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '1417.98', '-500.97', '-171.75', '0', '0', '0', '230', '1', '-500'),
(7, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '867.76', '-495.5', '-163.354', '0', '0', '0', '230', '1', '1'),
(8, '102', '9x6.3x10 ND sleeve', '3', 'NO_Apilado', '390.62', '-499.78', '-156.247', '0', '0', '0', '230', '1', '1'),
(9, '9', 'LOC06', '1', '0', '1417.98', '-500.97', '-78.9', '0', '0', '0', '0', '1', '1'),
(10, '10', 'LOC06', '1', '0', '867.76', '-495.5', '-69.82', '0', '0', '0', '0', '1', '1'),
(11, '11', 'LOC06', '1', '0', '390.62', '-499.78', '-64.62', '0', '0', '0', '0', '1', '1'),
(12, '12', 'Sprue', '4', '0', '1137.37', '-810.95', '-264.66', '0', '0', '0', '124', '1', '1'),
(13, '13', 'LID04', '8', '0', '1414.98', '-497.97', '-313.35', '0', '0', '0', '124', '1', ''),
(14, '14', 'LID04', '8', '0', '867.76', '-495.5', '-306.41', '0', '0', '0', '124', '1', '1'),
(15, '15', 'LID04', '8', '0', '390.62', '-499.78', '-297.81', '0', '0', '0', '124', '1', '1'),
(16, '16', 'PATTERN', '10', '10', '1869.1', '1065.62', '349.01', '-93.66', '109.88', '-349.01', '1', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6005088d`
--

CREATE TABLE `6005088d` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6005088d`
--

INSERT INTO `6005088d` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'emk_eml_gate_core_assembly', '2', 'SI_Apilado', '1396.49', '-313.69', '-233.5', '0', '0', '0', '80', '0.05', '1'),
(2, '101', 'emk_eml_gate_core_assembly', '2', 'SI_Apilado', '894.01', '-313.69', '-225.67', '0', '0', '0', '80', '0.05', '1'),
(3, '101', 'emk_eml_gate_core_assembly', '2', 'SI_Apilado', '393.04', '-314.3', '-216.35', '0', '0', '0', '80', '0.05', '1'),
(4, '4', 'PATTERN', '10', 'DimencionesPattern', '1872.85', '1048.07', '335.7', '-97.4', '92.99', '-305.86', '0', '1', '1'),
(5, '5', 'Dowel', '9', 'Dowel', '1149.1', '-542.08', '-335.7', '0', '0', '0', '0', '1', '1'),
(6, '6', 'Dowel', '9', 'Dowel', '652.67', '-542.08', '-335.7', '0', '0', '0', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `6500256`
--

CREATE TABLE `6500256` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `6500256`
--

INSERT INTO `6500256` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMUNID', '5', '0', '-4000', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `12345678i9o0_drag`
--

CREATE TABLE `12345678i9o0_drag` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `12345678i9o0_drag`
--

INSERT INTO `12345678i9o0_drag` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '-4000', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ab2149`
--

CREATE TABLE `ab2149` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ab2149`
--

INSERT INTO `ab2149` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '101', 'CLR', '2', 'SI_Apilado', '487.81', '-503.96', '-31.5', '-1.26', '0', '0', '189', '0.3', '1'),
(2, '102', '6x4x8 ND sleeve', '3', 'NO_Apilado', '490.45', '-495.7', '-122.2', '0', '0', '0', '155', '1', '1'),
(3, '3', 'LOC03', '1', 'Localizador 1', '490.45', '-495.7', '-49.44', '0', '0', '0', '0', '1', '1'),
(4, '103', '6x6 Tube -HB6 sleeve', '3', 'NO_Apilado', '490.45', '-495.7', '-298.82', '0', '0', '0', '155', '1', '1'),
(5, '5', 'LID07', '8', 'TAPA', '487.45', '-491.7', '-388.66', '0', '0', '0', '123', '1', '-500'),
(6, '6', 'PATTERN', '10', 'DimencionesPattern', '1106.67', '788.33', '479.82', '-142.72', '67.54', '-484.97', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ab4058`
--

CREATE TABLE `ab4058` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ab4058`
--

INSERT INTO `ab4058` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '27', '230.11', '-83.95', '-9.69', '-63.65', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '27', '337.04', '-84.93', '-11.51', '-51.11', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '27', '390.59', '-179.57', '-10.22', '-57.82', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '27', '174.77', '-176.95', '-8.92', '-45.41', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '27', '228.19', '-271.38', '-8.61', '-29', '0', '0', '0', '1', '1'),
(6, '6', 'PIN1', '6', '27', '336.17', '-272.6', '-8.33', '-40.45', '0', '0', '0', '1', '1'),
(7, '7', 'CSL', '2', '0', '383.5', '-240.57', '-22.43', '0', '0', '0', '93', '0.19', '1'),
(8, '8', 'CSL', '2', '0', '285.04', '-65.15', '-23.88', '0', '0', '0', '93', '0.19', '1'),
(9, '9', 'CSL', '2', '0', '182.12', '-239.03', '-19.97', '0', '0', '0', '93', '0.19', '1'),
(10, '10', 'AB sleeve', '3', '0', '386.15', '-239.22', '-141.49', '0', '0', '0', '99', '1', '1'),
(11, '11', 'AB sleeve', '3', '0', '288.41', '-64.61', '-144.17', '0', '0', '0', '99', '1', '1'),
(12, '12', 'AB sleeve', '3', '0', '185.59', '-239.4', '-140.14', '0', '0', '0', '99', '1', '1'),
(13, '13', 'LOC01', '1', '0', '382.58', '-236.23', '-18.25', '0', '0', '0', '0', '1', '1'),
(14, '14', 'LOC01', '1', '0', '284.85', '-60.56', '-20.98', '0', '0', '0', '0', '1', '1'),
(15, '15', 'LOC01', '1', '0', '181.57', '-224.01', '-17.01', '0', '0', '0', '0', '1', '1'),
(16, '16', 'SPRUE', '4', '0', '281.05', '-419.7', '-145.78', '0', '0', '0', '124', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asddx_cope`
--

CREATE TABLE `asddx_cope` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asddx_cope`
--

INSERT INTO `asddx_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN', '6', '2', '-4000', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bddin_r2`
--

CREATE TABLE `bddin_r2` (
  `ID` bigint(20) NOT NULL,
  `Tipo` varchar(255) NOT NULL,
  `X` varchar(255) NOT NULL,
  `Y` varchar(255) NOT NULL,
  `Z` varchar(255) NOT NULL,
  `A` varchar(255) NOT NULL,
  `B` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `NumEntidad` varchar(255) NOT NULL,
  `Segmento` varchar(255) NOT NULL,
  `Insertar/Sacar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `dgdfg_cope`
--

CREATE TABLE `dgdfg_cope` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dgdfg_cope`
--

INSERT INTO `dgdfg_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '-3999.9744', '-4000', '-4000', '-4000', '-4000', '-4000', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '4000', '4000', '4000', '-4000', '-4000', '-4000', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_pallet`
--

CREATE TABLE `global_pallet` (
  `ID` bigint(20) NOT NULL,
  `Core` varchar(255) NOT NULL,
  `Pallet` varchar(255) NOT NULL,
  `Segmento` varchar(255) NOT NULL,
  `Cantidad` varchar(255) NOT NULL,
  `Codificacion` varchar(255) NOT NULL,
  `EsApilado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `global_pallet`
--

INSERT INTO `global_pallet` (`ID`, `Core`, `Pallet`, `Segmento`, `Cantidad`, `Codificacion`, `EsApilado`) VALUES
(1, 'EHF', '1', '5', '4', '101', '1'),
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
-- Estructura de tabla para la tabla `pallet_1`
--

CREATE TABLE `pallet_1` (
  `ID` bigint(20) NOT NULL,
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
  `P9` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pallet_2` (
  `ID` bigint(20) NOT NULL,
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
  `P9` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pallet_3` (
  `ID` bigint(20) NOT NULL,
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
  `P9` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pallet_4` (
  `ID` bigint(20) NOT NULL,
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
  `P9` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pallet_5` (
  `ID` bigint(20) NOT NULL,
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
  `P9` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pallet_6` (
  `ID` bigint(20) NOT NULL,
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
  `P9` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pattern_produccion` (
  `ID` bigint(20) NOT NULL,
  `ID Pattern` varchar(255) NOT NULL,
  `Conteo Produccion` varchar(255) NOT NULL,
  `Limite Produccion` varchar(255) NOT NULL,
  `Sprue Position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pattern_produccion`
--

INSERT INTO `pattern_produccion` (`ID`, `ID Pattern`, `Conteo Produccion`, `Limite Produccion`, `Sprue Position`) VALUES
(1, '6000758_cope', '0', '1', '1'),
(2, 'whiterecipe', '0', '1', '1'),
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
-- Estructura de tabla para la tabla `qwerty_cope`
--

CREATE TABLE `qwerty_cope` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `qwerty_cope`
--

INSERT INTO `qwerty_cope` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'NUMDEC', '5', '0', '1342.9476', '400.7168', '689.372', '107.5848', '-6.07999999999993', '178.2944', '0', '1', '1'),
(2, '2', 'PATTERN', '10', '0', '9875', '400.7168', '689.372', '107.5848', '-6.07999999999993', '178.2944', '0', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_actualproduction`
--

CREATE TABLE `ram_actualproduction` (
  `ID` bigint(20) NOT NULL,
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
  `Sprue Exist` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_actualproduction`
--

INSERT INTO `ram_actualproduction` (`ID`, `Pattern`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Core`, `Pallet`, `Segmento`, `Cantidad`, `Codificacion`, `EsApilado`, `PorctCoreDetection`, `Sprue Exist`) VALUES
(1, '6000758_cope', '6', 'PATTERN', '10', '0', '760.6656', '206.9928', '23.0816', '760.6656', '206.9928', '-23.0816', '0', '', 'EHF', '1', '5', '4', ' ', '1', '0.1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_localizadores`
--

CREATE TABLE `ram_localizadores` (
  `ID` bigint(20) NOT NULL,
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
  `N12` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `ram_numeros` (
  `ID` bigint(20) NOT NULL,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL,
  `N9` varchar(255) NOT NULL,
  `N10` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_numeros`
--

INSERT INTO `ram_numeros` (`ID`, `N1`, `N2`, `N3`, `N4`, `N5`, `N6`, `N7`, `N8`, `N9`, `N10`) VALUES
(1, '106', '0', ' ', ' ', ' ', '', '', '', '', ''),
(2, 'Ultimo Cmd BDD R1', 'Cambio de Pattern', ' ', ' ', ' ', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram_patternproductionline`
--

CREATE TABLE `ram_patternproductionline` (
  `ID` bigint(20) NOT NULL,
  `PatterInConveyor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ram_patternproductionline`
--

INSERT INTO `ram_patternproductionline` (`ID`, `PatterInConveyor`) VALUES
(1, ''),
(2, '6000758_cope'),
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

CREATE TABLE `ram_sprues` (
  `ID` bigint(20) NOT NULL,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `ram_tapas` (
  `ID` bigint(20) NOT NULL,
  `N1` varchar(255) NOT NULL,
  `N2` varchar(255) NOT NULL,
  `N3` varchar(255) NOT NULL,
  `N4` varchar(255) NOT NULL,
  `N5` varchar(255) NOT NULL,
  `N6` varchar(255) NOT NULL,
  `N7` varchar(255) NOT NULL,
  `N8` varchar(255) NOT NULL,
  `N9` varchar(255) NOT NULL,
  `N10` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `whiterecipe` (
  `ID` bigint(20) NOT NULL,
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
  `Altura Patron Entidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `whiterecipe`
--

INSERT INTO `whiterecipe` (`ID`, `RamCodificacion`, `Cod Core`, `Entidad_ID`, `Profundidad Agujero`, `Ref Pos X`, `Ref Pos Y`, `Ref Pos Z`, `Ref Pos A`, `Ref Pos B`, `Ref Pos C`, `DiametroTomaCore[mm]`, `PorcentajeDeteccion Core`, `Altura Patron Entidad`) VALUES
(1, '1', 'PIN1', '6', '66', '239.43', '326.85', '5.46', '0', '0', '0', '0', '1', '1'),
(2, '2', 'PIN1', '6', '66', '264.87', '97.4', '2.62', '0', '0', '0', '0', '1', '1'),
(3, '3', 'PIN1', '6', '66', '241.49', '-141.01', '2.7', '0', '0', '0', '0', '1', '1'),
(4, '4', 'PIN1', '6', '66', '267.34', '-370.03', '-1.53', '0', '0', '0', '0', '1', '1'),
(5, '5', 'PIN1', '6', '66', '531.22', '-369.51', '0.95', '0', '0', '0', '0', '1', '1'),
(6, '101', 'EHF', '2', 'NO_Apilado', '0', '0', '-1000', '0', '0', '0', '230', '0.1', '1'),
(7, '7', 'PATTERN', '10', '0', '2430.986', '631.5236', '1133.2348', '2430.986', '631.5236', '1133.2348', '0', '1', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `564_cope`
--
ALTER TABLE `564_cope`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `15987`
--
ALTER TABLE `15987`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `24500_cope`
--
ALTER TABLE `24500_cope`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `61782`
--
ALTER TABLE `61782`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `696969`
--
ALTER TABLE `696969`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6000210`
--
ALTER TABLE `6000210`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6000365`
--
ALTER TABLE `6000365`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6000535`
--
ALTER TABLE `6000535`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6000733`
--
ALTER TABLE `6000733`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6000758_cope`
--
ALTER TABLE `6000758_cope`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6000782`
--
ALTER TABLE `6000782`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6001131`
--
ALTER TABLE `6001131`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6001152`
--
ALTER TABLE `6001152`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6004799`
--
ALTER TABLE `6004799`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6004895`
--
ALTER TABLE `6004895`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6005088`
--
ALTER TABLE `6005088`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6005088d`
--
ALTER TABLE `6005088d`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `6500256`
--
ALTER TABLE `6500256`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `12345678i9o0_drag`
--
ALTER TABLE `12345678i9o0_drag`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ab2149`
--
ALTER TABLE `ab2149`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ab4058`
--
ALTER TABLE `ab4058`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `asddx_cope`
--
ALTER TABLE `asddx_cope`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `bddin_r2`
--
ALTER TABLE `bddin_r2`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `dgdfg_cope`
--
ALTER TABLE `dgdfg_cope`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `global_pallet`
--
ALTER TABLE `global_pallet`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pallet_1`
--
ALTER TABLE `pallet_1`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pallet_2`
--
ALTER TABLE `pallet_2`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pallet_3`
--
ALTER TABLE `pallet_3`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pallet_4`
--
ALTER TABLE `pallet_4`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pallet_5`
--
ALTER TABLE `pallet_5`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pallet_6`
--
ALTER TABLE `pallet_6`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pattern_produccion`
--
ALTER TABLE `pattern_produccion`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `qwerty_cope`
--
ALTER TABLE `qwerty_cope`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ram_actualproduction`
--
ALTER TABLE `ram_actualproduction`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ram_localizadores`
--
ALTER TABLE `ram_localizadores`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ram_numeros`
--
ALTER TABLE `ram_numeros`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ram_patternproductionline`
--
ALTER TABLE `ram_patternproductionline`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ram_sprues`
--
ALTER TABLE `ram_sprues`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ram_tapas`
--
ALTER TABLE `ram_tapas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `whiterecipe`
--
ALTER TABLE `whiterecipe`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `564_cope`
--
ALTER TABLE `564_cope`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `15987`
--
ALTER TABLE `15987`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `24500_cope`
--
ALTER TABLE `24500_cope`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `61782`
--
ALTER TABLE `61782`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `696969`
--
ALTER TABLE `696969`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `6000210`
--
ALTER TABLE `6000210`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `6000365`
--
ALTER TABLE `6000365`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `6000535`
--
ALTER TABLE `6000535`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `6000733`
--
ALTER TABLE `6000733`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `6000758_cope`
--
ALTER TABLE `6000758_cope`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `6000782`
--
ALTER TABLE `6000782`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `6001131`
--
ALTER TABLE `6001131`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `6001152`
--
ALTER TABLE `6001152`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `6004799`
--
ALTER TABLE `6004799`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `6004895`
--
ALTER TABLE `6004895`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `6005088`
--
ALTER TABLE `6005088`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `6005088d`
--
ALTER TABLE `6005088d`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `6500256`
--
ALTER TABLE `6500256`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `12345678i9o0_drag`
--
ALTER TABLE `12345678i9o0_drag`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ab2149`
--
ALTER TABLE `ab2149`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ab4058`
--
ALTER TABLE `ab4058`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `asddx_cope`
--
ALTER TABLE `asddx_cope`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bddin_r2`
--
ALTER TABLE `bddin_r2`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `dgdfg_cope`
--
ALTER TABLE `dgdfg_cope`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `global_pallet`
--
ALTER TABLE `global_pallet`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `pallet_1`
--
ALTER TABLE `pallet_1`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pallet_2`
--
ALTER TABLE `pallet_2`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pallet_3`
--
ALTER TABLE `pallet_3`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pallet_4`
--
ALTER TABLE `pallet_4`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pallet_5`
--
ALTER TABLE `pallet_5`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pallet_6`
--
ALTER TABLE `pallet_6`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pattern_produccion`
--
ALTER TABLE `pattern_produccion`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `qwerty_cope`
--
ALTER TABLE `qwerty_cope`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ram_actualproduction`
--
ALTER TABLE `ram_actualproduction`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ram_localizadores`
--
ALTER TABLE `ram_localizadores`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ram_numeros`
--
ALTER TABLE `ram_numeros`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ram_patternproductionline`
--
ALTER TABLE `ram_patternproductionline`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ram_sprues`
--
ALTER TABLE `ram_sprues`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ram_tapas`
--
ALTER TABLE `ram_tapas`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `whiterecipe`
--
ALTER TABLE `whiterecipe`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
