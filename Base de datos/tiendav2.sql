-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2017 at 06:20 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiendav2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `idbitacora` int(11) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bitacora`
--

INSERT INTO `bitacora` (`idbitacora`, `idUsuario`, `fecha`, `accion`) VALUES
(3, 1, '2017-10-26 23:18:29', 'se hizo algo'),
(4, 1, '2017-10-27 04:17:53', 'Se modifico producto PUTAS DE LUJO'),
(5, 1, '2017-10-27 04:18:14', 'Se cerro la sesion');

-- --------------------------------------------------------

--
-- Table structure for table `compra`
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

--
-- Dumping data for table `compra`
--

INSERT INTO `compra` (`IdCompra`, `Fecha`, `IdProveedor`, `IdSucursal`, `TipoCompra`, `NumDocumento`, `Subtotal`, `IVA`, `Percepcion`, `Total`) VALUES
(1, '2017-10-26 20:53:30', 1, 3, 'L', '', 10, 0, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `detallecompra`
--

CREATE TABLE `detallecompra` (
  `IdCompra` int(100) NOT NULL,
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Cantidad` double NOT NULL,
  `CostoUnitario` double NOT NULL,
  `IdSucursal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `detallecompra`
--

INSERT INTO `detallecompra` (`IdCompra`, `CodBarra`, `Cantidad`, `CostoUnitario`, `IdSucursal`) VALUES
(1, '12345', 1, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `detalleventa`
--

CREATE TABLE `detalleventa` (
  `IdVenta` int(100) NOT NULL,
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Cantidad` double NOT NULL,
  `PrecioUnitario` double NOT NULL,
  `IdSucursal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `IdSucursal` int(100) NOT NULL,
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Cantidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`IdSucursal`, `CodBarra`, `Cantidad`) VALUES
(3, '12345', 11);

-- --------------------------------------------------------

--
-- Table structure for table `parametro`
--

CREATE TABLE `parametro` (
  `IdParametro` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Valor` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `CodBarra` varchar(13) CHARACTER SET latin1 NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`CodBarra`, `Nombre`, `Costo`) VALUES
('12345', 'PUTAS DE LUJO', 10);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
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

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`IdProveedor`, `Nombre`, `Telefono`, `Direccion`, `NIT`, `NRC`, `Email`) VALUES
(1, 'FULANO', '77777777', 'EN LA MIERDA', '12312312312312', '1111111', 'FULANITO@TUPUTAMADRE.COM');

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
--

CREATE TABLE `sucursal` (
  `IdSucursal` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Direccion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Telefono` varchar(9) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `sucursal`
--

INSERT INTO `sucursal` (`IdSucursal`, `Nombre`, `Direccion`, `Telefono`) VALUES
(3, 'CASA MATRIZ', 'KJSADHOFI', '23412341');

-- --------------------------------------------------------

--
-- Table structure for table `tipoprecio`
--

CREATE TABLE `tipoprecio` (
  `IdTipoPrecio` int(100) NOT NULL,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Utilidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `tipoprecio`
--

INSERT INTO `tipoprecio` (`IdTipoPrecio`, `Nombre`, `Utilidad`) VALUES
(1, 'NORMAL', 0.25);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `clave`, `rol`, `estado`) VALUES
(1, 'admin', 'admin', 'Administrador', 'Activo');

-- --------------------------------------------------------

--
-- Table structure for table `venta`
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
  `NDocumento` varchar(100) CHARACTER SET latin1 NOT NULL,
  `PAC` double NOT NULL,
  `utilidad` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`idbitacora`),
  ADD KEY `idUsuario_idx` (`idUsuario`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`IdCompra`,`IdSucursal`,`IdProveedor`) USING BTREE,
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `IdProveedor` (`IdProveedor`);

--
-- Indexes for table `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`IdCompra`,`CodBarra`,`IdSucursal`) USING BTREE,
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `CodBarra` (`CodBarra`);

--
-- Indexes for table `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`IdVenta`,`CodBarra`,`IdSucursal`),
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `CodBarra` (`CodBarra`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD KEY `IdSucursal` (`IdSucursal`),
  ADD KEY `IdSucursal_2` (`IdSucursal`),
  ADD KEY `CodBarra` (`CodBarra`);

--
-- Indexes for table `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`IdParametro`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodBarra`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indexes for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`IdSucursal`);

--
-- Indexes for table `tipoprecio`
--
ALTER TABLE `tipoprecio`
  ADD PRIMARY KEY (`IdTipoPrecio`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`IdVenta`,`IdSucursal`,`IdTipoPrecio`),
  ADD KEY `IdTipoPrecio` (`IdTipoPrecio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `IdCompra` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `parametro`
--
ALTER TABLE `parametro`
  MODIFY `IdParametro` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IdProveedor` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `IdSucursal` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipoprecio`
--
ALTER TABLE `tipoprecio`
  MODIFY `IdTipoPrecio` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `IdVenta` int(100) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`IdSucursal`) REFERENCES `sucursal` (`IdSucursal`),
  ADD CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedor` (`IdProveedor`);

--
-- Constraints for table `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `DetalleCompra_ibfk_1` FOREIGN KEY (`IdCompra`) REFERENCES `compra` (`IdCompra`),
  ADD CONSTRAINT `DetalleCompra_ibfk_2` FOREIGN KEY (`IdSucursal`) REFERENCES `inventario` (`IdSucursal`),
  ADD CONSTRAINT `DetalleCompra_ibfk_3` FOREIGN KEY (`CodBarra`) REFERENCES `producto` (`CodBarra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `DetalleVenta_ibfk_1` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`),
  ADD CONSTRAINT `DetalleVenta_ibfk_2` FOREIGN KEY (`IdSucursal`) REFERENCES `inventario` (`IdSucursal`),
  ADD CONSTRAINT `DetalleVenta_ibfk_3` FOREIGN KEY (`CodBarra`) REFERENCES `producto` (`CodBarra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DetalleVenta_1` FOREIGN KEY (`IdSucursal`) REFERENCES `sucursal` (`IdSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `Inventario_ibfk_1` FOREIGN KEY (`IdSucursal`) REFERENCES `sucursal` (`IdSucursal`),
  ADD CONSTRAINT `Inventario_ibfk_2` FOREIGN KEY (`CodBarra`) REFERENCES `producto` (`CodBarra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `Venta_ibfk_1` FOREIGN KEY (`IdTipoPrecio`) REFERENCES `tipoprecio` (`IdTipoPrecio`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
