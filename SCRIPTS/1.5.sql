SELECT p.idProducto, p.nombre, p.precio
FROM productos p
JOIN ventas v ON p.idProducto = v.idProducto;
