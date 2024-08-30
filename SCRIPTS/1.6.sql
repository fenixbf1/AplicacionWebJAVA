SELECT p.idProducto, p.nombre, p.precio, SUM(v.cantidad) AS total_vendido
FROM productos p
JOIN ventas v ON p.idProducto = v.idProducto
GROUP BY p.idProducto, p.nombre, p.precio;
