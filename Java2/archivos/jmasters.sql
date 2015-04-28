-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2015 a las 02:07:18
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
(1, 'MIGUEL ANGEL', 'SILVA MARTINEZ', 'Masculino', 'DIRECCION DE MIKE #343', '4441023658', 'RFCMIKE'),
(2, 'GERARDO', 'FRANCO DELGADO', 'Masculino', 'DIRECCION DE GERARDO #853', '4441365201', 'RFCGERAS52'),
(3, 'OSCAR EMMANUEL', 'GONZALEZ HERNANDEZ', 'Masculino', 'DIRECCION DE OSCAR #631', '85410236', 'RFCOSCAR87');

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
(1, 5, 1),
(2, 5, 1),
(2, 6, 1),
(3, 5, 1),
(3, 7, 3),
(3, 6, 1),
(4, 3, 1),
(4, 4, 1),
(4, 6, 1),
(4, 9, 2),
(4, 10, 2),
(4, 12, 2),
(4, 5, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID`, `NOMBRE`, `APELLIDO`, `SEXO`, `SALARIO`, `DIRECCION`, `TELEFONO`, `RFC`) VALUES
(1, 'AGUSTIN IRVIN', 'GARCIA PEREZ', 'Masculino', 35000, 'DIRECCION DE AGUS #345', '4445920152', 'RFCAGUS32'),
(2, 'ANGELICA XIMENA', 'COETO DAVILA', 'Femenino', 15000, 'DIRECCION DE XIME #123', '84520126', 'RFCXIME78'),
(3, 'BRENDA', 'CORONADO PEDRAZA', 'Femenino', 15000, 'DIRECCION DE BRENDA #65', '4441025698', 'RFCBRENDA65');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `TIPO` enum('Computadoras','Accesorios','Consumibles','Servicios') NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `PRECIO` float(10,2) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `DESCRIPCION` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `TIPO`, `NOMBRE`, `PRECIO`, `CANTIDAD`, `DESCRIPCION`) VALUES
(1, 'Computadoras', 'ALIENWARE Z21', 32515.78, 12, 'INTEL CORE I5\n128 SDD\n8GB RAM'),
(2, 'Computadoras', 'HP G4286-LA', 17500.00, 15, '4GB RAM\n750 HDD\nCORE I5'),
(3, 'Computadoras', 'ACER R432-2', 10320.00, 14, '2GB RAM\n500 HDD\nCORE I3'),
(4, 'Accesorios', 'BEATS STUDIO', 8513.00, 19, 'AUDIFONOS BEATS STUDIO \nBY DR. DRE \nCOLOR AZUL'),
(5, 'Accesorios', 'VENTILADOR LAPTOP', 760.00, 19, 'VENTILADOR PARA LAPTOP 15" CON BASE'),
(6, 'Accesorios', 'RAZER GAMING MOUSE X32', 2500.00, 14, 'MOUSE RAZER 4000DPI'),
(7, 'Consumibles', 'HOJAS BLANCAS 500 PZ', 200.00, 47, 'PAQUETE DE 500 HOJAS BLANCAS'),
(8, 'Consumibles', 'TINTA NEGRA EPSON 32', 750.00, 20, 'TINTA NEGRA 70ML MARCA EPSON'),
(9, 'Consumibles', 'AIRE COMPRIMIDO', 80.00, 48, 'AIRE COMPRIMIDO 200ML'),
(10, 'Servicios', 'FORMATEO PC', 250.00, NULL, 'FORMATEO COMPLETO DE PC\nINCLUYE INSTALACION DE SO'),
(11, 'Servicios', 'MANTENIMIENTO PC', 500.00, NULL, 'MANTENIMIENTO PREVENTIVO Y CORRECTIVO PC'),
(12, 'Servicios', 'INSTALACION SO', 200.00, NULL, 'INSTALACION DE SO ELEGIDO POR EL USUARIO');

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
  `TOTAL` float(10,2) NOT NULL,
  `TIPO_PAGO` enum('Contado','Anticipo (50%)','30 dias','Otro') NOT NULL,
  `DESC_PAGO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`,`ID_EMPLEADO`),
  KEY `ID_EMPLEADO` (`ID_EMPLEADO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`ID`, `ID_CLIENTE`, `ID_EMPLEADO`, `FECHA`, `HORA`, `TOTAL`, `TIPO_PAGO`, `DESC_PAGO`) VALUES
(1, 1, 1, '27/04/2015', '18:40:36', 36936.12, 'Contado', 'NULL'),
(2, 3, 3, '27/04/2015', '18:43:49', 3716.40, 'Anticipo (50%)', 'NULL'),
(3, 1, 2, '27/04/2015', '18:44:47', 4477.60, 'Otro', 'Tarjeta'),
(4, 2, 1, '27/04/2015', '18:47:45', 29360.87, '30 dias', 'NULL');

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
