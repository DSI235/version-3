-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2017 a las 00:54:16
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendav2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `idbitacora` int(11) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `IdCompra` int(100) NOT NULL,
  `Fecha` datetime NOT NULL,
  `IdProveedor` int(100) NOT NULL,
  `IdSucursal` int(100) NOT NULL,
  `TipoCompra` char(1) CHARACTER SET latin1 NOT NULL,
  `NumDocumento` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Subtotal` double NOT NULL,
  `IVA` double NOT NULL,
  `Percepcion` double NOT NULL,
  `Total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `IdCompra` int(100) NOT NULL,
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Cantidad` double NOT NULL,
  `CostoUnitario` double NOT NULL,
  `IdSucursal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `IdVenta` int(100) NOT NULL,
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Cantidad` double NOT NULL,
  `PrecioUnitario` double NOT NULL,
  `IdSucursal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`IdVenta`, `CodBarra`, `Cantidad`, `PrecioUnitario`, `IdSucursal`) VALUES
(1, '001', 2, 2.3333, 1),
(2, '001', 1, 2.3333, 1),
(2, '002', 1, 0.4667, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `IdSucursal` int(100) NOT NULL,
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Cantidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`IdSucursal`, `CodBarra`, `Cantidad`) VALUES
(1, '001', 81),
(1, '002', 83),
(1, '003', 100),
(1, '004', 100),
(1, '005', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `IdParametro` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Valor` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`IdParametro`, `Nombre`, `Valor`) VALUES
(1, 'iva', '0.13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodBarra`, `Nombre`, `Costo`) VALUES
('001', 'coca grande 2.5 lit', 1.75),
('002', 'Barra margarina grande', 0.35),
('003', 'diana pequeña', 0.15),
('004', 'amp 600ml', 0.9),
('005', 'raptor 600ml', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `IdProveedor` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Telefono` varchar(9) CHARACTER SET latin1 NOT NULL,
  `Direccion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `NIT` varchar(14) CHARACTER SET latin1 NOT NULL,
  `NRC` varchar(7) CHARACTER SET latin1 NOT NULL,
  `Email` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `IdSucursal` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Direccion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Telefono` varchar(9) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`IdSucursal`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 'casitas santa ana centro', 'centro calle 5', '25854565');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoprecio`
--

CREATE TABLE `tipoprecio` (
  `IdTipoPrecio` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Utilidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipoprecio`
--

INSERT INTO `tipoprecio` (`IdTipoPrecio`, `Nombre`, `Utilidad`) VALUES
(1, 'NORMAL', 0.25),
(2, 'DESCUENTO', 0.1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `clave`, `rol`, `Estado`) VALUES
(1, 'sysadmin', '123', 'Administrador', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `IdVenta` int(100) NOT NULL,
  `IdSucursal` int(100) NOT NULL,
  `TipoVenta` char(1) CHARACTER SET latin1 NOT NULL,
  `IdTipoPrecio` int(100) NOT NULL,
  `Cliente` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Fecha` datetime NOT NULL,
  `IVA` double NOT NULL,
  `TotalGravado` double NOT NULL,
  `Total` double NOT NULL,
  `Direccion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Giro` varchar(100) CHARACTER SET latin1 NOT NULL,
  `NIT` varchar(14) CHARACTER SET latin1 NOT NULL,
  `NRC` varchar(7) CHARACTER SET latin1 NOT NULL,
  `NDocumento` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`IdVenta`, `IdSucursal`, `TipoVenta`, `IdTipoPrecio`, `Cliente`, `Fecha`, `IVA`, `TotalGravado`, `Total`, `Direccion`, `Giro`, `NIT`, `NRC`, `NDocumento`) VALUES
(1, 1, 'L', 1, '', '2017-10-22 21:42:18', 0, 4.67, 4.67, '', '', '', '', ''),
(2, 1, 'L', 1, '', '2017-10-24 07:52:43', 0, 2.8, 2.8, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaborrador`
--

CREATE TABLE `ventaborrador` (
  `IdBorrador` int(20) NOT NULL,
  `CodBarra` int(13) NOT NULL,
  `Producto` varchar(10) NOT NULL,
  `Cantidad` int(10) NOT NULL,
  `PrecioUnitario` double NOT NULL,
  `IdSucursal` int(20) NOT NULL,
  `Realizada` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`idbitacora`),
  ADD KEY `idUsuario_idx` (`idUsuario`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`IdCompra`,`IdSucursal`,`IdProveedor`) USING BTREE,
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `IdProveedor` (`IdProveedor`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`IdCompra`,`CodBarra`,`IdSucursal`) USING BTREE,
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `CodBarra` (`CodBarra`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`IdVenta`,`CodBarra`,`IdSucursal`),
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `CodBarra` (`CodBarra`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `IdSucursal_2` (`IdSucursal`),
  ADD KEY `CodBarra` (`CodBarra`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`IdParametro`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodBarra`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`IdSucursal`);

--
-- Indices de la tabla `tipoprecio`
--
ALTER TABLE `tipoprecio`
  ADD PRIMARY KEY (`IdTipoPrecio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`IdVenta`,`IdSucursal`,`IdTipoPrecio`),
  ADD KEY `IdTipoPrecio` (`IdTipoPrecio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `IdCompra` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `IdParametro` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IdProveedor` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `IdSucursal` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipoprecio`
--
ALTER TABLE `tipoprecio`
  MODIFY `IdTipoPrecio` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `IdVenta` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`IdSucursal`) REFERENCES `sucursal` (`IdSucursal`),
  ADD CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedor` (`IdProveedor`);

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `DetalleCompra_ibfk_1` FOREIGN KEY (`IdCompra`) REFERENCES `compra` (`IdCompra`),
  ADD CONSTRAINT `DetalleCompra_ibfk_2` FOREIGN KEY (`IdSucursal`) REFERENCES `inventario` (`IdSucursal`),
  ADD CONSTRAINT `DetalleCompra_ibfk_3` FOREIGN KEY (`CodBarra`) REFERENCES `producto` (`CodBarra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `DetalleVenta_ibfk_1` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`),
  ADD CONSTRAINT `DetalleVenta_ibfk_2` FOREIGN KEY (`IdSucursal`) REFERENCES `inventario` (`IdSucursal`),
  ADD CONSTRAINT `DetalleVenta_ibfk_3` FOREIGN KEY (`CodBarra`) REFERENCES `producto` (`CodBarra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DetalleVenta_1` FOREIGN KEY (`IdSucursal`) REFERENCES `sucursal` (`IdSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `Inventario_ibfk_1` FOREIGN KEY (`IdSucursal`) REFERENCES `sucursal` (`IdSucursal`),
  ADD CONSTRAINT `Inventario_ibfk_2` FOREIGN KEY (`CodBarra`) REFERENCES `producto` (`CodBarra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `Venta_ibfk_1` FOREIGN KEY (`IdTipoPrecio`) REFERENCES `tipoprecio` (`IdTipoPrecio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
