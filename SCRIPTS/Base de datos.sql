
-- Base de datos: `temp01`
-- Estructura de tabla para la tabla `historico`
--

CREATE TABLE `historico` (
  `idHistorico` int(100) NOT NULL,
  `tipodemovimiento` varchar(10) NOT NULL,
  `idUsuario` int(6) NOT NULL,
  `idProductos` int(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(100) NOT NULL,
  `nombreProductos` varchar(100) NOT NULL,
  `cantidadProductos` int(100) NOT NULL,
  `estatusProductos` varchar(10) NOT NULL,
  `idUsuario` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(2) NOT NULL,
  `tipoRol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `tipoRol`) VALUES
(1, 'Almacenista'),
(2, 'Administrador');

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  `idRol` int(2) NOT NULL,
  `estatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `correo`, `contrasena`, `idRol`, `estatus`) VALUES
(1, 'Jesus', 'jesus@tex.com', '123456', 1, 1),
(2, 'Roberto', 'roberto@tex.com', '123456', 2, 1);


--
-- Llaves de la tabla `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`idHistorico`),
  ADD KEY `idProductos` (`idProductos`),
  ADD KEY `Foranea` (`idUsuario`,`idProductos`) USING BTREE;

--
-- Llaves de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Llaves de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Llaves de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- autoincremento de la tabla `historico`
--
ALTER TABLE `historico`
  MODIFY `idHistorico` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- autoincremento de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- autoincremento de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- autoincremento de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Filtros para la tabla `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
