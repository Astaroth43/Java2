-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2015 a las 04:23:15
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `jmasters`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `SEXO` enum('Masculino','Femenino') NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `TELEFONO` varchar(10) NOT NULL,
  `RFC` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID`, `NOMBRE`, `APELLIDO`, `SEXO`, `DIRECCION`, `TELEFONO`, `RFC`) VALUES
(1, 'Miguel Angel', 'Silva Martínez', 'Masculino', 'García Diego 735', '8333954', '1234'),
(2, 'Juan', 'Perez', 'Masculino', 'Damian Carmona 564', '8124455', '1234'),
(3, 'Quitnin', 'Quintin', 'Masculino', 'Direccion', 'telefono', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desc_venta`
--

CREATE TABLE IF NOT EXISTS `desc_venta` (
  `ID_VENTA` int(4) NOT NULL,
  `ID_PRODUCTO` int(4) NOT NULL,
  `CANTIDAD` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `desc_venta`
--

INSERT INTO `desc_venta` (`ID_VENTA`, `ID_PRODUCTO`, `CANTIDAD`) VALUES
(1, 1, 1),
(1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `SEXO` enum('Masculino','Femenino') NOT NULL,
  `SALARIO` float NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `TELEFONO` varchar(10) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID`, `NOMBRE`, `APELLIDO`, `SEXO`, `SALARIO`, `DIRECCION`, `TELEFONO`, `RFC`) VALUES
(1, 'Pedro', 'Ramirez', 'Masculino', 5000, 'Urbano Villalon', '8176522', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `TIPO` enum('Computadoras','Accesorios','Consumibles','Servicios') NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `PRECIO` float NOT NULL,
  `CANTIDAD` int(10) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `TIPO`, `NOMBRE`, `PRECIO`, `CANTIDAD`, `DESCRIPCION`) VALUES
(1, 'Computadoras', 'Hp Notebook', 5000, 28, 'Texto simple'),
(2, 'Computadoras', 'Alienware Z32', 25360.6, 35, 'holi'),
(3, 'Computadoras', 'prueba', 1, 1, '-'),
(4, 'Computadoras', 'prueba', 10, 10, '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int(4) NOT NULL,
  `ID_EMPLEADO` int(4) NOT NULL,
  `FECHA` varchar(20) NOT NULL,
  `HORA` varchar(20) NOT NULL,
  `TOTAL` float NOT NULL,
  `TIPO_PAGO` enum('Contado','Tarjeta','Anticipo (50%)','30 dias','Otro') NOT NULL,
  `DESC_PAGO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`,`ID_EMPLEADO`),
  KEY `ID_EMPLEADO` (`ID_EMPLEADO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`ID`, `ID_CLIENTE`, `ID_EMPLEADO`, `FECHA`, `HORA`, `TOTAL`, `TIPO_PAGO`, `DESC_PAGO`) VALUES
(1, 1, 1, '23/04/2015', '00:16:49', 55721.2, 'Otro', 'A');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
