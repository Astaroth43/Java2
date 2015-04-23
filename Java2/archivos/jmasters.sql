-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2015 a las 01:37:10
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

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
`ID` int(4) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `SEXO` enum('Masculino','Femenino') NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `TELEFONO` varchar(10) NOT NULL,
  `RFC` varchar(30) NOT NULL
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
  `ID` int(4) NOT NULL,
  `ID_PRODUCTO` int(4) NOT NULL,
  `CANTIDAD` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
`ID` int(4) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `SEXO` enum('Masculino','Femenino') NOT NULL,
  `SALARIO` float NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `TELEFONO` varchar(10) NOT NULL,
  `RFC` varchar(20) NOT NULL
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
`ID` int(4) NOT NULL,
  `TIPO` enum('Computadoras','Accesorios','Consumibles','Servicios') NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `PRECIO` float NOT NULL,
  `CANTIDAD` int(10) NOT NULL,
  `DESCRIPCION` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `TIPO`, `NOMBRE`, `PRECIO`, `CANTIDAD`, `DESCRIPCION`) VALUES
(1, 'Computadoras', 'Hp Notebook', 5000, 5, 'Texto simple'),
(2, 'Computadoras', 'asdfasdf', 123.4, 123, 'holi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
`ID` int(4) NOT NULL,
  `ID_CLIENTE` int(4) NOT NULL,
  `ID_EMPLEADO` int(4) NOT NULL,
  `FECHA` varchar(20) NOT NULL,
  `HORA` varchar(20) NOT NULL,
  `TOTAL` float NOT NULL,
  `TIPO_PAGO` enum('Contado','50% Anticipo','30 días','Otro') NOT NULL,
  `DESC_PAGO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`ID`), ADD KEY `ID_CLIENTE` (`ID_CLIENTE`,`ID_EMPLEADO`), ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
